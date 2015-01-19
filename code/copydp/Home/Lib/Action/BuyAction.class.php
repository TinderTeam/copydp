<?php
// 本类由系统自动生成，仅供测试用途
class BuyAction extends BuyServiceAction {

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
			$privilege = $dbProduct->where($productCondition)->getField('svip_product_id');
			
			$dbCustomer = new Model('customer');
			$IDCondition['user_id'] = $userID;
			$grade = $dbCustomer->where($IDCondition)->getField('grade');
			
			trace($info,'$privilege='.$privilege.";grade=".$grade);
			//购买商品校验
			if($privilege!="普通")
			{
				if($grade=="VIP"){
					$this->assign("jumpUrl","__APP__/Buy/product_info?productID=".$productID);
					$this->error("此产品为SVIP客户专享产品，请升级为SVIP之后再购买");
				}
				else {
					
					$svipProductdb= M('view_svip_product');
					$productCondition['svip_product_id']=$privilege;
					$svipProduct = $svipProductdb->where($productCondition)->select();
					//获取限制信息
					$limnum=$svipProduct[0]['limit_consumption_num'];
					$limtype=$svipProduct[0]['limit_consumption_period'];
					trace($info,'限制信息为：'.$limtype.$limnum.'次');
					$standDiff=0;
					
					if($limtype=='每周'){
						$standDiff=7;
					}else if($limtype=='每月'){
						$standDiff=30;
					}else if($limtype=='每年'){
						$standDiff=365;
					}
					
					//获取该客户的该类商品购买信息
					$svipOrderDB=M('view_svip_product_order');					
					$SVIPOrderCondition['custoemr_id'] = $userID;
					$SVIPOrderCondition['svip_product_id'] = $privilege;
					$svipOrderList=$svipOrderDB->where($SVIPOrderCondition)->select();
					$num=0;
					foreach( $svipOrderList as $svipOrder){
						$orderDate=$svipOrder['datetime'];
						$diff=(date('y-m-d h:i:s',time())-$orderDate)/(3600*24);											
						if($diff<$standDiff){
							$num=$num+1;
						}
					}				
					if($num>=$limnum){
						$this->assign("jumpUrl","__APP__/Buy/product_info?productID=".$productID);
						$this->error("您已超过专属产品消费次数限制，该产品限制为".$limtype.$limnum.'次');
					}
				}
			}
			
