<?php
// 本类由系统自动生成，仅供测试用途
class ActivityManageAction extends Action {
    public function index(){
		$this->assign("currentPage","activity");
		if($_SESSION['login_user']!=""){	
			//产品截至时间到期，且处于已下单状态的订单更新为已过期
			$activity = M('activity');
			$deadlineCondition['datelimit']=array('LT',date('Y-m-d H:i:s',time()));		//判断截至时间小于当前时间的条件
			$data['status'] = "已结束";
			$activity->where($deadlineCondition)->where('status="进行中"')->save($data);		//更新订单状态

			$this->display();
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}
		
    }
	public function search(){
		$this->assign("currentPage","activity");
		if($_SESSION['login_user']!=""){	
			$IDFilter=$_POST['acty_id'];
			$nameFilter=$_POST['acty_title'];
			$cityFilters=$_POST['acty_city'];
			
			$this->assign("IDFilter",$IDFilter);
			$this->assign("nameFilter",$nameFilter);
			$this->assign("cityFilters",$cityFilters);
			
			$this->display('index');
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}
    }
	public function cancelActivity($activityID=0){
		
		$activity = M('activity');
		$IDcondition['activity_id'] = $activityID;
		$data['status']="已取消";
		if($activity->where($IDcondition)->save($data))
		{
			$this->assign("jumpUrl","index");
			$this->success("取消成功");
		}
		else
		{
			$this->assign("jumpUrl","index");
			$this->error("操作失败，请重试");
		}
		//$this->assign("currentPage","activity");
		//$this->display('index');		
	}
	public function deleteActivity($activityID=0){
		
		$activity = M('activity');
		$IDcondition['activity_id'] = $activityID;
		if($activity->where($IDcondition)->delete())
		{
			$this->assign("jumpUrl","index");
			$this->success("删除成功");
		}
		else
		{
			$this->assign("jumpUrl","index");
			$this->error("操作失败，请重试");
		}
		//$this->assign("currentPage","activity");
		//$this->display('index');		
	}
	public function activityEdit($activityID=0){
		$this->assign("currentPage","activity");		
		$this->assign("newActivity",false);
		$this->assign("activityID",$activityID);
		$this->display();
	}

	public function newActivity(){
		$this->assign("currentPage","activity");
		$this->assign("newActivity",true);
		$this->display('activityEdit');
	}
	
	public function saveActivity(){
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
			$data2['imgsrc']=$info[0]['savename'];
        }    
        //保存表单数据，包括上传的图片 
		$activity = M('activity');
		$data2['title']=$_POST['title'];			
		$data2['datetime']=date('Y-m-d H:i:s',time());
		$data2['dscr']=$_POST['dscr'];	
		$data2['address']=$_POST['address'];	
		$data2['info']=$_POST['info'];	
		$data2['city_id']=$_POST['city_id'];	
		$data2['datelimit']=$_POST['datelimit'];	
		$data2['memberlimit']=$_POST['memberlimit'];	
		
		$data2['point']=$_POST['point'];
		if($_POST['activity_id']!=''){
			$IDcondition['activity_id']=$_POST['activity_id'];
			$activity->where($IDcondition)->save($data2);
		}else{			
			$activity->add($data2);
		}
		$this->display('index');			
		$this->assign("jumpUrl","index");
		$this->success("成功提交");
	}
}
?>