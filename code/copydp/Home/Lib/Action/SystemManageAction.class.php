<?php
// 本类由系统自动生成，仅供测试用途
class SystemManageAction extends Action {

	public function ManageIndex(){
			$this->display();
	}

	public function cityEdit($cityID=0){
	
		$zoneDB=M('view_zone');
		$zoneIDCondition['city_id']=$cityID;
		$zoneList= $zoneDB->where($zoneIDCondition)->select();
		$cityDB = M('city');
		$IDcondition['city_id'] = $cityID;
		$city = $cityDB->where($IDcondition)->find();
		$this->assign("zoneList",$zoneList);
		$this->assign("cityID",$cityID);
		$this->assign("city",$city);
		$this->display();
	}
	public function updateCityCoordinate(){
	
	    $cityDB=M('city');
	    $cityID = $_POST['cityID'];
	    $IDCondition['city_id']=$cityID;
	    $newCity['city'] = $_POST['cityName'];
	    $newCity['x']=$_POST['cityX'];
		$newCity['y']=$_POST['cityY'];
		if(($newCity['x']=="")||($newCity['y'] == ""))
		{
		    $this->assign("jumpUrl","cityEdit?cityID=$cityID");
		    $this->error("操作失败，请输入完整的城市坐标信息");
		}
		$cityDB->where($IDCondition)->save($newCity);
		$this->assign("jumpUrl","cityEdit?cityID=$cityID");
		$this->success("操作成功");
	}
	

	public function NewsEdit(){
		$this->display();
	}
	
	public function NewsAdd(){
		$NewsDB= M('news');
		$Data['title']=$_POST['title'];
		$Data['content']=$_POST['info'];
		$Data['datetime']=date('Y-m-d H:i:s',time());
		$NewsDB->add($Data);
		$this->assign("jumpUrl","index");
		$this->success("操作成功");
	}
	
	public function deleteNews($ID=0){
		$NewsDB= M('news');
		$deleteNewsCondition['news_id']=$ID;
		$NewsDB->where($deleteNewsCondition)->delete();
		$this->assign("jumpUrl","index");
		$this->success("操作成功");
	}
	
	
	public function deleteAdmin($UserID=0){
		$UserDB= M('user');
		$deleteUserCondition['user_id']=$UserID;
		$UserDB->where($deleteUserCondition)->delete();
		$this->assign("jumpUrl","index");
		$this->success("操作成功");
	}
  
	public function privilege($UserID=0){
		$PrivilegeDB= M('privilege');
		$privilegeCondition1['user_id']=$UserID;
		$PList=$PrivilegeDB->where($privilegeCondition1)->getField('function',true);
		$this->assign("Plist",$PList);
		$this->assign("UserID",$UserID);
		$this->display();
	}
	
	public function privilegeSet($UserID=0){
  	
		$PrivilegeDB= M('privilege');
		$privilegeCondition1['user_id']=$UserID;
		$PrivilegeDB->where($privilegeCondition1)->delete();
		$List=$_POST['interest'];
		for($i = 0;$i<count($List);$i++){
			$c['user_id']=$UserID;
			$c['function']=$List[$i];
			$PrivilegeDB->add($c);
		}
		$this->success("操作成功");
		
	}
	
	public function newCity(){
		$CityDB= M('city');
		$newCity['city']=$_POST['cityName'];
		$newCity['x']=$_POST['cityPositionX'];
		$newCity['y']=$_POST['cityPositionY'];
		if(($newCity['x']=="")||($newCity['y'] == ""))
		{
		    $this->assign("jumpUrl","index");
		    $this->error("操作失败，请输入完整的城市坐标信息");
		}
		$CityDB->add($newCity);
		$this->assign("jumpUrl","index");
		$this->success("操作成功");
	}
	
	public function newZone($cityID){
		$ZoneDB= M('city_zone');
		$newZone['city_id']=$cityID;
		$newZone['zone_name']=$_POST['zoneName'];
		$ZoneDB->add($newZone);
		$this->assign("jumpUrl","cityEdit?cityID=$cityID");
		$this->success("操作成功");
	}
	
