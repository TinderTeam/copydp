<?php
// 本类由系统自动生成，仅供测试用途
class UserCenterAction extends Action {

	public function admire($data){
	
		//获取用户名、手机号码、积分
	
		$array = explode("-",$data);
		$orderID=$array[0];
		$type=$array[1];
		$value=$array[2];
		$content=$array[3];
		
		$orderIDcondition['order_id'] = $orderID;
		$orderDB = M('order');
		$userID = $orderDB->where($orderIDcondition)->getField('customer_id');
		$productID = $orderDB->where($orderIDcondition)->getField('product_id');
		$sellerID = $orderDB->where($orderIDcondition)->getField('seller_id');
		
	
		if($type=='product' ){
			$productEvaDB = M('product_evaluation');
			$pEvaCustomerIDConditin['order_id']=$orderID;
			$pevaID=$productEvaDB->where($pEvaCustomerIDConditin)->getField('product_eva_id');			
			
			$pEvaData['customer_id']=$userID;
			$pEvaData['product_id']=$productID;
			$pEvaData['datetime']=date('Y-m-d H:i:s',time());
			$pEvaData['score_product']=$value/10;
			$pEvaData['eva_content']=$content;
			$pEvaData['order_id']=$orderID;
			
			if($pevaID==null){
			
				//新增
				$productEvaDB->add($pEvaData);
			}else{
				//更新
				$pEvaCondition['product_eva_id']=$pevaID;
				$productEvaDB->where($pEvaCondition)->save($pEvaData);

			}
			
		}else{
			//环境和服务
			$sellerEvaDB = M('seller_evaluation');
			$sEvaCustomerIDConditin['order_id']=$orderID;
			$sEvaID=$sellerEvaDB->where($sEvaCustomerIDConditin)->getField('seller_eva_id');			
			$sEvaData['customer_id']=$userID;
			$sEvaData['seller_id']=$sellerID;
			$sEvaData['datetime']=date('Y-m-d H:i:s',time());		
			if($type=='service'){
				$sEvaData['score_service']=$value/10;
			}else if($type=='environment'){
				$sEvaData['score_environment']=$value/10;
			}		
			$sEvaData['eva_content']=$content;
			$sEvaData['order_id']=$orderID;
			if($sEvaID==null){
				//新增
				$sellerEvaDB->add($sEvaData);
			}else{
				//更新
				$sEvaCondition['seller_eva_id']=$sEvaID;
				$sellerEvaDB->where($sEvaCondition)->save($sEvaData);
			}			
		}
		
		$this->ajaxReturn(null, 'Ajax 成功！', 1);
	}
	
	public function myOrder(){
		$userName=$_SESSION['login_user'];
		$condition['username'] = $userName;
		$viewOrder = M('view_order');
		
		//产品截至时间到期，且处于已下单状态的订单更新为已过期
		$product = M('product');
		$order = M('order');
		$condition1['end_date_time']=array('LT',date('Y-m-d H:i:s',time()));	//判断截至时间小于当前时间的条件
		
		$countOldProduct = $product->where($condition1)->count();
		$oldProductID = $product->where($condition1)->getField('product_id',true);	//查找已过期产品
		
		for($i=0;$i<$countOldProduct;$i++)
		{
			$condition2['product_id'] = $oldProductID[$i];
			$data['order_status']="已过期";
			$order->where($condition2)->where('order_status="已下单"')->save($data);		//更新订单状态
		}
		//显示订单列表
		$orderCount = $viewOrder->where($condition)->count();
		$orderList = $viewOrder->where($condition)->select();
		$this->assign('orderList',$orderList);
	
		$this->display();
	}
	public function myActivity(){
		$userName=$_SESSION['login_user'];
		$condition['username'] = $userName;
	
		//显示活动列表
		$user = M('user');
		$user_id = $user->where($condition)->getField('user_id');
		$condition1['customer_id'] = $user_id; 
		$activity_order = M('activity_order');
		$activityList = $activity_order->where($condition1)->select();
		$this->assign('activityList',$activityList);
		$this->display();
	}
	public function myMark(){
		$userName=$_SESSION['login_user'];
		$condition['username'] = $userName;

				
		//获取收藏列表
		$collect = M('view_collect');
		$collectList = $collect->where($condition)->select();
		$this->assign('collectList',$collectList);
		$this->display();

	}
	   
    public function userinfo(){
	
	//获取用户名、手机号码、积分
	$userName=$_SESSION['login_user'];
	$condition['username'] = $userName;
	$viewCustomer = M('view_customer');
	$customer = $viewCustomer->where($condition)->find();
	$cellphone = $customer['cellphone'];
	$score = $customer['score'];
	$this->assign('userName',$userName);
	$this->assign('cellphone',$cellphone);
	$this->assign('score',$score);
	
	//获取未使用、待评价数目
	$viewOrder = M('view_order');
	$notUsedNum = $viewOrder->where($condition)->where('order_status="已下单"')->count();
	$evaluationNum = $viewOrder->where($condition)->where('order_status="已使用"')->count();
	
	//获取待评价产品
	$orderEva = $viewOrder->where($condition)->where('order_status="已使用"')->select();
	$this->assign('notUsedNum',$notUsedNum);
	$this->assign('evaluationNum',$evaluationNum);
	$this->assign('orderEva',$orderEva);
	
	$this->display();

    }
	
	public function cancelOrder($order_id=0){
	$order = M('order');
	$condition['order_id'] = $order_id;
	$data['order_status']="已取消";

	if($order->where($condition)->save($data))
		{
			$this->assign("jumpUrl","__APP__/UserCenter/userinfo");
			$this->success("成功取消");
		} 
	else
		{
			$this->assign("jumpUrl","__APP__/UserCenter/userinfo");
			$this->error("操作失败，请重新取消");
		}
    }
	
	public function deleteOrder($order_id=0){
	$order = M('order');
	$condition['order_id'] = $order_id;
	if($order->where($condition)->delete())
		{
			$this->assign("jumpUrl","__APP__/UserCenter/userinfo");
			$this->success("删除成功");
		}
	else
		{
			$this->assign("jumpUrl","__APP__/UserCenter/userinfo");
			$this->error("删除失败，请重新操作");
		}

    }
	
	public function cancelActivity($activity_id=0){
	
	$user = M('user');
	$userName=$_SESSION['login_user'];
	$condition['username'] = $userName;
	$user_id = $user->where($condition)->getField('user_id');
	$condition1['customer_id'] = $user_id;
	
	$activity_order = M('activity_order');
	
	if($activity_order->where($condition1)->where('activity_id='.$activity_id)->delete())
		{
			$this->assign("jumpUrl","__APP__/UserCenter/userinfo");
			$this->success("成功取消");
		} 
	else
		{
			$this->assign("jumpUrl","__APP__/UserCenter/userinfo");
			$this->error("操作失败，请重新取消");
		}
    }
	
}
?>