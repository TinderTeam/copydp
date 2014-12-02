<?php
// 本类由系统自动生成，仅供测试用途
class NewsAction extends BaseAction {
    public function newsShow($newsID=0){	
		$this->assign('newsID',$newsID);	
		$this->display();
    }
    //APP获取最新资讯List
    public function getNewsList_rest(){
        
        $newsDB=new Model('news');
        $newsList=$newsDB->order('rand()')->limit(6)->select();
        $errorCode = SUCCESS;
        if($newsList==false)
        {
            $newsList = null;
        }
        $Rsp['newsList'] = $newsList;
        $this->returnJson($errorCode,$Rsp);
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
	
	public function newTopic(){
		$this->display();
	}
	public function saveTopic(){
		$this->assign("currentPage","user");
		if($_SESSION['login_user']!=""){
			//获取用户信息
			$db=new Model('user');
			$userName=$_SESSION['login_user'];
			$condition['username']=$userName;	
			$user_id= $db->where($condition)->getField('user_id');
			
			$communityDB=M('community');	
			$Data['context']=$_POST['info'];
			$Data['title']=$_POST['title'];	
			$Data['datetime']=date('Y-m-d H:i:s',time());
			$Data['community_type']=$_POST['community_type'];			
			$Data['customer_id']=$user_id;
			$communityDB->add($Data);
			
			$this->display('community');
		}else{
		  	$this->assign("jumpUrl","__APP__/Index/login");
			$this->error("您还没有登录呢");
		}	
			
	}
}