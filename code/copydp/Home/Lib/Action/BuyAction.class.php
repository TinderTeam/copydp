<?php
// 本类由系统自动生成，仅供测试用途
class BuyAction extends Action {

    public function order($productID=0,$quantity=0){
		if(empty($_SESSION['login_user'])){								
			$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("请先登录系统!");	
		}
		//获取用户信息
		$db=new Model('user');
		$userName=$_SESSION['login_user'];
		$condition['username']=$userName;	
		$role =  $db->where($condition)->getField('role');
		$userID = $db->where($condition)->getField('user_id');
		
		if($role!='CUSTOMER'){
			$this->assign("jumpUrl","__APP__/Index/index");
			$this->error("您使用的账户类型不能进行此操作!");	
		}
		else
		{
			$dbProduct =new Model('product');
			$productCondition['product_id'] = $productID;
			$privilege = $dbProduct->where($productCondition)->getField('svip_privilege');
			
			$dbCustomer = new Model('customer');
			$IDCondition['user_id'] = $userID;
			$grade = $dbCustomer->where($IDCondition)->getField('grade');
			
			if(($privilege=="专享")&&($grade=="VIP"))
			{
				$this->assign("jumpUrl","__APP__/Buy/product_info?productID=".$productID);
				$this->error("此产品为SVIP客户专享产品，请升级为SVIP之后再购买");
			}
			
			$this->assign('productID',$productID);
			$this->assign('quantity',$quantity);
			$this->display();	
		}	
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
	public function ajaxSearch($data){
		$array = explode("-",$data);
		$keyword=urldecode($array[0]);
		$product = new Model('product');
		$map="name like('%".$keyword."%') ";
		$productCount = $product->where($map)->count();
		if($keyword=='')
		{
			$this->ajaxReturn('false', '请输入关键词', 1);
		}
		elseif($productCount==0)
		{
			$this->ajaxReturn('false', '没有搜索到相关信息', 1);
		}
		else
		{
			$this->ajaxReturn('true', '搜索成功', 1);
		}
	}
	
	public function searchProduct($key=0){		
		$typeRoot=0;
		$search='true';
		$keyword='%'.$key.'%';
		$this->assign('typeRoot',$typeRoot);
		$this->assign('keyword',$keyword);
		$this->assign('search',$search);
		$this->display('product_list');
	}
}