<?php
// 本类由系统自动生成，仅供测试用途
class UserManageAction extends Action {
    public function index(){
		$this->assign("currentPage","user");
		if($_SESSION['login_user']!=""){

            //加载会员管理列表
            import("ORG.Util.Page");
            $db = M('view_customer');
            $list = $db->select();
            $this->assign('userInfo',$list);
            $count = $db->count();
            $Page = new Page($count,5);
            $show = $Page->show();
            $this->assign('page',$show);
            
            //加载积分管理列表
            $this->assign('scoreInfo',$list);

            //加载激活码
            $codeDB= M('poll_code');
            $codeList = $codeDB->select();
            $this->assign("codeList",$codeList);
            
            $this->display();
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}	
		

    }
	
	public function becomevip(){
		if(empty($_SESSION['login_user'])){								
			$this->assign("jumpUrl","login");
			$this->error("请先登录");
		}else{
			//获取用户信息
			$db=new Model('user');
			$userName=$_SESSION['login_user'];
			$condition['username']=$userName;	
			$role =  $db->where($condition)->getField('role');
			$user_id= $db->where($condition)->getField('user_id');
			if($role=='CUSTOMER'){
				$customer = M('customer');
				$userID=$user_id;
				$condition['user_id']=$userID;
				$customer->where($condition)->setField('request','升级');
				$this->success("申请成功，请等待管理员审批");
			}else{
				$this->error("该类型用户不支持此功能！");
			}	
		}
		
		
		
	}
 	public function check(){
		session_start();
        $time=30*60; 
        setcookie(session_name(),session_id(),time()+$time,"/");
		

      
			if(isset($_POST['name'])&&isset($_POST['pwd'])){
				$admin= M('user');
        
				$condition['username']=$_POST['name'];
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
			//$this->assign('nav','#UserManage');
			$this->display('index');
			
		}else{

		    $this->redirect('UserManage/index','',0,'全部查询');//页面重定向
		    //$this->assign("jumpUrl","index");
		    //$this->success("请输入关键信息!");
			//echo "<script>alert('请输入关键信息!');history.back();</script>";
			
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
		
		public function freezeControl($type=0){
			$customer = M('customer');
			$userID=$_POST['chkID_'];
			
			
			//判断id是否数组
			if(is_array($userID)){
				$condition = 'user_id in('.implode(',',$userID).')';
			}else{
				$condition = 'user_id='.$userID;
			}
			if($type=='freeze'){
				$customer->where($condition)->setField('status','冻结');
			}else if ($type == 'unfreeze'){
				$customer->where($condition)->setField('status','正常');
			}
		
			$this->assign("jumpUrl","index");
			$this->success("用户冻结/解冻成功！");
		}
		
		//解冻账户
		public function unfreeze(){
		
		    $customer = M('customer');
		    $userID=$_GET['id'];
		    $condition['user_id']=$userID;
		    $customer->where($condition)->setField('status','正常');
		    $this->redirect('UserManage/index','',0,'操作成功');
		
		}
		//冻结账户
		public function freeze(){
		
			$customer = M('customer');
			$userID=$_GET['id'];
			$condition['user_id']=$userID;
			$customer->where($condition)->setField('status','冻结');
			$this->redirect('UserManage/index','',0,'操作成功');			
		
		}
		//升级账户
		public function upgrade(){
		
			$customer = M('customer');
			$userID=$_GET['id'];
			$condition['user_id']=$userID;
			$now = date("Y-m-d",strtotime("+1 year"));
			$customer->where($condition)->setField('grade','SVIP');
$customer->where($condition)->setField('vip_limit_date',$now);				
			$this->redirect('UserManage/index','',0,'操作成功');
		
		}	

		//验证码查询
		public function SearchCode(){
			if($_POST['codeStatus']==""){
				$codeStatus="全部";
			}else{
				$codeStatus=	$_POST['codeStatus'];
			}
			
			
			$codeDB= M('poll_code');     
			if($codeStatus!='全部'){
				$codecondition['status']=$codeStatus;
				$codeList = $codeDB->where($codecondition)->select();
			}else{
				$codeList = $codeDB->select();
			}
			$this->assign('nav','#CodeManage');
			$this->assign("codeList",$codeList);
			$this->display('index');
		}
		
		//验证码删除
		public function CodeDelete($code=0){		
			$codeDB= M('poll_code');     
			$codecondition['code']=$code;
			$codeDB->where($codecondition)->delete();
			$codeList = $codeDB->select();			
			$this->assign("codeList",$codeList);
			$this->assign('nav','#CodeManage');
			$this->display('index');
		}
		
		//验证码新增
		public function createCode($num=0){				
			$codeDB= M('poll_code');  
			$length=(int)$num;    			
			for($i =0;$i<$length;$i++){
				$newCode['code']=$this->getRandStr(10);
				$newCode['status']='未使用';
				$codeDB->add($newCode);
			}
			$codeList = $codeDB->select();			
			$this->assign("codeList",$codeList);
			$this->assign('nav','#CodeManage');
			$this->display('index');
		}
		
		function getRandStr($length) { 
			$str = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'; 
			$randString = ''; 
			$len = strlen($str)-1; 
				for($i = 0;$i < $length;$i ++){ 
				$num = mt_rand(0, $len); 
				$randString .= $str[$num]; 
				} 
			return $randString ; 
			}
		
		public function requestDeal(){
			
			$db= M('customer');
			$userID=$_GET['id'];

			$userRequest=$db->where('user_id='.$userID)->getField('request');
			if(!empty($userRequest))
			{
				switch($userRequest){
				case "升级":
						$db->where('user_id='.$userID)->setField('grade','S-VIP');
						$db->where('user_id='.$userID)->setField('request','null');
						break;				
				case "审批":
						$db->where('user_id='.$userID)->setField('status','正常');
						$db->where('user_id='.$userID)->setField('request','null');
						break;	

				}

				$this->redirect('UserManage/index#UserRequest','',0,'操作成功');
				
				
			}else{
				$this->redirect('UserManage/index','',0,'操作失败');
				
			}
			

			
			
		}
		public function requestDelete(){
			
			$db= M('customer');
			$userID=$_GET['id'];
			
			
			$db->where('user_id='.$userID)->setField('request','null');
			$db->where('user_id='.$userID)->setField('status','已拒绝');
			$this->redirect('UserManage/index#UserRequest','',0,'操作成功');
	
				
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
			$this->assign('nav','#ScoreManage');
			$this->display('index');
			
		}else{

			$this->redirect('UserManage/index#ScoreManage','',0,'全部查询');
			
		}
	}
	public function modifyScore(){	
	
		$db = M('customer');
		$userID=$_GET['id'];
		$newScore=$_POST['newScore'];
		$this->show($userID);

		if($newScore!='' ){
		  
		    $db->where('user_id='.$userID)->setField('score',$newScore);
			$this->redirect('UserManage/index#ScoreManage','',0,'全部查询');
			//$this->redirect('UserManage/index');
			
		}else{
			$this->assign("jumpUrl","index");
			$this->error("请输入积分！");
		}
		
	}
	public function userAdd(){
	$this->assign("currentPage","user");
		$this->display();
	}	
}
?>