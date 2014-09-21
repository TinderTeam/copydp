<?php
// 本类由系统自动生成，仅供测试用途

header("Content-Type:text/html;charset=utf-8");
class SellerManageAction extends Action {
    public function index(){

	
	    $this->display();
		
    }
	
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
			//$map="user_name like('%".$userName."%') or user_id like('%".$userID."%' ) or cellphone like('%".$phoneNum."%')";

			
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



}
?>