	public function deleteCity($CityID=0){
		$CityDB= M('city');
		$deleteCityCondition['city_id']=$CityID;
		$CityDB->where($deleteCityCondition)->delete();
		$this->assign("jumpUrl","index");
		$this->success("操作成功");
	}
	

	public function basicInfoEdit($data){
		$array = explode("~",$data);
		$tel=urldecode($array[0]);
		$email=urldecode($array[1]);	
		$time=urldecode($array[2]);	
		
		$siteCfg= M('site_config');
		
		$condition['name']='tel';
		$data1['content']=$tel;
		$siteCfg->where($condition)->save($data1);
		
		$condition2['name']='time';
		$data2['content']=$time;
		$siteCfg->where($condition2)->save($data2);
		
		$condition3['name']='email';
		$data3['content']=$email;
		$siteCfg->where($condition3)->save($data3);

		$this->ajaxReturn('true'.$data, 'Ajax 成功！', 1);
	}
	public function linkEdit($data){
	
		$array = explode("~",$data);
		$link=urldecode($array[0]);
		$linkname=urldecode($array[1]);	
		$index=urldecode($array[2]);	
		
		$siteCfg= M('site_config');
		$conditionlink['name']="linkname".$index;
		$data1['content']=$linkname;
		$siteCfg->where($conditionlink)->save($data1);
		
		$conditionlink['name']="link".$index;
		$data2['content']=$link;
		$siteCfg->where($conditionlink)->save($data2);
		
		$this->ajaxReturn($conditionlink['name'], 'Ajax 成功！', 1);
	}
	public function zoneEdit($data){
		$array = explode("~",$data);
		$zoneid=urldecode($array[0]);
		$name=urldecode($array[1]);	
		
		$zoneDB=M('city_zone');
		$zoneIDCondition['zone_id']=$zoneid;
		$zoneData['zone_name']=$name;
		$zoneDB->where($zoneIDCondition)->save($zoneData);
		$this->ajaxReturn($data, 'Ajax 成功！', 1);
	}
	
	public function helpShow($id){
		$this->assign("id",$id);
		$this->display(helpShow);
	}
	public function HelpEdit($id){
	
	
		
		$this->assign("id",$id);
		$this->display(helpEdit);
	}

	public function ModifyHelp($id){
	
		$content = $_POST['info'];
		$title = $_POST['title'];
		
		$siteCfg= M('site_config');
		$conditionhelp['name']="help".$id;
		$data1['content']=$title;
		
		$conditionhelp2['name']="helpC".$id;
		$data2['content']=$content;
		
		$siteCfg->where($conditionhelp)->save($data1);
		$siteCfg->where($conditionhelp2)->save($data2);
		
		$this->assign("jumpUrl","Index");
		$this->success("修改成功");
	}
	
	
    public function index(){
		
		if($_SESSION['login_user']!=""){
			//加载配置信息

			$sysDB=new Model('sys_config');
			
			$loginCondition['key']='login_score';				
			$loginValue=$sysDB->where($loginCondition)->getField('value');
			$orderCondition['key']='order_score';
			$orderValue=$sysDB->where($orderCondition)->getField('value');
			
			//获取管理员列表
			$user = M('user');
			$userCondition['role']="ADMIN";
			$adminList=$user->where($userCondition)->select();
			$this->assign("adminList",$adminList);
			
			$this->assign("currentPage","sys");
			$this->assign("loginValue",$loginValue);		
			$this->assign("orderValue",$orderValue);					
			$this->display();
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}	
    }
	public function addAdmin(){	
		
		$user = M('user');			
		$newName=$_POST['user_name'];
		$condition['username'] = $newName;
		$select=$user->where($condition)->count();
		
		if ($select!=0){
				$this->assign("jumpUrl","adminAdd");
				$this->error("该管理员已经存在！");	
		}else{

			$data['username']=$newName;
			$data['role']='ADMIN';
			$user->add($data);
			$this->assign("jumpUrl","index");
			$this->success("用户新增成功！");
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