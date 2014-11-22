package cn.fuego.eshoping.webservice.up.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import cn.fuego.eshoping.webservice.up.model.GetNewsListReq;
import cn.fuego.eshoping.webservice.up.model.GetNewsListRsp;


@Path("/news")
@Produces("application/json")  
@Consumes("application/json")  
public interface NewsManageRest
{
	@POST
	@Path("/list")
	GetNewsListRsp getNewsList(GetNewsListReq req);
}
