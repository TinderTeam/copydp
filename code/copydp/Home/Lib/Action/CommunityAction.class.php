<?php
// 本类由系统自动生成，仅供测试用途
class CommunityAction extends Action {
    public function community(){		
		$this->display();
    }
	public function selectType($typeName=0){
		$this->assign('typeName',$typeName);
		$this->display('community');
    }
	
	public function cmnty_info($communityID=0){
		$this->assign('communityID',$communityID);
		$this->display();
    }
	
	public function reply(){
		$communityID=$_POST['communityID'];
		$reply=$_POST['textarea_reply'];	
		$userID=$_POST['user_id'];
		if($userID==''){
			$userID=1000;
		}
		
		$discuss = M('community_discuss');	
		$data['user_id']=$userID;
		$data['content']=$reply;
		$data['community_id']=$communityID;
		$data['datetime']= date('Y-m-d H:i:s',time());
		$discuss->add($data);

		$this->assign('communityID',$communityID);
		$this->display('cmnty_info');
    }
}