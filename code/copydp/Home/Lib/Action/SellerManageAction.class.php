<?php
// 本类由系统自动生成，仅供测试用途
header("Content-Type:text/html;charset=utf-8");

class SellerManageAction extends BaseAction {
    public function index(){
		$this->assign("currentPage","seller");
		
		if($_SESSION['login_user']!=""){  
		
		    $db = M('view_seller');
		    import("ORG.Util.Page");
		    $count = $db->count();
		    $Page = new Page($count,5);
		    $show = $Page->show();
		    $list=$db->order('user_id')->limit($Page->firstRow.','.$Page->listRows)->select();
		    $this->assign('page1',$show);
		    $this->assign('sellerInfo',$list);
            $this->display();
			
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");	
		}
    }

	public function svipOrder($type=0){
		
		$this->debug('show svip product order page...');
		import("ORG.Util.Page");
		
		$orderDB = M('view_order');
		$svipProductConditionEmpty['svip_product_id']=array('neq',"");
		$svipProductConditionNormal['svip_product_id']=array('neq',"普通");
		$svipProductConditionNormal['_complex'] = $svipProductConditionEmpty;

		if($_POST['product_name']!=null){
			$filter['product_name']=array('like','%'.$_POST['product_name'].'%');;
		}
		
		$this->debug('type='.$type);
		if($type!=0){
			$this->debug('in');
			$db=new Model('user');
			$userName=$_SESSION['login_user'];
			$condition['username']=$userName;	
			$user_id= $db->where($condition)->getField('user_id');
			$filter['seller_id']=$user_id;
		}
		
		
		if($_POST['seller_name']!=null){
			$filter['seller_name']=array('like','%'.$_POST['seller_name'].'%');;
		}
		
			
		if($_POST['typeID']!=null){
			$filter['type_id']=$_POST['typeID'];
		}
		
		
		trace($_POST['product_id'],'info');
		trace($_POST['seller_name'],'info');
		trace($_POST['typeID'],'info');
		
		if(count($filter)!=0){
			trace('in','info');
			$svipProductConditionNormal['_complex'] = $filter;	
		}

		$count = $orderDB->where($svipProductConditionNormal)->count();
		$this->debug("select all svip products' order. counts: ".$count);
		$Page = new Page($count,5);
		$show = $Page->show();
		$list=$orderDB->where($svipProductConditionNormal)->order('order_id')->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('page1',$show);	
		$this->assign('list',$list);
		$this->display();
	}
	
	public function svipProductRemove($id=0){
		trace($info,'id='.$id);
		//create product
		$productdb=M('product');
		$dataProduct['svip_product_id']=$id;
		$productdb->where($dataProduct)->delete();			
		$svipProductdb= M('svip_product');
		$datasvip['svip_product_id']=$id;
		$svipProductdb->where($datasvip)->delete();	
		trace($info,'delete svip product');
		$this->redirect('SellerManage/index','',0,'全部查询');//页面重定向
	}
	
	public function searchsvip($data=0){
		trace($info,'data='.$data);
		//load seller list
		$sellerdb= M('view_seller');
		$sellercdt['username'] = array('LIKE','%'.$data.'%');
		$sellerInfo=$sellerdb->where($sellercdt)->select();	
		$json=json_decode($sellerInfo);
		trace($info,'load seller list. list='.$sellerInfo);
		$this->ajaxReturn($sellerInfo, 'Ajax 成功！', 1);
	}
	
	public function showCode($id=0){
		$sellerdb = M('seller');
		$sellerIDCondition['user_id']=$id;
		$Data['qr_code']='true';
		$sellerdb->where($sellerIDCondition)->save($Data);
		$this->ajaxReturn('true'.$data, 'Ajax 成功！', 1);
	}
		
	public function hideCode($id=0){
		$sellerdb = M('seller');
		$sellerIDCondition['user_id']=$id;
		$Data['qr_code']='false';
		$sellerdb->where($sellerIDCondition)->save($Data);
		
		$this->ajaxReturn('true'.$data, 'Ajax 成功！', 1);
	}
	
	public function svipEdit($type=0,$id=0){
	
		if($type=='edit'){
			trace($info,'edit svip product. id='.$id);
			$this->assign('id',$id);
		}
		
		//load seller list
		$sellerdb= M('view_seller');		
		$sellerInfo=$sellerdb->select();
		trace($info,'load seller list. list='.$sellerInfo);
		
		//log
		trace($info,'create a svip product');
		
		$this->assign('sellerInfo',$sellerInfo);
		$this->assign('type',$type);
		$this->display();
	}
	
	
	public function saveSVIPProduct(){	
		$type=$_POST['type'];
		trace($info,$type);	
	//图片处理
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
			if($_POST['type']=='edit'){
			
			}else{
				$errMsg=($upload->getErrorMsg());
			}					
        }else{  
            //上传成功，获取上传信息  
            $info = $upload->getUploadFileInfo();  
			$imgsrc=$info[0]['savename'];
        }    
		