			$this->assign('productID',$productID);
			$this->assign('quantity',$quantity);
			$this->display();	
		}	
    }
    //APP获取产品订单列表
    public function ProductOrder_rest(){
    
        $this->doAuth();
        $req =  $this->getReqObj();
        $userID = $req->userID;
        $this->log($userID);
        $productOrderListResult = parent::ProductOrderService($userID);
    
        $errorCode = $productOrderListResult['errorCode'];
        if($productOrderListResult['orderList']==false)
        {
            $productOrderListResult['orderList'] = null;
        }
        $Rsp['orderList'] = $productOrderListResult['orderList'];
        $this->returnJson($errorCode,$Rsp);
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
			$data2['order_price']=$productItem['price']*$quantity;
			$data2['order_original_price']=$productItem['original_price']*$quantity;
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
	//APP产品下单
	public function CreateOrder_rest(){
	
	    $this->doAuth();
	    $req =  $this->getReqObj();
	    $orderInfo['userID'] = $req->userID;
	    $orderInfo['productID'] = $req->productID;
	    $orderInfo['quantity'] = $req->quantity;
	    $this->log($orderInfo);
	    $createOrderResult = parent::CreateOrderService($orderInfo);
	
	    $errorCode = $createOrderResult['errorCode'];
	    if($createOrderResult['productOrder']==false)
	    {
	        $createOrderResult['productOrder'] = null;
	    }
	    $Rsp['productOrder'] = $createOrderResult['productOrder'];
	    $this->returnJson($errorCode,$Rsp);
	}
	//APP取消订单
	public function CancelOrder_rest(){
	
	    $this->doAuth();
	    $req =  $this->getReqObj();
	    $orderInfo['orderID'] = $req->orderID;
	    $this->log($orderInfo);
	    $cancelOrderResult = parent::CancelOrderService($orderInfo);
	
	    $errorCode = $cancelOrderResult['errorCode'];
	    $this->returnJson($errorCode,null);
	}
	//APP删除订单
	public function DeleteOrder_rest(){
	
	    $this->doAuth();
	    $req =  $this->getReqObj();
	    $orderInfo['orderID'] = $req->orderID;
	    $this->log($orderInfo);
	    $deleteOrderResult = parent::DeleteOrderService($orderInfo);
	    
	    $errorCode = $deleteOrderResult['errorCode'];
	    $this->returnJson($errorCode,null);
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
    //APP获取产品类型列表
    public function GetProdutType_rest(){
    
        $productTypeDB = new Model('product_type');
        $productTypeList = $productTypeDB->select();
        
        $errorCode = SUCCESS;
        if($productTypeList==false)
        {
            $productTypeList = null;
        }
        $Rsp['typeList'] = $productTypeList;
        $this->returnJson($errorCode,$Rsp);
    }
	public function product_list(){
		$typeRoot=0;
		$this->assign('typeRoot',$typeRoot);
		$this->display();
    }
    //APP获取所有产品列表
    public function AllProduct_rest(){
        
        $req =  $this->getReqObj();
        $searchInfo['city'] = $req->city;
        $searchInfo['zone_id']=$req->zone_id;
        $searchInfo['typeRoot'] = $req->typeRoot;
        $searchInfo['keyWord'] = $req->keyWord;
        $searchInfo['search'] = $req->search;
        $this->log($searchInfo);
        
        $productListResult = parent::AllProductService($searchInfo);
        
        $errorCode = $productListResult['errorCode'];
        if($productListResult['productList']==false)
        {
            $productListResult['productList']=null;
        }
        $Rsp['productList'] = $productListResult['productList'];
        $this->returnJson($errorCode,$Rsp);
        
    }
	public function recommend_product_info($id=0){
		$this->display();
    }
    //APP获取推荐产品列表
    public function RecommendProduct_rest(){
        
        $req =  $this->getReqObj();
        $city = $req->city;
        $this->log($city);
        $productListResult = parent::recommendProductService($city);
        
        $errorCode = $productListResult['errorCode'];
        if($productListResult['productList']==false)
        {
            $productListResult['productList']=null;
        }
        $Rsp['productList'] = $productListResult['productList'];
        $this->returnJson($errorCode,$Rsp);
    }
    //APP获取最新特惠产品列表
    public function NewProduct_rest(){
    
        $req =  $this->getReqObj();
        $city = $req->city;
        $this->log($city);
        $productListResult = parent::NewProductService($city);
    
        $errorCode = $productListResult['errorCode'];
        if($productListResult['productList']==false)
        {
            $productListResult['productList']=null;
        }
        $Rsp['productList'] = $productListResult['productList'];
        $this->returnJson($errorCode,$Rsp);
    }
    //APP获取分类推荐产品列表
    public function TypeRecProduct_rest(){
    
        $req =  $this->getReqObj();
        $typeInfo['city'] = $req->city;
        $typeInfo['typeRoot'] = $req->typeRoot;
        $this->log($typeInfo);
        $productListResult = parent::TypeRecProductService($typeInfo);
    
        $errorCode = $productListResult['errorCode'];
        if($productListResult['productList']==false)
        {
            $productListResult['productList']=null;
        }
        $Rsp['productList'] = $productListResult['productList'];
        $this->returnJson($errorCode,$Rsp);
    }
    //APP获取积分产品列表
    public function ScoreProduct_rest(){
    
        $req =  $this->getReqObj();
        $typeInfo['city'] = $req->city;
        $this->log($typeInfo);
        $productListResult = parent::ScoreProductService($typeInfo);
    
        $errorCode = $productListResult['errorCode'];
        if($productListResult['productList']==false)
        {
            $productListResult['productList']=null;
        }
        $Rsp['productList'] = $productListResult['productList'];
        $this->returnJson($errorCode,$Rsp);
    }
    //APP获取商家信息
    public function GetSellerInfo_rest(){
    
        $req =  $this->getReqObj();
        //获取商家信息
        $condition['user_id'] = $req->seller_id;
        $sellerViewDB = new Model('view_seller');
        $seller = $sellerViewDB->where($condition)->find();        
        $seller['dscr'] = $sellerViewDB->where($condition)->getField('description');
        unset($seller['description']);
        
        //获取商家对应的商品列表和商家评价列表
        parent::updateProductStatus();
        $IDcondition['seller_id'] = $req->seller_id;
        $productViewDB = new Model('view_product');
        $productList = $productViewDB->where($condition)->select();
        $productList = parent::addProductInfo($productList);
        $sellerEvalDB = new Model('seller_evaluation');
        $sellerEvalList = $sellerEvalDB->where($condition)->select();
        
        $errorCode = SUCCESS;
        if($seller==false)
        {
            $seller=null;
        }
        if($productList==false)
        {
        	$productList=null;
        }
        if($sellerEvalList==false)
        {
        	$sellerEvalList=null;
        }
        $Rsp['seller'] = $seller;
        $Rsp['productList'] = $productList;
        $Rsp['sellerEvalList'] = $sellerEvalList;
        $this->returnJson($errorCode,$Rsp);
    }
    //APP获取商家列表
    public function GetSellerList_rest(){
    
    	$req =  $this->getReqObj();
    	$city = $req->city;
    	$this->log($city);
    	$sellerListResult = parent::sellerListService($city);
    	
    	$errorCode = $sellerListResult['errorCode'];
    	if($sellerListResult['sellerList']==false)
    	{
    		$sellerListResult['sellerList']=null;
    	}
    	$Rsp['sellerList'] = $sellerListResult['sellerList'];
    	$this->returnJson($errorCode,$Rsp);
    }
    //APP获取产品评价列表
    public function GetProductEvalList_rest(){
    	
    	$req =  $this->getReqObj();
    	//获取商家信息
    	$condition['product_id'] = $req->product_id;
    	$productEvaViewDB = new Model('view_product_eva');
    	$productEvalList = $productEvaViewDB->where($condition)->select();
    	
    	$errorCode = SUCCESS;
    	if($productEvalList==false)
    	{
    		$productEvalList=null;
    	}
    	$Rsp['productEvalList'] = $productEvalList;
    	$this->returnJson($errorCode,$Rsp);
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
		$product = new Model('view_product');
		$map="name like('%".$keyword."%') ";
		$map1="username like('%".$keyword."%')";
		$map2="zone_name like('%".$keyword."%')";
		$productCount = $product->where($map)->count();
		$productCount1 = $product->where($map1)->count();
		$productCount2 = $product->where($map2)->count();
		if($keyword=='')
		{
			$this->ajaxReturn('false', '请输入关键词', 1);
		}
		elseif(($productCount==0)&&($productCount1==0)&&($productCount2==0))
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