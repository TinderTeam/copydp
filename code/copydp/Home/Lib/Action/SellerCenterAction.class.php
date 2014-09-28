<?php
// 本类由系统自动生成，仅供测试用途
class SellerCenterAction extends Action {

   public function newProduct($sellerID=0){
		$this->assign("newProduct",true);
		$this->assign("sellerID",$sellerID);
		$this->display('productEdit');
	}
	public function productEdit($productID=0){	
		$this->assign("newProduct",false);
		$this->assign("productID",$productID);
		$this->display();
	}
	public function productDelete($productID=0){	
		//
		$product = M('product');
		$conditionDelete['product_id'] = $productID;
		if($product->where($conditionDelete)->delete())
		{
			$this->assign("jumpUrl","__APP__/SellerCenter/sellesinfo");
			$this->success("删除成功");
		} 
		else
		{
			$this->assign("jumpUrl","__APP__/SellerCenter/sellesinfo");
			$this->error("删除失败，请重试");
		}
	}
	public function seller_edit(){
	$this->display();
    }
	
	public function saveProduct(){
		//导入图片上传类  
        import("ORG.Net.UploadFile");  
        //实例化上传类  
        $upload = new UploadFile();  
        $upload->maxSize = 4145728; 
        //$upload->saveRule=time; 
		//设置文件上传类型  
        $upload->allowExts = array('jpg','gif','png','jpeg');  
        //设置文件上传位置  
        $upload->savePath = "./Public/uploads/img/";//这里说明一下，由于ThinkPHP是有入口文件的，所以这里的./Public是指网站根目录下的Public文件夹  
        //设置文件上传名(按照时间)  
        //$upload->saveRule = "time";  
        if (!$upload->upload()){  
			$errMsg=($upload->getErrorMsg());				
        }else{  
            //上传成功，获取上传信息  
            $info = $upload->getUploadFileInfo();  
			$data2['imgsrc']=$info[0]['savename'];
        }    
        
		//获取商家ID
		$userIDCondition['username'] = $_SESSION['login_user'];
		$user = M('user');
		$seller_id = $user->where($userIDCondition)->getField('user_id');
		
		//保存表单数据，包括上传的图片
		
		$product = M('product');
		$data2['name']=$_POST['name'];			
		$data2['update_date']=date('Y-m-d',time());
		$data2['describe']=$_POST['describe'];	
		$data2['seller_id']=$seller_id;	
		$data2['basic_infor']=$_POST['info'];	
		$data2['type_id']=$_POST['type_id'];	
		$data2['price']=$_POST['price'];	
		$data2['original_price']=$_POST['original_price'];	
		$data2['end_date_time']=$_POST['end_date_time'];
		if($_POST['svip_privilege']=='on'){		
			$data2['svip_privilege']='特权专属';
		}else{
			$data2['svip_privilege']='普通';
		}
		
		$data2['imglist']=$_POST['imglist'];	
		$data2['product_status']='待审核';			
		
		if($_POST['product_id']!=''){
			$IDcondition['product_id']=$_POST['product_id'];
			$product->where($IDcondition)->save($data2);
		}else{	
			$product->add($data2);
		}

		$this->redirect('SellerCenter/sellesInfo');
		//$this->display('sellesInfo');
		//$this->assign("jumpUrl","sellesInfo");
		//$this->success("成功提交");
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