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
	public function searchSeller(){
		if($_SESSION['login_user']!=""){
		
		$db = M('view_seller');
        import("ORG.Util.Page"); 
		//mysql_query("set names utf8");
		$sellerID=$_GET['seller_id'];
		$sellerName=$_GET['seller_name'];
		$cityName=$_GET['city_name'];
		$typeName=$_GET['type_name'];
		
		if($sellerID!=''){
		   $condition['user_id'] = $sellerID;
		}
		if($sellerName!=''){
		   $condition['username'] = $sellerName;
		}
		if($cityName!=''){
		   $condition['city'] = $cityName;
		}
		if($typeName!=''){
		   $condition['type_name'] = $typeName;
		}

	
		if($sellerID!='' or $sellerName!='' or $cityName!='' or $typeName!='')
		{


			$count = $db->where($condition)->count(); 
			$Page = new Page($count,5); 
			$show = $Page->show();
			$list=$db->where($condition)->order('user_id')->limit($Page->firstRow.','.$Page->listRows)->select();
			$this->assign('page1',$show);
			$this->assign('sellerInfo',$list);
			$this->display('index');
			
		}else{	

			$this->assign("jumpUrl","index");
			$this->error("请输入关键搜索信息！");
			
		}

		}else{
		  $this->redirect('Index/login','',0,'你还没登陆');//页面重定向
		}
	}
	
	    //新增用户
		public function add(){			
			$user = M('user');			
			$newName=$_POST['seller_name'];
			$condition['username'] = $newName;
			
			$select=$user->where($condition)->count();	
			
			if ($select!=0){
					$this->assign("jumpUrl","index");
					$this->error("该用户名已经存在！");			
			}else{
				$data['username']=$newName;
				$data['role']='SELLER';
				$user->add($data);
				$SellerNameCondition['username'] = $newName;
				$newID=$user->where($SellerNameCondition)->getField('user_id');
						
				if(empty($newID)){
					$this->assign("jumpUrl","index");
					$this->error("新增用户编号失败！");
					
				}else{

					$seller = M('seller');
					$data2['user_id']=$newID;
					$data2['type_id']=$_POST['type_id'];
					$data2['description']=$_POST['description'];
					$data2['position']=$_POST['position'];
					$data2['img']=$_POST['img'];
					$data2['city_id']=$_POST['city_id'];
					$data2['zone_id']=$_POST['zone_id'];
					$data2['info']=$_POST['info'];
					$seller->add($data2);
					$this->assign("jumpUrl","index");
					$this->success("用户新增成功！");
				}
			}
			
		}
		public function searchProduct(){
		
		if($_SESSION['login_user']!=""){
		
		$db = M('product');
        import("ORG.Util.Page"); 
		//mysql_query("set names utf8");
		
		$sellerID=$_GET['seller_id'];
		$sellerName=$_GET['seller_name'];
		$cityName=$_GET['city_name'];
		$typeName=$_GET['type_name'];
		
		if($sellerID!=''){
		   $condition['user_id'] = $sellerID;
		}
		if($sellerName!=''){
		   $condition['username'] = $sellerName;
		}
		if($cityName!=''){
		   $condition['city'] = $cityName;
		}
		if($typeName!=''){
		   $condition['type_name'] = $typeName;
		}

	
		if($sellerID!='' or $sellerName!='' or $cityName!='' or $typeName!='')
		{


			$count = $db->where($condition)->count(); 
			$Page = new Page($count,5); 
			$show = $Page->show();
			$list=$db->where($condition)->order('user_id')->limit($Page->firstRow.','.$Page->listRows)->select();
			$this->assign('page1',$show);
			$this->assign('sellerInfo',$list);
			$this->display('index');
			
		}else{	

			$this->assign("jumpUrl","index");
			$this->error("请输入关键搜索信息！");
			
		}

		}else{
		  $this->redirect('Index/login','',0,'你还没登陆');//页面重定向
		}		
		}

		




}
?>