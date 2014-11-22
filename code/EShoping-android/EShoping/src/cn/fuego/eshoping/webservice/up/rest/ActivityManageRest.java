package cn.fuego.eshoping.webservice.up.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import cn.fuego.eshoping.webservice.up.model.GetActivityListReq;
import cn.fuego.eshoping.webservice.up.model.GetActivityListRsp;


@Path("/news")
@Produces("application/json")  
@Consumes("application/json")  
public interface ActivityManageRest
{
	@POST
	@Path("/list")
	GetActivityListRsp getActivityList(GetActivityListReq req);

}
