<?php
// 本类由系统自动生成，仅供测试用途

header("Content-Type:text/html;charset=utf-8");
class SellerManageAction extends Action {
    public function index(){
		if($_SESSION['login_user']!=""){
	
	    $this->display();
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}
		
    }
	//搜索
	public function search(){
		if($_SESSION['login_user']!=""){
		
		$db = M('seller');
        import("ORG.Util.Page"); 
		//mysql_query("set names utf8");
		$sellerID=$_POST['seller_id'];
		$sellerName=$_POST['seller_name'];
		$cityID=$_POST['city_id'];
		$typeID=$_POST['type_id'];
		
		if($sellerID!=''){
		   $condition['seller_id'] = $sellerID;
		}
		if($sellerName!=''){
		   $condition['seller_name'] = $sellerName;
		}
		if($cityID!=''){
		   $condition['city_id'] = $cityID;
		}
		if($typeID!=''){
		   $condition['type_id'] = $typeID;
		}			
		if($sellerID!='' or $sellerName!='' or $cityID!='' or $typeID!='')
		{

			$list = $db->where($condition)->select();
			$this->assign('sellerInfo',$list);
			$count = $db->where($condition)->count(); 
			$Page = new Page($count,5); 
			$show = $Page->show();
			$this->assign('page',$show);
			$this->display('index');
			
		}else{	

			echo "<script>alert('请输入关键信息!');history.back();</script>";
			
		}
		
		}else{
		  $this->redirect('Index/login','',0,'你还没登陆');//页面重定向
		}
	}
	
	    //新增用户
		public function add(){
			
			$user = M('seller');
			
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



}
?>