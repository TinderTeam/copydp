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
	//APP获取热点推荐帖子列表
	@POST
	@Path("/HotRecommend_rest")
	GetCommunityListRsp getHotRecommendList(GetCommunityListReq req);
	
	//APP获取热门话题帖子列表
	@POST
	@Path("/HotTopic_rest")
	GetCommunityDiscussSumRsp getHotTopicList(GetCommunityListReq req);
	
	//APP获取所有帖子列表
	@POST
	@Path("/AllCommunity_rest")
	GetCommunityListRsp getAllCommunityList(GetCommunityListReq req);
	
	//APP获取会员热榜列表
	@POST
	@Path("/HotUser_rest")
	GetCommunityListRsp getHotUserList(GetCommunityListReq req);
	
	//APP创建新帖子
	@POST
	@Path("/CreateTopic_rest")
	SetCommunityRsp createTopic(SetCommunityReq req);
	
	//APP回复帖子
	@POST
	@Path("/CreateReply_rest")
	SetCommunityRsp createReply(SetCommunityDiscussReq req);

}
