<?php
// 本类由系统自动生成，仅供测试用途
class OrderManageAction extends Action {
    public function index($filter_type=0){
		
		if($_SESSION['login_user']!=""){
			
			//产品截至时间到期，且处于已下单状态的订单更新为已过期
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

			//获取订单信息
			if($filter_type=='all')
			{
				$orderCount = $order->count();
				$orderList = $order->select();
				
			}
			elseif($filter_type=="cancel")
			{
				$orderCount = $order->where('order_status="已取消"')->count();
				$orderList = $order->where('order_status="已取消"')->select();
			}
			elseif($filter_type=="abolish")
			{
				$orderCount = $order->where('order_status="已作废"')->count();
				$orderList = $order->where('order_status="已作废"')->select();
			}
			elseif($filter_type=='used')
			{
				$orderCount = $order->where('order_status="已使用"')->count();
				$orderList = $order->where('order_status="已使用"')->select();
			}
			elseif($filter_type=='out')
			{
				$orderCount = $order->where('order_status="已过期"')->count();
				$orderList = $order->where('order_status="已过期"')->select();
			}
			elseif($filter_type=='place')
			{
				$orderCount = $order->where('order_status="已下单"')->count();
				$orderList = $order->where('order_status="已下单"')->select();
				
			}
			else
			{
				$orderCount = $order->where('product_id='.$filter_type)->count();
				$orderList = $order->where('product_id='.$filter_type)->select();
			}
			$this->assign('orderList',$orderList);
			$filter_type='all';		//设置初始值，如果重新点击商家中心，刷新页面，显示所有订单
			
			//获取产品信息
			$product = M('product');
			$productCount = $product->count();
			$productList = $product->select();
			$this->assign('productList',$productList);
			
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