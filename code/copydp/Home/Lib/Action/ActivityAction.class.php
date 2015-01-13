<?php
class ActivityAction extends ActivityServiceAction {
    public function activity(){
		$this->display();
    }
    //APP获取活动列表
    public function activity_rest(){
        
        $req =  $this->getReqObj();
        $city = $req->city;
        $this->log($city);
        $activityListResult = parent::activityService($city);
        
        $errorCode = $activityListResult['errorCode'];
        if($activityListResult['activityList'] == false)
        {
            $activityListResult['activityList'] = null;
        }
        $Rsp['activityList'] = $activityListResult['activityList'];
        $this->returnJson($errorCode,$Rsp);
    }
    //APP获取个人活动订单列表
    public function activityOrder_rest(){
        
        $this->doAuth();
        $req =  $this->getReqObj();
        $userID = $req->userID;
        $this->log($userID);
        $activityOrderListResult = parent::activityOrderService($userID);
        
        $errorCode = $activityOrderListResult['errorCode'];
        if($activityOrderListResult['activityOrderList'] == false)
        {
            $activityOrderListResult['activityOrderList'] = null;
        }
        $Rsp['orderList'] = $activityOrderListResult['activityOrderList'];
        $this->returnJson($errorCode,$Rsp);
    }
	public function activity_manager(){
		$this->display();
    }

	public function activity_info($activityID=0){
		$this->assign('activityID',$activityID);
		$this->display();
    }
	
	
	public function activityOrderCommit($activityID=0){
		//print('id='.$activityID);
		
		if(empty($_SESSION['login_user'])){								
			$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("请先登录系统!");	
		}
		//获取用户信息
		$db=new Model('user');
		$userName=$_SESSION['login_user'];
		$condition['username']=$userName;	
		$role =  $db->where($condition)->getField('role');
		
		if($role!='CUSTOMER'){
			$this->assign("jumpUrl","__APP__/Index/index");
			$this->error("您使用的账户类型不能进行此操作!");	
		}
		
		if($_SESSION['login_user']!=""){
			$user= M('user');
			$condition['username']=$_SESSION['login_user'];
			$customer_id = $user->where($condition)->getField('user_id');		
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
				$this->assign("jumpUrl","activity_info?activityID=".$activityID);
				$this->error("您已经参与了这个活动，请勿重复参与!");	
			}
			
			if(((int)$num)+1>(int)$memberlimit){
				$this->assign("jumpUrl","activity_info?activityID=".$activityID);
				$this->error("该活动已经达到人数上限!".$num."/".$memberlimit);	
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
			
			$this->assign('activityID',$activityID);
			$this->assign('customer_id',$customer_id);
			$this->assign('orderID',$orderID);
			$this->display();
			//$this->success("下单成功");
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}	
		
	}
	//APP产生活动订单
	public function createOrder_rest(){
	    
	    $this->doAuth();
	    $req =  $this->getReqObj();
	    $orderInfo['userID'] = $req->userID;
	    $orderInfo['activityID'] = $req->activityID;
	    $this->log($orderInfo);
	    $createOrderResult = parent::createOrderService($orderInfo);
	    
	    $errorCode = $createOrderResult['errorCode'];
	    if($createOrderResult['activityOrder'] == false)
	    {
	        $createOrderResult['activityOrder'] = null;
	    }
	    $Rsp['activityOrder'] = $createOrderResult['activityOrder'];
	    $this->returnJson($errorCode,$Rsp);
	}
	//APP取消活动订单
	public function cancelOrder_rest(){
	    
	    $this->doAuth();
	    $req =  $this->getReqObj();
	    $orderInfo['userID'] = $req->userID;
	    $orderInfo['activityID'] = $req->activityID;
	    $this->log($orderInfo);
	    $cancelOrderResult = parent::cancelOrderService($orderInfo);
	     
	    $errorCode = $cancelOrderResult['errorCode'];
	    $this->returnJson($errorCode,null);
	}
	
	

}