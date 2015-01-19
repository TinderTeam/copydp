package cn.fuego.eshoping.webservice.up.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import cn.fuego.eshoping.webservice.up.model.GetClientVersionReq;
import cn.fuego.eshoping.webservice.up.model.GetClientVersionRsp;


@Path("/ClientVersion")
@Produces("application/json")  
@Consumes("application/json")  
public interface VersionManageRest
{
	//APP获取最新资讯List
	@POST
	@Path("/GetLatestVersion_rest")
	GetClientVersionRsp getLatestVersion(GetClientVersionReq req);
}
