<?php
// 本类由系统自动生成，仅供测试用途
class UserManageAction extends Action {
    public function index(){

		if($_SESSION['login_user']!=""){
	
	    $this->display();
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}	
    }

 	public function check(){
		session_start();
        $time=30*60; 
        setcookie(session_name(),session_id(),time()+$time,"/");
		

      
			if(isset($_POST['name'])&&isset($_POST['pwd'])){
				$admin= M('user');
        
				$condition['name']=$_POST['name'];
				$pwdenter=$_POST['pwd'];
				$pwdtrue = $admin->where($condition)->getField('password');

				if($pwdtrue==$pwdenter){
					$_SESSION['login_user']= $_POST['name'];
					
					$this->assign("jumpUrl","index");
					$this->success("管理员登陆成功！");
				}else{
					//$this->redirect('Index/login','',2,'用户名或密码不正确！');
				 $this->assign("jumpUrl","login");
				$this->error("用户名或密码不正确！");
				}
			}else{
				$this->assign("jumpUrl","login");
				$this->error("用户名或密码不能为空！");
	
				}
			 

	
	}
	public function search(){
		
		$db = M('view_customer');
        import("ORG.Util.Page"); 

		$userID=$_POST['userID'];
		$userName=$_POST['userName'];
		$phoneNum=$_POST['phoneNum'];
		
		if($userID!=''){
		   $condition['user_id'] = $userID;
		}
		if($userName!=''){
		   $condition['username'] = $userName;
		}
		if($phoneNum!=''){
		   $condition['cellphone'] = $phoneNum;
		}
        		
		if($userID!='' or $userName!='' or $phoneNum!='')
		{
			//$map="user_name like('%".$userName."%') or user_id like('%".$userID."%' ) or cellphone like('%".$phoneNum."%')";
			$condition['request'] = 'NULL';
			$list = $db->where($condition)->select();
			$this->assign('userInfo',$list);
			$count = $db->where($condition)->count(); 
			$Page = new Page($count,5); 
			$show = $Page->show();
			$this->assign('page',$show);
			$this->display('index');
			
		}else{	

			echo "<script>alert('请输入关键信息!');history.back();</script>";
			
		}
	}
    //新增用户
		public function add(){
			
			$user = M('user');
			
			$newName=$_POST['user_name'];
			$condition['username'] = $newName;
			$select=$user->where($condition)->count();
			
			if ($select!=0){
					$this->assign("jumpUrl","index");
					$this->error("该用户名已经存在！");
				
			
			}else{

				$data['username']=$newName;
				$data['role']='CUSTOMER';
				$user->add($data);
				$customerCondition['username'] = $newName;
				$newID=$user->where($customerCondition)->getField('user_id');
						
				if(empty($newID)){
					$this->assign("jumpUrl","index");
					$this->error("新增用户编号失败！");
					
				}else{

					$customer = M('customer');
					$data2['user_id']=$newID;
					$data2['user_name']=$newName;
					$data2['grade']=$_POST['grade'];
					$data2['cellphone']=$_POST['cellphone'];
					$data2['email']=$_POST['email'];
					$data2['score']=$_POST['score'];
					$data2['car_id']=$_POST['car_id'];
					$data2['recommender_id']=$_POST['recommender_id'];
					$data2['request']='审批';
					$customer->add($data2);
					$this->assign("jumpUrl","index");
					$this->success("用户新增成功！");
				}
			}
			
		}
		//冻结账户
		public function freeze(){
		
			$customer = M('customer');
			$userID=$_GET['id'];
			$condition['user_id']=$userID;
			$customer->where($condition)->setField('status','冻结');
			$this->assign("jumpUrl","index");
			$this->success("用户冻结成功！");			
		
		}
		//升级账户
		public function upgrade(){
		
			$customer = M('customer');
			$userID=$_GET['id'];
			$condition['user_id']=$userID;
			$customer->where($condition)->setField('grade','S-VIP');
			$this->assign("jumpUrl","index");
			$this->success("用户升级成功！");
		
		}		
		public function requestDeal(){
			
			$db= M('customer');
			$userID=$_GET['id'];

			$userRequest=$db->where('user_id='.$userID)->getField('request');
			if(!empty($userRequest))
			{
				$this->show($userRequest);
				switch($userRequest){
				case "升级":
						$db->where('user_id='.$userID)->setField('grade','S-VIP');
						$db->where('user_id='.$userID)->setField('request','null');
						break;
				case "解冻":
						$db->where('user_id='.$userID)->setField('status','正常');
						$db->where('user_id='.$userID)->setField('request','null');
						break;				
				case "审批":
						$db->where('user_id='.$userID)->setField('status','正常');
						$db->where('user_id='.$userID)->setField('request','null');
						break;	

				}

				$this->redirect('UserManage/index','',0,'操作成功');
				
				
			}else{
				$this->redirect('UserManage/index','',0,'操作失败');
				
			}
			

			
			
		}
		public function requestDelete(){
			
			$db= M('customer');
			$userID=$_GET['id'];

			
			$db->where('user_id='.$userID)->setField('request','null');
			$this->redirect('UserManage/index','',0,'操作成功');
	
				
		}

	public function searchScore(){
		
		$db = M('view_customer');
        import("ORG.Util.Page"); 
	
		$userID=$_POST['userID'];


				
		if($userID!='' )
		{
			$condition['user_id'] = $userID;
			$list = $db->where($condition)->select();
			$this->assign('scoreInfo',$list);
			$this->display('index');
			
		}else{	

			$this->error("请输入检索信息！");
			
		}
	}
	public function modifyScore(){	
	
		$db = M('customer');
		$userID=$_GET['id'];
		$newScore=$_POST['newScore'];
		$this->show($userID);

		if($newScore!='' ){
		  
		    $db->where('user_id='.$userID)->setField('score',$newScore);
			$this->assign("jumpUrl","index");
			$this->success("积分修改成功！");
			//$this->redirect('UserManage/index');
			
		}else{
			$this->assign("jumpUrl","index");
			$this->error("请输入积分！");
		}
		
	}
	
}
?>