<?php

class BuyServiceAction extends BaseAction {

    //获取推荐产品列表
    public function recommendProductService($city)
    {
        
		$productViewDB=new Model('view_recommernd');
		$rcmViewCondition['city']=$city;
		$statusCondition['product_status']="正常";
		$rcmIDList=$productViewDB->where($rcmViewCondition)->where($statusCondition)->getField('product_id',true);
		
		$map['product_id']=array('in',$rcmIDList);
		$productDB = new Model('view_product');
		$productList = $productDB->where($map)->select();
		$productCount = count($rcmIDList);
	    for($i=0;$i<$productCount;$i++)
		{
		$productOrderDB = M('order');
		$condition['product_id'] = $productList[$i]['product_id'];
		$productList[$i]['current_member'] = $productOrderDB->where($condition)->count();
		}
		$rsp['errorCode'] = SUCCESS;
		$rsp['productList'] = $productList;
		$this->log("the productList is".$productList);
		return  $rsp;
		
    }
    //获取最新特惠产品列表
    public function NewProductService($city)
    {
        
        $productViewDB=new Model('view_product');
        $productCityCondition['city']=$city;
        $statusCondition['product_status']="正常";
        $productList=$productViewDB->where($productCityCondition)->where($statusCondition)->order('update_date desc')->limit(4)->select();
        for($i=0;$i<count($productList);$i++)
        {
        $productOrderDB = M('order');
        $condition['product_id'] = $productList[$i]['product_id'];
        $productList[$i]['current_member'] = $productOrderDB->where($condition)->count();
        }            
        
        $rsp['errorCode'] = SUCCESS;
        $rsp['productList'] = $productList;
        $this->log("the productList is".$productList);
        return  $rsp;
    
    }
    //获取分类推荐产品列表
    public function TypeRecProductService($typeInfo)
    {
    
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

        for($i=0;$i<count($productList);$i++)
        {
        $productOrderDB = M('order');
        $condition['product_id'] = $productList[$i]['product_id'];
        $productList[$i]['current_member'] = $productOrderDB->where($condition)->count();
        }
        
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
        $productList=$productViewDB->where($condition)->select();
        for($i=0;$i<count($productList);$i++)
        {
        $productOrderDB = M('order');
        $condition['product_id'] = $productList[$i]['product_id'];
        $productList[$i]['current_member'] = $productOrderDB->where($condition)->count();
        }
    
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
		if($zone_id != "")
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
	    $productCount = $productViewDB->where($productFilter)->count();
        for($i=0;$i<$productCount;$i++)
        {
        $productOrderDB = M('order');
        $condition['product_id'] = $productList[$i]['product_id'];
        $productList[$i]['current_member'] = $productOrderDB->where($condition)->count();
        }

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
    //生成产品订单
    public function CreateOrderService($orderInfo)
    {
    
        $customer_id=$orderInfo['userID'];
		$product_id=$orderInfo['productID'];
		$quantity=$orderInfo['quantity'];
		
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
        
		$orderIDCondition['order_id'] = $orderID;
		$orderViewDB = M('view_order');
		$order = $orderViewDB->where($orderIDCondition)->find();
		
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
    
}

?>