	//图片处理over
			//log
			$svipProductdb= M('svip_product');
			$datasvip['limit_consumption_num']=$_POST['limit_consumption_num'];
			$datasvip['limit_consumption_period']=$_POST['limit_consumption_period'];
			$datasvip['create_datetime']=date('y-m-d h:i:s',time());
			$productNotice = M('product_notice');
			$idListStr=$_POST['sellerIDList'];
			$idList=explode(',',$idListStr);
				

			$datap['name']=$_POST['name'];
			$datap['type_id']=$_POST['type_id'];
			$this->debug('id='.$datap['type_id']);
			$datap['update_date']=date('y-m-d h:i:s',time());
			$datap['end_date_time']=$_POST['end_date_time'];
			$datap['price']=$_POST['price'];
			$datap['original_price']=$_POST['original_price'];
			$datap['describe']=$_POST['dsrc'];
			$datap['basic_infor']=$_POST['info'];
			
			$data3['orderinfo']=$_POST['orderinfo'];			
			$data3['rule']=$_POST['rules'];
			$data3['warning']=$_POST['warning'];	
			
		
			$datap['imgsrc']=$imgsrc;
			$datap['product_status']='正常';
				
		if($type!='edit'){
		
		
			//create svip
			$svipid=$svipProductdb->add($datasvip);	
			trace($info,'save svip product');	
			
			//create product
			$productdb=M('product');

			foreach($idList as $id){
				
				trace($info,'idList[]'.$id);
				$datap['seller_id']=$id;
				$datap['svip_product_id']=$svipid;				
				$newID=$productdb->add($datap);
				$data3['product_id']=$newID;			
				$productNotice ->add($data3);				
			}				
			trace($info,'save product');
		}else if($type=='edit'){
		
			$this->debug('create');
			
			$this->info('edit svip product');
			//对每一个子产品进行一次更新，更新的原则：1.新增、2.修改、3.删除		
			//先获取原产品列表
			$svipProduct = M('view_svip_product');
			$svipProductIDCondition['svip_product_id']=$_POST['svip_product_id'];
			$svipProduct=$svipProduct->where($svipProductIDCondition)->find();
			$productViewDB=M('view_product');
			$productIDCondiiton['svip_product_id']=$id;
			$oldProductList= $productViewDB->where($svipProductIDCondition)->select();	
			$productDB=M('product');
			//根据旧产品序列进行更新
			$this->debug('update by old product list');
			foreach($oldProductList as $oldProduct){			
				$oldProductExist=false;
				foreach($idList as $id){					
					if($id==$oldProduct['seller_id']){
						$this->debug('id item matched,id:'.$id);
						$oldProductExist=true;
						//更新产品
						$upadateCondition['seller_id']=$id;
						$upadateCondition['svip_product_id']=$_POST['svip_product_id'];
						$datap['product_status']='正常';
						$productDB->where($upadateCondition)->save($datap);
						
						$currentProduct=$productDB->where($upadateCondition)->find();
						$IDcondition['product_id']=$currentProduct['product_id'];
						$productNotice ->where($IDcondition)->save($data3);
					}
				}		
				if(!$oldProductExist){
					//删除旧的产品(状态变更)
					$this->debug('Id item unmatched. Item will be deleted,id:'.$oldProduct['seller_id']);
					$deleteCondition['svip_product_id']=$_POST['svip_product_id'];
					$deleteCondition['seller_id']=$oldProduct['seller_id'];						
					$datap['product_status']='已停止';
					$productDB->where($deleteCondition)->save($datap);
				}
			}
			
			trace('update by new product list','info');
			//根据新产品序列进行更新
			foreach($idList as $id){
				$newProductExist=false;
				foreach($oldProductList as $oldProduct){
					if($id==$oldProduct['seller_id']){
						$this->debug('new id item exist');
						$newProductExist=true;
					}
				}
				if(!$newProductExist){
					//新建新子产品
					$this->debug('new Id item unmatched. Item will be created,id:'.$id);
					$datap['seller_id']=$id;
					$datap['svip_product_id']=$_POST['svip_product_id'];
					$newID=$productdb->add($datap);
					$data3['product_id']=$newID;			
					$productNotice ->add($data3);	
				}
			}
			
		}
		$this->redirect('SellerManage/index','',0,'全部查询');//页面重定向
	}
	
	
	public function recommend($id=0){
		$recDB=M('recommend_product');
		$rcondition['product_id']=$id;
		$recDB->add($rcondition);
		$this->redirect('SellerManage/index#RecProduct','',0,'全部查询');//页面重定向
	}
	public function cancelRecomend($id=0){
		$recDB=M('recommend_product');
		$rcondition['product_id']=$id;
		$recDB->where($rcondition)->delete();
		$this->redirect('SellerManage/index#RecProduct','',0,'全部查询');//页面重定向
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
		$typeID=$_GET['typeID'];
		trace($typeID,'提示');
		if($sellerID!=''){
		   $condition['user_id'] = $sellerID;
		}
		if($sellerName!=''){
		   $condition['username'] = $sellerName;
		}
		if($cityName!=''){
		   $condition['city'] = $cityName;
		}
		if($typeID!=''){
		   $condition['type_id'] = $typeID;
		}

	
		if($sellerID!='' or $sellerName!='' or $cityName!='' or $typeID!='')
		{


			$count = $db->where($condition)->count(); 
			$Page = new Page($count,5); 
			$show = $Page->show();
			$list=$db->where($condition)->order('user_id')->limit($Page->firstRow.','.$Page->listRows)->select();
			$this->assign('page1',$show);
			$this->assign('sellerInfo',$list);
			$this->display('index');
			
		}else{	
		    $this->redirect('SellerManage/index','',0,'全部查询');//页面重定向
		}

		}else{
		  $this->redirect('Index/login','',0,'你还没登陆');//页面重定向
		}
	}
	
	    //新增商家
		public function add(){
			$user = M('user');			
			$newName=$_POST['seller_id'];
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
					$data2['seller_name']=$_POST['seller_name'];
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
					$data2['seller_name']=$_POST['seller_name'];					
					$data2['type_id']=$_POST['type_id'];
					$data2['description']=$_POST['description'];
					$data2['position']=$_POST['position'];
					$data2['city_id']=$_POST['city_id'];
					$data2['zone_id']=$_POST['zone_id'];
					$data2['info']=$_POST['info'];
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
    			$this->assign('nav','#ProductManage');
    			$this->display('index');
    			
    		}else{	
    
    			$this->redirect('SellerManage/index#ProductManage','',0,'全部查询');//页面重定向
    			
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

				$this->redirect('SellerManage/index#ProductManage','',0,'操作成功');
				
				
			}else{
				$this->redirect('SellerManage/index','',0,'操作失败');
				
			}
			

			
			
		}
		public function requestDelete(){
			
			$db= M('product');
			$productID=$_GET['id'];
			$db->where('product_id='.$productID)->setField('product_status','未批准');
			$this->redirect('SellerManage/index#ProductManage','',0,'操作成功');
	
				
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
			
			$this->redirect('SellerManage/index#ProductManage','',0,'操作成功');
			}
			if (isset($_POST['subQuit'])) {
			
			$db->where($condition)->setField('product_status','未批准');
			
			$this->redirect('SellerManage/index#ProductManage','',0,'操作成功');
			}			
		}
		//商家批量冻结与解冻
		public function freezeDeal($type=0){
		    	
		    $sellerDB= M('seller');
		    $productDB = M('product');
		    $sellerID=$_POST['chkID_'];
		    	
		    //判断id是否数组
		    if(is_array($sellerID)){
		        $condition = 'user_id in('.implode(',',$sellerID).')';
		        $productCondition = 'seller_id in('.implode(',',$sellerID).')';
		    }else{
		        $condition = 'user_id='.$sellerID;
		        $productCondition = 'seller_id='.$sellerID;
		    }
		    
		    if ($type=='freeze') {
		        $sellerDB->where($condition)->setField('status','冻结');
		        $productDB->where($productCondition)->setField('product_status','已过期');	
		        $this->assign("jumpUrl","index");
		        $this->success("批量冻结成功！");
		    }
		    if ($type == 'unfreeze') {
		        	
		        $sellerDB->where($condition)->setField('status','正常');
		        $productDB->where($productCondition)->setField('product_status','正常');
		        $this->assign("jumpUrl","index");
		        $this->success("批量解冻成功！");
		    }
		}

		public function searchRecProduct(){
		
		    if($_SESSION['login_user']!=""){
	
		        $db = M('view_product');
		        //import("ORG.Util.Page");
		        //mysql_query("set names utf8");
				
		        $productID=$_GET['product_id'];
		        $productName=$_GET['product_name'];
		        $cityID=$_GET['city_id'];
		        $typeID=$_GET['type_id'];
		
		        if($productID!=''){
		            $condition['product_id'] = $productID;
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
		
		         
		        if($productID!='' or $productName!='' or $cityID!='' or $typeID!='')
		        {
					
		            $this->assign('RecCondition',$condition);
		            $this->assign('nav','#RecProduct');
		            $this->display('index');
		             
		        }else{
					
		            $this->redirect('SellerManage/index#RecProduct','',0,'全部查询');//页面重定向
		             
		        }
		
		    }else{
		        $this->redirect('Index/login','',0,'你还没登陆');//页面重定向
		    }
		}



}
?>