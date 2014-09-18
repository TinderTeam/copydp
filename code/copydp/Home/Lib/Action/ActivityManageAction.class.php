<?php
// 本类由系统自动生成，仅供测试用途
class ActivityManageAction extends Action {
    public function index(){
		if($_SESSION['login_user']!=""){
	
	    $this->display();
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}
    }
	


	
}
?>