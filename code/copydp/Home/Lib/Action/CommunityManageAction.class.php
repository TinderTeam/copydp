<?php
// 本类由系统自动生成，仅供测试用途
class CommunityManageAction extends Action {

	public function search(){
		$this->assign("currentPage","community");
		if($_SESSION['login_user']!=""){	
			$IDFilter=$_POST['community_id'];
			$titleFilter=$_POST['title'];
			$userFilters=$_POST['user_name'];
			$datetimeFilters=$_POST['datetime'];
			$this->assign("IDFilter",$IDFilter);
			$this->assign("titleFilter",$titleFilter);
			$this->assign("userFilters",$userFilters);
			$this->assign("datetimeFilters",$datetimeFilters);
			
			
			$this->display('index');
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}
    }
	
    public function index(){
		
		if($_SESSION['login_user']!=""){

			$this->assign("currentPage","community");			
			$this->display();
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}
	}
	
	public function delete($communityID=0){
		$communityDB = M('community');
		$deleteCondition['community_id']=$communityID;
		$communityDB->where($deleteCondition)->delete();		
		$this->assign("jumpUrl","index");
		$this->success("操作成功");
	}

	
	public function deleteReply($replyID=0){
		$communityDiscussDB = M('community_discuss');
		$replyCondition['community_discuss_id']=$replyID;
		$communityDiscussDB->where($replyCondition)->delete();		
		$this->success("操作成功");	
	}
}
?>