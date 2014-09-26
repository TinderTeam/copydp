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
	
	public function sellesInfo(){
	//获取用户名、手机号码、积分
	$userName=$_SESSION['login_user'];
	$condition['username'] = $userName;
	$user = M('user');
	$userID = $user->where($condition)->getField('user_id');
	$this->assign('userName',$userName);
	
	//获取订单信息
	$condition1['seller_id']=$userID;
	$order = M('order');
	$orderCount = $order->where($condition1)->count();
	$orderList = $order->where($condition1)->select();
	$this->assign('orderList',$orderList);
	
	
	//获取产品信息
	$product = M('product');
	$productCount = $product->where($condition1)->count();
	$productList = $product->where($condition1)->select();
	$this->assign('productList',$productList);
	
	$this->display();
    }
	public function confirmOrder($order_id=0){
	$order = M('order');
	$condition['order_id'] = $order_id;
	$data['order_status']="已使用";

	if($order->where($condition)->save($data))
		{
			$this->assign("jumpUrl","__APP__/Admin/sellesInfo");
			$this->success("操作成功");
		} 
	else
		{
			$this->assign("jumpUrl","__APP__/Admin/sellesInfo");
			$this->error("操作失败，请重新确认");
		}
    }
	public function hideOrder($order_id=0){
	$order = M('order');
	$condition['order_id'] = $order_id;
	$data['seller_id']=0;

	if($order->where($condition)->save($data))
		{
			$this->assign("jumpUrl","__APP__/Admin/sellesInfo");
			$this->success("删除成功");
		} 
	else
		{
			$this->assign("jumpUrl","__APP__/Admin/sellesInfo");
			$this->error("删除失败，请重新删除");
		}
    }
	
	
}
?>