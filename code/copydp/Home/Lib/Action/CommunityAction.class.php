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
}