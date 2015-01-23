<?php

class BuyServiceAction extends BaseAction {

	//更新产品状态
	public function updateProductStatus()
	{
		$productDB=new Model('product');
		$statusCondition['product_status']="正常";
		
		//更新所有产品状态
		$productList = $productDB->where($statusCondition)->select();
		$productCount = $productDB->where($statusCondition)->count();
		for($i=0;$i<$productCount;$i++)
		{
			$conditionTime['end_date_time']=array('LT',date('Y-m-d H:i:s',time()));
        	$productIDCondition['product_id'] = $productList[$i]['product_id'];
		    $data['product_status']="已过期";
			if($productList[$i]['end_date_time']<date('Y-m-d H:i:s',time()))
			{
				$this->log("the product is to be updatestatus, product_id is ".$productList[$i]['product_id']);
				$productDB->where($productIDCondition)->where($conditionTime)->save($data);
			}
        	
		}
	}
	//增加产品补充信息字段，补充已购买人数，剩余天数
	public  function addProductInfo($productList)
	{
		for($i=0;$i<count($productList);$i++)
		{
			$productOrderDB = M('order');
			$condition['product_id'] = $productList[$i]['product_id'];
    		$productList[$i]['current_member'] = $productOrderDB->where($condition)->count();
	    	$endTime = $productList[$i]['end_date_time'];
	    	$productDB = M('product');
	    	$productList[$i]['leavingDays']=round((strtotime($endTime)-strtotime(date('Y-m-d H:i:s',time())))/3600/24);
		}
		return $productList;
	}
    //获取推荐产品列表
    public function recommendProductService($city)
    {
    	$this->updateProductStatus();
		$productViewDB=new Model('view_recommernd');
		$rcmViewCondition['city']=$city;
		$statusCondition['product_status']="正常";
		$rcmIDList=$productViewDB->where($rcmViewCondition)->where($statusCondition)->getField('product_id',true);
		
		$map['product_id']=array('in',$rcmIDList);
		$productDB = new Model('view_product');
		$productList = $productDB->where($map)->select();
		$productList = $this->addProductInfo($productList);
		$rsp['errorCode'] = SUCCESS;
		$rsp['productList'] = $productList;
		$this->log("the productList is".$productList);
		return  $rsp;
		
    }
    //获取最新特惠产品列表
    public function NewProductService($city)
    {
    	$this->updateProductStatus();
        $productViewDB=new Model('view_product');
        $productCityCondition['city']=$city;
        $statusCondition['product_status']="正常";
        $productList=$productViewDB->where($productCityCondition)->where($statusCondition)->order('update_date desc')->limit(4)->select();
        $productList = $this->addProductInfo($productList);
        $rsp['errorCode'] = SUCCESS;
        $rsp['productList'] = $productList;
        $this->log("the productList is".$productList);
        return  $rsp;
    
    }
    //获取分类推荐产品列表
    public function TypeRecProductService($typeInfo)
    {
    	$this->updateProductStatus();
        $productViewDB=new Model('view_product');
        $typeDB=new Model('product_type');
        //查询子类列表
        $fatherTypeCondition['father_id'] = 0;
        $subTypeList=$typeDB->where($fatherTypeCondition)->getField('type_id',true);
        $productList = array();
        for($i=0;$i<count($subTypeList);$i++){
            $condition['type_id'] = $subTypeList[$i];
            $condition['city']=$typeInfo['city'];
            $condition['product_status']="正常";
            $productTypeList=$productViewDB->where($condition)->order('rand()')->limit(3)->select();
            for($j=0;$j<count($productTypeList);$j++)
            {
               array_push($productList,$productTypeList[$j]);
            }
        }

        $productList = $this->addProductInfo($productList);
        
        $rsp['errorCode'] = SUCCESS;
        $rsp['productList'] = $productList;
        $this->log("the productList is".$productList);
        return  $rsp;
    
    }
    //获取积分产品列表
    public function ScoreProductService($typeInfo)
    {
        $productViewDB=new Model('view_product');
        $condition['city']=$typeInfo['city'];
        $condition['type_id'] = 1000;               //积分商品
        $productList =$productViewDB->where($condition)->select();
        $productList = $this->addProductInfo($productList);
    
        $rsp['errorCode'] = SUCCESS;
        $rsp['productList'] = $productList;
        $this->log("the productList is".$productList);
        return  $rsp;
    
    }

