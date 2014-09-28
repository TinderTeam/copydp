<?php
class ActivityAction extends Action {
    public function activity(){
		$this->display();
    }
	
	public function activity_manager(){
		$this->display();
    }

	public function activity_info($activityID=0){
		$this->assign('activityID',$activityID);
		$this->display();
    }
	
	
	public function activityOrderCommit($activityID=0){
		print('id='.$activityID);
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
			
			//������߼��ж�
			
			$order = M('activity_order');
			$data2['activity_order_id']=$orderID;	
			$data2['activity_id']=$activityID;			
			$data2['customer_id']=$customer_id;
			$data2['activity_title']=$activity_title;
			$data2['activity_dscr']=$activity_dscr;
			$data2['imgsrc']=$imgsrc;
			$data2['memberlimit']=$memberlimit;
			$data2['datelimit']=$datelimit;
			$data2['datetime']=$datetime;					
			$order->add($data2);
			
			$this->assign('activityID',$activityID);
			$this->assign('customer_id',$customer_id);
			$this->assign('orderID',$orderID);
			$this->display();
			//$this->success("�µ��ɹ�");
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("����û�е�¼��");
		}	
		
	}
	

}