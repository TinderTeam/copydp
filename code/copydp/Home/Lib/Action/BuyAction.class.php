<?php
// 本类由系统自动生成，仅供测试用途
class BuyAction extends Action {

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
			$data2['seller_id']=$productItem['seller_id'];
			$data2['imgsrc']=$productItem['imgsrc'];
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
	
	public function product_info($productID=0){
		//最近浏览记录里增加相关内容
		
		session_start();	
		$historyList=$_SESSION['history'];
		$inSession = false;
		for($i=0;$i<count($historyList);$i++){
			if($historyList[$i]==$productID){
				$inSession=true;
				break;
			}
		}
		
		if(!$inSession){
			$historyList[count($historyList)]=$productID;
			$_SESSION['history']=$historyList;
		}
		
		$this->assign('productID',$productID);
		$this->display();
    }
	
	public function product_list(){
		$typeRoot=0;
		$this->assign('typeRoot',$typeRoot);
		$this->display();
    }
	
	public function recommend_product_info($id=0){
		$this->display();
    }
	
	public function cancelFilter($crtCdtItm=0){
	
		if($crtCdtItm!=0){
			$typeDB=new Model('product_type');
			$typeIDCondition['type_id']=$crtCdtItm;
			$typeRoot=$typeDB->where($typeIDCondition)->getField('father_id');
			$this->assign('typeRoot',$typeRoot);
		}
		$this->display('product_list');
	}
	
	public function typeSelect($SelectType=0){
		
		$typeRoot=$SelectType;
		$this->assign('typeRoot',$typeRoot);
		$this->display('product_list');
	}
	
	public function searchProduct(){		
		$typeRoot=0;
		$search='true';
		$keyword='%'.$_POST['keyword'].'%';
		$this->assign('typeRoot',$typeRoot);
		$this->assign('keyword',$keyword);
		$this->assign('search',$search);
		$this->display('product_list');
	}
}