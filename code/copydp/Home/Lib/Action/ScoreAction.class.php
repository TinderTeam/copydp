<?php
// 本类由系统自动生成，仅供测试用途
class ScoreAction extends Action {
	public function score(){
	    $this->display();
	}
	public function score_info($productID=0){
		$this->assign('productID',$productID);
	    $this->display();
	}
	
	 public function order($productID=0,$quantity=0){
		$this->assign('productID',$productID);
		$this->assign('quantity',$quantity);
		$this->display();
    }
	
	public function orderCommit(){
		$customer_id=$_POST['customer_id'];
		$product_id=$_POST['product_id'];
		$quantity=$_POST['quantity'];
		
		$datetime=date('Y-m-d H:i:s',time());
		
		$product=new Model('view_product');
		$productIDCondition['product_id']  = $product_id;
		$productItem=$product->where($productIDCondition)->find();
		//进行下单逻辑处理
		$orderID=$product_id.$customer_id.strtotime($datetime);
		$orderName=$productItem['name']."¥".$productItem['price']."×".$quantity;
		
			$order = M('order');
			$data2['order_id']=$orderID;			
			$data2['order_name']=$orderName;
			$data2['customer_id']=$customer_id;
			$data2['product_id']=$product_id;
			$data2['product_name']=$productItem['name'];
			$data2['product_description']=$productItem['dscr'];
			$data2['product_seller']=$productItem['seller_id'];
			$data2['order_time']=$datetime;
			$data2['order_price']=$productItem['price'];
			$data2['order_original_price']=$productItem['original_price'];
			$data2['quantity']=$quantity;
			$data2['order_status']='已下单';		
			$order->add($data2);
			
		$this->assign('productID',$product_id);
		$this->assign('quantity',$quantity);
		$this->assign('orderID',$orderID);
		$this->assign('orderName',$orderName);
		
		$this->display();
		//$this->success("下单成功");
	}
}
?>