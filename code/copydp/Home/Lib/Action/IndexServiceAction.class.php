<?php
// 本类由系统自动生成，仅供测试用途


class IndexServiceAction extends BaseAction {
	 
	public function login_rest()
	{
	  $req =  $this->getReqObj();
  
	 
	  $condition['username']= $req->userName;
	  $db= M('user');
	  $user = $db->where($condition)->find();
	  $Rsp[token] = $this->uuid();
	  $Rsp[user] = $user;
	  
	  
	  $this->returnJson($Rsp);

	}
  
	
}