<?php
// 本类由系统自动生成，仅供测试用途
class SystemManageAction extends Action {
    public function index(){
		
		if($_SESSION['login_user']!=""){
			//加载配置信息

			$sysDB=new Model('sys_config');
			
			$loginCondition['key']='login_score';				
			$loginValue=$sysDB->where($loginCondition)->getField('value');
			$orderCondition['key']='order_score';
			$orderValue=$sysDB->where($orderCondition)->getField('value');


			$this->assign("currentPage","sys");
			$this->assign("loginValue",$loginValue);		
			$this->assign("orderValue",$orderValue);					
			$this->display();
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}	
    }
	public function orderUpdate(){	
		$orderValue=$_POST['orderValue'];
		
		$sys = M('sys_config');
		$orderCondition['key']='order_score';
		$data1['key']='order_score';
		$data1['value']=$orderValue;
		$sys->where($orderCondition)->save($data1);
		
		$this->assign("jumpUrl","index");
		$this->success("修改成功");
	}
	public function loginUpdate(){	
		$loginValue=$_POST['loginValue'];
		
		$sys = M('sys_config');
		$loginCondition['key']='login_score';
		$data2['key']='login_score';
		$data2['value']=$loginValue;
		$sys->where($loginCondition)->save($data2);
		
		$this->assign("jumpUrl","index");
		$this->success("修改成功");
	}
	
}
?>