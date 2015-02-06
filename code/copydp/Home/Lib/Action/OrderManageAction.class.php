<?php
// 本类由系统自动生成，仅供测试用途
class OrderManageAction extends Action {

	public function updateOrder(){
		//产品截至时间到期，且处于已下单状态的订单更新为已过期	
		//更新订单状态
		$product = M('product');
		$order = M('order');
		$condition1['end_date_time']=array('LT',date('Y-m-d H:i:s',time()));			//判断截至时间小于当前时间的条件
		
		$countOldProduct = $product->where($condition1)->count();
		$oldProductID = $product->where($condition1)->getField('product_id',true);		//查找已过期产品
		for($i=0;$i<$countOldProduct;$i++)
		{
			$condition2['product_id'] = $oldProductID[$i];
			$data['order_status']="已过期";
			$order->where($condition2)->where('order_status="已下单"')->save($data);		//更新订单状态
		}
	}
	
    public function index(){
		
		if($_SESSION['login_user']!=""){
			
			//产品截至时间到期，且处于已下单状态的订单更新为已过期
			$this->updateOrder();
			$order = M('view_order');		
			$this->updateOrder();
			
			//获取订单信息
			if($_POST['orderDate']!=""){
				$OrderCondition['order_time']=$_POST['orderDate'];
			}
			if($_POST['orderStatus']!=""){
				$OrderCondition['order_status']=$_POST['orderStatus'];
			}
			if($_POST['userName']!=""){
				$OrderCondition['username']=$_POST['userName'];
			}
			if($_POST['phoneNum']!=""){
				$OrderCondition['cellphone']=$_POST['phoneNum'];
			}
			if($_POST['userType']!=""){
				$OrderCondition['grade']=$_POST['userType'];
			}
			if($_POST['typeID']!=""){
				$OrderCondition['type_id']=$_POST['typeID'];
			}
			if($_POST['orderID']!=""){
				$OrderCondition['order_id']=$_POST['orderID'];
			}
			if($_POST['orderName']!=""){
				$OrderCondition['order_name']=$_POST['orderName'];
			}
			

			$orderCount = $order->where($OrderCondition)->count();
			$orderList = $order->where($OrderCondition)->select();
			
			$this->assign('orderList',$orderList);
			
			$this->assign("currentPage","order");				
			$this->display();
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}	
    }
	
	public function abolishOrder($order_id=0){
	$order = M('order');
	$condition['order_id'] = $order_id;
	$data['order_status']="已作废";

	if($order->where($condition)->save($data))
		{
			$this->assign("jumpUrl","__APP__/OrderManage/index");
			$this->success("操作成功");
		} 
	else
		{
			$this->assign("jumpUrl","__APP__/OrderManage/index");
			$this->error("操作失败，请重新确认");
		}
    }
	
}
?>