<?php
// 本类由系统自动生成，仅供测试用途
header("Content-Type:text/html;charset=utf-8");
class SellerManageAction extends Action {
    public function index(){
		$this->assign("currentPage","seller");
		if($_SESSION['login_user']!=""){
	
	    $this->display();
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}
		
    }
	public function recommend($id=0){
		$recDB=M('recommend_product');
		$rcondition['product_id']=$id;
		$recDB->add($rcondition);
		$this->assign("jumpUrl","index");
		$this->success("推荐成功！");
	}
	public function cancelRecomend($id=0){
		$recDB=M('recommend_product');
		$rcondition['product_id']=$id;
		$recDB->where($rcondition)->delete();
		$this->assign("jumpUrl","index");
		$this->success("取消成功！");
	}
	
	public function sellerDelete($sellerID=0){
		//首先删除
		$sellerDB = M('view_seller');
		$sellerIdCondition['user_id']=$sellerID;
		$seller=$sellerDB->where($sellerIdCondition)->select();
		$this->assign("seller",$seller[0]);
	}
	public function sellerEditView($type=0,$sellerID=0){
		$pageType = "create";
		if($type=="edit"){
			$pageType = $type;
			$sellerDB = M('view_seller');
			$sellerIdCondition['user_id']=$sellerID;
			$seller=$sellerDB->where($sellerIdCondition)->select();
			$this->assign("seller",$seller[0]);
		}
		$this->assign("pageType",$pageType);
		$this->assign("sellerID",$sellerID);
		$this->display("sellerAdd");
		
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
			$count = $db->where($condition)->count(); 
			$Page = new Page($count,5); 
			$show = $Page->show();
			$list=$db->order('user_id')->limit($Page->firstRow.','.$Page->listRows)->select();
			$this->assign('page1',$show);
			$this->assign('sellerInfo',$list);
			$this->display('index');	
		}

		}else{
		  $this->redirect('Index/login','',0,'你还没登陆');//页面重定向
		}
	}
	
	    //新增商家
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

					//导入图片上传类  
					import("ORG.Net.UploadFile");  
					//实例化上传类  
					$upload = new UploadFile();  
					$upload->maxSize = 4145728; 
					//$upload->saveRule=time; 
					//设置文件上传类型  
					$upload->allowExts = array('jpg','gif','png','jpeg');  
					//设置文件上传位置  
					$upload->savePath = "./Public/uploads/img/";//这里说明一下，由于ThinkPHP是有入口文件的，所以这里的./Public是指网站根目录下的Public文件夹  
					//设置文件上传名(按照时间)  
					//$upload->saveRule = "time";  
					if (!$upload->upload()){  
						$errMsg=($upload->getErrorMsg());	
						
					}else{  
						//上传成功，获取上传信息  
						$info = $upload->getUploadFileInfo();  
						$data2['img']=$info[0]['savename'];					
					}    
					
					$seller = M('seller');
					$data2['user_id']=$newID;
					$data2['type_id']=$_POST['type_id'];
					$data2['description']=$_POST['description'];
					$data2['position']=$_POST['position'];
					$data2['city_id']=$_POST['city_id'];
					$data2['zone_id']=$_POST['zone_id'];
					$data2['info']=$_POST['info'];
					$seller->add($data2);
					$this->assign("jumpUrl","index");
					$this->success("用户新增成功！");
				}
			}
			
		}
		
		 //新增商家
		public function edit(){
			$user = M('user');			
			$sellerID=$_POST['editSellerID'];
			$condition['user_id'] = $sellerID;
			
					//导入图片上传类  
					import("ORG.Net.UploadFile");  
					//实例化上传类  
					$upload = new UploadFile();  
					$upload->maxSize = 4145728; 
					//$upload->saveRule=time; 
					//设置文件上传类型  
					$upload->allowExts = array('jpg','gif','png','jpeg');  
					//设置文件上传位置  
					$upload->savePath = "./Public/uploads/img/";//这里说明一下，由于ThinkPHP是有入口文件的，所以这里的./Public是指网站根目录下的Public文件夹  
					//设置文件上传名(按照时间)  
					//$upload->saveRule = "time";  
					if (!$upload->upload()){  
						$errMsg=($upload->getErrorMsg());	
						
					}else{  
						//上传成功，获取上传信息  
						$info = $upload->getUploadFileInfo();  
						$data2['img']=$info[0]['savename'];					
					}    					
					$seller = M('seller');
			
					$data2['type_id']=$_POST['type_id'];
					$data2['description']=$_POST['description'];
					$data2['position']=$_POST['position'];
					$data2['city_id']=$_POST['city_id'];
					$data2['zone_id']=$_POST['zone_id'];
					$data2['info']=$_POST['info'];
					print_r($data2);
					$seller->where($condition)->save($data2);
					$this->assign("jumpUrl","index");
					$this->success("用户编辑成功！");
		}
		public function searchProduct(){
		
		if($_SESSION['login_user']!=""){
		
		$db = M('view_product');
        import("ORG.Util.Page"); 
		//mysql_query("set names utf8");
		
		$sellerID=$_GET['seller_id'];
		$productName=$_GET['product_name'];
		$cityID=$_GET['city_id'];
		$typeID=$_GET['type_id'];
		
		if($sellerID!=''){
		   $condition['seller_id'] = $sellerID;
		}
		if($productName!=''){
		   $condition['name'] = $productName;
		}
		if($cityID!=''){
		   $condition['city_id'] = $cityID;
		}
		if($typeID!=''){
		   $condition['type_id'] = $typeID;
		}
        
	
		if($sellerID!='' or $productName!='' or $cityID!='' or $typeID!='')
		{
			$condition['product_status']="待审核";

			$this->assign('sellerCondition',$condition);
			$this->display('index');
			
		}else{	

			$this->assign("jumpUrl","index");
			$this->error("请输入关键搜索信息！");
			
		}

			}else{
		  $this->redirect('Index/login','',0,'你还没登陆');//页面重定向
			}		
		}

		public function requestDeal(){
			
			$db= M('product');
			$productID=$_GET['id'];

			$productRequest=$db->where('product_id='.$productID)->getField('product_status');
			if(!empty($productRequest))
			{
				$db->where('product_id='.$productID)->setField('product_status','正常');


				$this->redirect('SellerManage/index','',0,'操作成功');
				
				
			}else{
				$this->redirect('SellerManage/index','',0,'操作失败');
				
			}
			

			
			
		}
		public function requestDelete(){
			
			$db= M('product');
			$productID=$_GET['id'];

			
			$db->where('product_id='.$productID)->setField('product_status','未批准');
			$this->redirect('SellerManage/index','',0,'操作成功');
	
				
		}

		//批量审批与退回
		public function quantityDeal(){
			
			$db= M('product');
			$productID=$_POST['chkID_'];
			
			//判断id是否数组
			if(is_array($productID)){
				$condition = 'product_id in('.implode(',',$productID).')';
			}else{
				$condition = 'product_id='.$productID;
			}
	
			if (isset($_POST['subSure'])) {
			$db->where($condition)->setField('product_status','正常');
			
			$this->assign("jumpUrl","index");
			$this->success("批量处理成功！");
			}
			if (isset($_POST['subQuit'])) {
			
			$db->where($condition)->setField('product_status','未批准');
			
			$this->assign("jumpUrl","index");
			$this->success("批量退回成功！");
			}			
		}




}
?>