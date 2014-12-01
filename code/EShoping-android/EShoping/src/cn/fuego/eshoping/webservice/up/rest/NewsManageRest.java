package cn.fuego.eshoping.webservice.up.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import cn.fuego.eshoping.webservice.up.model.GetNewsListReq;
import cn.fuego.eshoping.webservice.up.model.GetNewsListRsp;


@Path("/News")
@Produces("application/json")  
@Consumes("application/json")  
public interface NewsManageRest
{
	//APP获取最新资讯List
	@POST
	@Path("/getNewsList_rest")
	GetNewsListRsp getNewsList(GetNewsListReq req);
}
