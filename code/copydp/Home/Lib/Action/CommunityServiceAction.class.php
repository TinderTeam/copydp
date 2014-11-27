<?php

class CommunityServiceAction extends BaseAction {

    //根据类型获取所有帖子列表
    public function AllCommunityService($communityType)
    {
        
        $communityDB=new Model('view_community');
		if($communityType =='全部发帖'){
		    
			$communityList=$communityDB->order('datetime desc')->getField('community_id',true);	
		}else{
		    
			$communityTypeCondition['community_type']=$communityType;
			$communityList=$communityDB->where($communityTypeCondition)->select();	
		}
		if($communityList==false)
		{
		    $rsp['errorCode'] = RESULT_NULL;
		    return  $rsp;
		}
		else{
		    $rsp['errorCode'] = SUCCESS;
		    $rsp['communityList'] = $communityList;
		    $this->log("the communityList is".$communityList);
		    return  $rsp;
		}
		
    }
    //创建新帖子
    public function CreateTopicService($communityInfo)
    {
	
        $communityDB=M('community');
        $Data['context']=$communityInfo['context'];
        $Data['title']=$communityInfo['title'];
        $Data['datetime']=date('Y-m-d H:i:s',time());
        $Data['community_type']=$communityInfo['communityType'];
        $Data['customer_id']=$communityInfo['userID'];
        $communityDB->add($Data);
        
        $rsp['errorCode'] = SUCCESS;
        return  $rsp;
    }
        
}

?>