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

}