<?php
// 本类由系统自动生成，仅供测试用途
class CommunityAction extends CommunityServiceAction {
    public function community(){		
		$this->display();
    }
    //APP获取热点推荐帖子列表
    public function HotRecommend_rest(){
    
        $communityDB=new Model('view_community_customer');
		$communityList=$communityDB->order('rand()')->limit(6)->select();
    
        $errorCode = SUCCESS;
        if($communityList == false)
        {
            $communityList = null;
        }
        $Rsp['communityList'] = $communityList;
        $this->returnJson($errorCode,$Rsp);
    }
    //APP获取热门话题帖子列表
    public function HotTopic_rest(){
    
        $communityDiscussViewDB=new Model('view_community_discuss_sum');
		$communityDiscussSum=$communityDiscussViewDB->order('discuss_num desc')->limit(6)->select();
    
        $errorCode = SUCCESS;
        if($communityDiscussSum == false)
        {
            $communityDiscussSum = null;
        }
        $Rsp['communityDiscussSum'] = $communityDiscussSum;
        $this->returnJson($errorCode,$Rsp);
    }
    //APP获取所有帖子列表
    public function AllCommunity_rest(){
    
        $req =  $this->getReqObj();
        $communityType = $req->communityType;
        $this->log($communityType);
        
        $allCommunityListResult = parent::AllCommunityService($communityType);
        
        $errorCode = $allCommunityListResult['errorCode'];
        if($allCommunityListResult['communityList'] == false)
        {
            $allCommunityListResult['communityList'] = null;
        }
        $Rsp['communityList'] = $allCommunityListResult['communityList'];
        
        $this->returnJson($errorCode,$Rsp);
    }
    //APP获取会员热榜帖子列表
    public function HotUser_rest(){
    
        $communityUserDB=new Model('view_community_customer');
        $communityList=$communityUserDB->order('customer_number desc')->limit(10)->select();
        if($communityList==false)
        {
            $errorCode = RESULT_NULL;
            $communityList == null;
        }
        else{
            $errorCode = SUCCESS;
            $Rsp['communityList'] = $communityList;
        }
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
    //APP回复帖子
    public function CreateReply_rest()
    {
        $req =  $this->getReqObj();
        $replyInfo['userID'] = $req->userID;
        $replyInfo['communityID'] = $req->community_id;
        $replyInfo['content'] = $req->content;
        $this->log($replyInfo);
        if($replyInfo['userID'] =='')
        {
            $userID=1000;
        }
        $discuss = M('community_discuss');	
		$data['user_id']=$replyInfo['userID'] ;
		$data['content']=$replyInfo['content'];
		$data['community_id']= $replyInfo['communityID'];
		$data['datetime']= date('Y-m-d H:i:s',time());
		$discuss->add($data);
        
        $errorCode = SUCCESS;
        $this->returnJson($errorCode,null);
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
	//APP创建新帖子
	public function CreateTopic_rest(){
	    
	    $this->doAuth();
	    $req =  $this->getReqObj();
	    $communityInfo['userID'] = $req->userID;
	    $communityInfo['title'] = $req->title;
	    $communityInfo['communityType'] = $req->communityType;
	    $communityInfo['context'] = $req->context;
	    $this->log($communityInfo);
	
	    $createTopicResult = parent::CreateTopicService($communityInfo);
	
	    $errorCode = $createTopicResult['errorCode'];
	    $this->returnJson($errorCode,null);
	}
}
?>