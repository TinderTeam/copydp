package cn.fuego.eshoping.webservice.up.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import cn.fuego.eshoping.webservice.up.model.GetCommunityDiscussSumRsp;
import cn.fuego.eshoping.webservice.up.model.GetCommunityListReq;
import cn.fuego.eshoping.webservice.up.model.GetCommunityListRsp;
import cn.fuego.eshoping.webservice.up.model.SetCommunityDiscussReq;
import cn.fuego.eshoping.webservice.up.model.SetCommunityReq;
import cn.fuego.eshoping.webservice.up.model.SetCommunityRsp;

@Path("/Community")
@Produces("application/json")  
@Consumes("application/json")  
public interface CommunityManageRest
{
	//APP��ȡ�ȵ��Ƽ������б�
	@POST
	@Path("/HotRecommend_rest")
	GetCommunityListRsp getHotRecommendList(GetCommunityListReq req);
	
	//APP��ȡ���Ż��������б�
	@POST
	@Path("/HotTopic_rest")
	GetCommunityDiscussSumRsp getHotTopicList(GetCommunityListReq req);
	
	//APP��ȡ���������б�
	@POST
	@Path("/AllCommunity_rest")
	GetCommunityListRsp getAllCommunityList(GetCommunityListReq req);
	
	//APP��ȡ��Ա�Ȱ��б�
	@POST
	@Path("/HotUser_rest")
	GetCommunityListRsp getHotUserList(GetCommunityListReq req);
	
	//APP����������
	@POST
	@Path("/CreateTopic_rest")
	SetCommunityRsp createTopic(SetCommunityReq req);
	
	//APP�ظ�����
	@POST
	@Path("/CreateReply_rest")
	SetCommunityRsp createReply(SetCommunityDiscussReq req);

}
