<?php

class ActivityServiceAction extends BaseAction {

    //获取所有活动列表
    public function activityService($city)
    {
        //获取当前城市
		$activityFilter['city']=$city;
		
		//设置总筛选条件
		$activityViewDB=new Model('view_activity');
		$activityList =$activityViewDB->where($activityFilter)->select();
		$activityCount = $activityViewDB->where($activityFilter)->count();
		for($i=0;$i<$activityCount;$i++)
		{
		    $activityOrderDB = M('activity_order');
		    $condition['activity_id'] = $activityList[$i]['activity_id'];
		    $activityList[$i]['current_member'] = $activityOrderDB->where($condition)->count(); 
		}
		$rsp['errorCode'] = SUCCESS;
		$rsp['activityList'] = $activityList;
		$this->log("the ActivityList is".$activityList);
		return  $rsp;
		
    }
    //获取所有活动订单列表
    public function activityOrderService($userID)
    {
        $condition['customer_id'] = $userID;
        $activityOrderDB = M('view_activity_order');
        $activityOrderList = $activityOrderDB->where($condition)->select();
        
        $rsp['errorCode'] = SUCCESS;
        $rsp['activityOrderList'] = $activityOrderList;
        $this->log("the activityOrderList is".$activityOrderList);
        return  $rsp;
        
    }
    //创建活动订单
    public function createOrderService($orderInfo)
    {
        $customer_id = $orderInfo["userID"];
        $activityID = $orderInfo["activityID"];
        $datetime=date('Y-m-d H:i:s',time());
        $orderID=$activityID.$customer_id.strtotime($datetime);
        	
        $activityView = M('activity');
        $activityViewCondition['activity_id']=$activityID;
        $activity_title=$activityView->where($activityViewCondition)->getField('title');
        $imgsrc=$activityView->where($activityViewCondition)->getField('imgsrc');
        $activity_dscr=$activityView->where($activityViewCondition)->getField('dscr');
        $memberlimit=$activityView->where($activityViewCondition)->getField('memberlimit');
        $datelimit=$activityView->where($activityViewCondition)->getField('datelimit');

        //参与的逻辑判断
        $orderDB = M('activity_order');
        $orderCondition['activity_id']=$activityID;
        $num=$orderDB->where($orderCondition)->count();
        $orderCondition['customer_id']=$customer_id;
        $order=$orderDB->where($orderCondition)->select();
        if($order!=null){
            $rsp['errorCode'] = ACTIVITY_ORDER_DUPLICATE;
	        return  $rsp;
        }
        	
        if(((int)$num)+1>(int)$memberlimit){
            $rsp['errorCode'] = ACTIVITY_ORDER_MAXIMUM;
	        return  $rsp;
        }
        	
        	
        $data2['activity_order_id']=$orderID;
        $data2['activity_id']=$activityID;
        $data2['customer_id']=$customer_id;
        $data2['activity_title']=$activity_title;
        $data2['activity_disc']=$activity_dscr;
        $data2['imgsrc']=$imgsrc;
        $data2['memberlimit']=$memberlimit;
        $data2['datelimit']=$datelimit;
        $data2['datetime']=$datetime;
        $orderDB->add($data2);
        $orderViewDB = M('view_activity_order');
        $IDCondition['activity_order_id'] = $orderID;
        $activityOrder = $orderViewDB->where($IDCondition)->find();
        
        $rsp['errorCode'] = SUCCESS;
        $rsp['activityOrder'] = $activityOrder;
        $this->log("the activityOrder is".$activityOrder);
        return  $rsp;
    
    }
    //取消活动订单
    public function cancelOrderService($orderInfo)
    {
        
        $condition1['customer_id'] = $orderInfo["userID"];
        $activity_order = M('activity_order');
        
        if($activity_order->where($condition1)->where('activity_id='.$orderInfo["activityID"])->delete())
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