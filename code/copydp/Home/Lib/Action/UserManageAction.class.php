<?php
// 本类由系统自动生成，仅供测试用途
class UserManageAction extends Action {
    public function index(){

	
	    $this->display();
		//$this->redirect('Index/login','',2,'暂时没有用户名和密码校验！')；
    }
	public function login(){
		if($_SESSION['login_user']!=""){
	    
			$this->display('index');
		}else{
			$this->display();
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
		
		$db = M('customer');
        import("ORG.Util.Page"); 
	
		//mysql_query("set names utf8");


		$userID=$_POST['userID'];
		//$userID=1;
		$userName=$_POST['userName'];
		$phoneNum=$_POST['phoneNum'];
		
		if($userID!=''){
		   $condition['user_id'] = $userID;
		}
		if($userName!=''){
		   $condition['user_name'] = $userName;
		}
		if($phoneNum!=''){
		   $condition['cellphone'] = $phoneNum;
		}		
		if($userID!='' or $userName!='' or $phoneNum!='')
		{
			//$map="user_name like('%".$userName."%') or user_id like('%".$userID."%' ) or cellphone like('%".$phoneNum."%')";

			
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

		public function add(){
			
			$db = M('customer');
/* 			$data['user_name']=$_POST['userName'];
			$data['cellphone']=$_POST['phoneNum'];
			$data['email']=$_POST['userMail'];
			$data['score']=$_POST['score'];
			$data['car_id']=$_POST['carID'];
			$data['recommender_id']=$_POST['recomendID']; */
			if ($db->create())
			{	
				if($db->add())
				{
					$this->assign("jumpUrl","index");
					$this->success("用户新增成功！");
				}else{
					$this->assign("jumpUrl","index");
					$this->error("用户新增失败！");
				}
			}else{
					$this->assign("jumpUrl","index");
					$this->error("信息输入为空！");
			}
	
			
			
		}
	
	
}