    //根据产品类型，获取所有产品列表
    public function AllProductService($searchInfo)
    {    	
        $typeRoot = $searchInfo['typeRoot'];
        $city = $searchInfo['city'];
        $zone_id = $searchInfo['zone_id'];
        $search = $searchInfo['search'];
        $keyword = '%'.$searchInfo['keyWord'].'%';
        //按照已有条件查询
		//1.按照类型分类
        $typeDB=new Model('product_type');
		if($typeRoot!=0){
			//查询子类列表
			$fatherTypeCondition['father_id']=$typeRoot;
			$subTypeList=$typeDB->where($fatherTypeCondition)->getField('type_id',true);
			for($i=0;$i<count($subTypeList);$i++){
				$TypeFilterCondition['type_id'] = $subTypeList[$i];
			}
			$TypeFilterCondition['type_id'] = $typeRoot;
			$TypeFilterCondition['_logic'] = "OR";
			$productFilter['_complex']=$TypeFilterCondition;
		}else{
			
		}
		
		//获取当前城市
		$productFilter['city']=$city;
		
		//获取区域
		if($zone_id != "0")
		{
		      $productFilter['zone_id'] = $zone_id;   
		}
		
		
		if($search=='true'){
			$searchFilter['name'] = array('like',$keyword);
			$searchFilter['username'] = array('like',$keyword);
			$searchFilter['zone_name'] = array('like',$keyword);
			$searchFilter['_logic'] = "OR";
			$productFilter['_complex']=$searchFilter;
		}
		
		//设置总筛选条件
		$productViewDB=new Model('view_product');
		$statusCondition['product_status']="正常";
	    $productList =$productViewDB->where($productFilter)->where($statusCondition)->select();
	    $productList = $this->addProductInfo($productList);
	    
	    $rsp['errorCode'] = SUCCESS;
	    $rsp['productList'] = $productList;
	    $this->log("the productList is".$productList);
	    return  $rsp;
        
    }
    //根据用户ID，获取所有产品订单列表
    public function ProductOrderService($userID)
    {
        
        //产品截至时间到期，且处于已下单状态的订单更新为已过期
        $product = M('product');
        $order = M('order');
        $condition1['end_date_time']=array('LT',date('Y-m-d H:i:s',time()));	//判断截至时间小于当前时间的条件
        
        $countOldProduct = $product->where($condition1)->count();
        $oldProductID = $product->where($condition1)->getField('product_id',true);	//查找已过期产品
        
        for($i=0;$i<$countOldProduct;$i++)
        {
            $condition2['product_id'] = $oldProductID[$i];
            $data['order_status']="已过期";
            $order->where($condition2)->where('order_status="已下单"')->save($data);		//更新订单状态
        }
        //显示订单列表
        $viewOrder = M('view_order');
        $condition['customer_id'] = $userID;
        $orderCount = $viewOrder->where($condition)->count();
        $orderList = $viewOrder->where($condition)->select();
        
        $rsp['errorCode'] = SUCCESS;
        $rsp['orderList'] = $orderList;
        $this->log("the orderList is".$orderList);
        return  $rsp;
    }
    public function GetSvipBuyTimes($productID=null,$userID=null)
    {
    	$dbProduct =new Model('product');
    	$productCondition['product_id'] = $productID;
    	$privilege = $dbProduct->where($productCondition)->getField('svip_product_id');
    		
    	$dbCustomer = new Model('customer');
    	$IDCondition['user_id'] = $userID;
    	$grade = $dbCustomer->where($IDCondition)->getField('grade');
    	$errorCode = SUCCESS;
    	//购买商品校验
    	if($privilege!="普通")
    	{
    		if($grade=="VIP"){
    			$errorCode = CLIENT_VERSION_LOW;
    		}
    		else 
    		{
    				
    			$svipProductdb= M('view_svip_product');
    			$productCondition['svip_product_id']=$privilege;
    			$svipProduct = $svipProductdb->where($productCondition)->find();
    			//获取限制信息
    			$limnum=$svipProduct['limit_consumption_num'];
    			$limtype=$svipProduct['limit_consumption_period'];
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
    			$SVIPOrderCondition['customer_id'] = $userID;
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
    			$this->log("customer has buy ".$num." times in ".$limtype);
    			if($num>=$limnum){
    				$errorCode = BUY_TIMES_OVER;
    			}
    		}
    	}
    	return $errorCode;
    }
    //生成产品订单
    public function CreateOrderService($orderInfo)
    {
    
        $customer_id=$orderInfo['userID'];
		$product_id=$orderInfo['productID'];
		$quantity=$orderInfo['quantity'];
		$seller_id = $orderInfo['seller_id'];
		$order_type = $orderInfo['order_type'];

		if("扫码下单" == $order_type)
		{
			//判断商家ID是否存在
			$sellerViewDao=new Model('view_seller');
			$IDCondition['user_id']  = $seller_id;
			if($sellerViewDao->where($IDCondition)->count() != 1)
			{
				$rsp['errorCode'] = SELLER_NOT_EXIST;
				return $rsp;
			}
			$datetime=date('Y-m-d H:i:s',time());
			$sellerItem=$sellerViewDao->where($IDCondition)->find();
			$sellerName=$sellerItem['seller_name'];
			//进行下单逻辑处理
			$orderID=$seller_id.$customer_id.strtotime($datetime);
			
			$order = M('order');
			$data2['order_id']=$orderID;
			$data2['order_name']=$sellerItem['seller_name'];
			$data2['customer_id']=$customer_id;
			$data2['seller_id']=$seller_id;
			$data2['imgsrc']=$sellerItem['img'];
			$data2['order_time']=$datetime;
			$data2['quantity']=1;
			$data2['order_status']='已使用';
			$data2['order_type']='扫码下单';
			$order->add($data2);
			$orderIDCondition['order_id'] = $orderID;
			$orderViewDB = M('view_order');
			$order = $orderViewDB->where($orderIDCondition)->find();
		}
		else 
		{
			//判断是否为SVIP产品，是否超过购买限制
			$rsp['errorCode']  = $this->GetSvipBuyTimes($product_id,$customer_id);
			if($rsp['errorCode'] != SUCCESS)
			{
				$rsp['productOrder'] = NULL;
				return  $rsp;
			}
			//判断产品ID是否存在
			$product=new Model('view_product');
			$productIDCondition['product_id']  = $product_id;
			if($product->where($productIDCondition)->count() != 1)
			{
				$rsp['errorCode'] = PRODUCT_NOT_EXIST;
				return $rsp;
			}
			$datetime=date('Y-m-d H:i:s',time());
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
			$data2['order_type']='普通订单';
			$order->add($data2);
			$orderIDCondition['order_id'] = $orderID;
			$orderViewDB = M('view_order');
			$order = $orderViewDB->where($orderIDCondition)->find();
		}
		
		$rsp['errorCode'] = SUCCESS;
		$rsp['productOrder'] = $order;
		$this->log("the order is".$order);
		return  $rsp;
		
    }
    //取消产品订单
    public function CancelOrderService($orderInfo)
    {
        
        $order = M('order');
        $condition['order_id'] = $orderInfo['orderID'];
        $data['order_status']="已取消";
        
        if($order->where($condition)->save($data))
        {
            $rsp['errorCode'] = SUCCESS;
            return  $rsp;
        }
        else
        {
            $rsp['errorCode'] = OPERATE_FAILED;
            return  $rsp;
        }
    
    }
    //删除产品订单
    public function DeleteOrderService($orderInfo)
    {
    
        $order = M('order');
        $condition['order_id'] = $orderInfo['orderID'];

        if($order->where($condition)->delete())
        {
            $rsp['errorCode'] = SUCCESS;
            return  $rsp;
        }
        else
        {
            $rsp['errorCode'] = OPERATE_FAILED;
            return  $rsp;
        }
    
    }
    //获取商家列表
    public function sellerListService($city)
    {
    
    	$sellerViewDB=new Model('view_seller');
    	$cityCondition['city']=$city;
    	$sellerList = $sellerViewDB->where($cityCondition)->select();
    	$this->log("the sellerList is".$sellerList);
    	$this->log(count($sellerList));
    	for($j=0;$j<count($sellerList);$j++)
            {
            	$this->log($j);
            	$sellerList[$j]['dscr'] = $sellerList[$j]['description'];
            	unset($sellerList[$j]['description']);
            }
    	
    	$rsp['errorCode'] = SUCCESS;
    	$rsp['sellerList'] = $sellerList;
    	$this->log("the sellerList is".$sellerList);
    	return  $rsp;
    
    }
    
}

?>