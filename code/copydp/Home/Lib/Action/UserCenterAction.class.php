<?php
// 本类由系统自动生成，仅供测试用途
class UserCenterAction extends Action {
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
	
	//显示订单列表
	$orderCount = $viewOrder->where($condition)->count();
	$orderList = $viewOrder->where($condition)->select();
	$this->assign('orderList',$orderList);
	
	//显示活动列表
	$user = M('user');
	$user_id = $user->where($condition)->getField('user_id');
	$condition1['customer_id'] = $user_id; 
	$activity_order = M('activity_order');
	$activityList = $activity_order->where($condition1)->select();
	$this->assign('activityList',$activityList);
	
	//获取收藏列表
	$collect = M('view_collect');
	$collectList = $collect->where($condition)->select();
	$this->assign('collectList',$collectList);
	
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