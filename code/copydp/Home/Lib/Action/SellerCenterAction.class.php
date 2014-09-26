<?php
// 本类由系统自动生成，仅供测试用途
class SellerCenterAction extends Action {

   public function newProduct(){
		$this->assign("newProduct",true);
		$this->display('productEdit');
	}
	public function productEdit($productID=0){	
		$this->assign("newProduct",false);
		$this->assign("productID",$productID);
		$this->display();
	}
	public function seller_edit(){
	$this->display();
    }
	
	public function seller_manager(){
	$this->display();
    }
	
	public function sellesInfo($filter_type=0){

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
	
	//获取商家ID
	$condition['username'] = $_SESSION['login_user'];
	$user = M('user');
	$userID = $user->where($condition)->getField('user_id');
	$condition3['seller_id'] = $userID;

	//获取订单信息
	if($filter_type=='all')
	{
		$orderCount = $order->where($condition3)->count();
		$orderList = $order->where($condition3)->select();
		
	}
	elseif($filter_type=="cancel")
	{
		$orderCount = $order->where($condition3)->where('order_status="已取消"')->count();
		$orderList = $order->where($condition3)->where('order_status="已取消"')->select();
	}
	elseif($filter_type=='used')
	{
		$orderCount = $order->where($condition3)->where('order_status="已使用"')->count();
		$orderList = $order->where($condition3)->where('order_status="已使用"')->select();
	}
	elseif($filter_type=='out')
	{
		$orderCount = $order->where($condition3)->where('order_status="已过期"')->count();
		$orderList = $order->where($condition3)->where('order_status="已过期"')->select();
	}
	elseif($filter_type=='place')
	{
		$orderCount = $order->where($condition3)->where('order_status="已下单"')->count();
		$orderList = $order->where($condition3)->where('order_status="已下单"')->select();
		
	}
	else
	{
		$orderCount = $order->where($condition3)->where('product_id='.$filter_type)->count();
		$orderList = $order->where($condition3)->where('product_id='.$filter_type)->select();
	}
	$this->assign('orderList',$orderList);
	$filter_type='all';		//设置初始值，如果重新点击商家中心，刷新页面，显示所有订单
	
	//获取产品信息
	$product = M('product');
	$productCount = $product->where($condition3)->count();
	$productList = $product->where($condition3)->select();
	$this->assign('productList',$productList);
	
	
	$this->display();
    }

	
	public function confirmOrder($order_id=0){
	$order = M('order');
	$condition['order_id'] = $order_id;
	$data['order_status']="已使用";

	if($order->where($condition)->save($data))
		{
			$this->assign("jumpUrl","__APP__/SellerCenter/sellesInfo");
			$this->success("操作成功");
		} 
	else
		{
			$this->assign("jumpUrl","__APP__/SellerCenter/sellesInfo");
			$this->error("操作失败，请重新确认");
		}
    }
	
	public function hideOrder($order_id=0){
	$order = M('order');
	$condition['order_id'] = $order_id;
	$data['seller_id']=0;

	if($order->where($condition)->save($data))
		{
			$this->assign("jumpUrl","__APP__/SellerCenter/sellesInfo");
			$this->success("删除成功");
		} 
	else
		{
			$this->assign("jumpUrl","__APP__/SellerCenter/sellesInfo");
			$this->error("删除失败，请重新删除");
		}
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
	
	
}
?>