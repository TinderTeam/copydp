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
	@POST
	@Path("/HotRecommend_rest")
	GetCommunityListRsp getHotRecommendList(GetCommunityListReq req);
	
	@POST
	@Path("/HotTopic_rest")
	GetCommunityDiscussSumRsp getHotTopicList(GetCommunityListReq req);
	
	@POST
	@Path("/AllCommunity_rest")
	GetCommunityListRsp getAllCommunityList(GetCommunityListReq req);
	
	@POST
	@Path("/HotUser_rest")
	GetCommunityListRsp getHotUserList(GetCommunityListReq req);
	
	@POST
	@Path("/CreateTopic_rest")
	SetCommunityRsp createTopic(SetCommunityReq req);
	
	@POST
	@Path("/CreateReply_rest")
	SetCommunityRsp createReply(SetCommunityDiscussReq req);

}
