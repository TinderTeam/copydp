package cn.fuego.misp.webservice.up.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import cn.fuego.misp.webservice.up.model.GetClientVersionReq;
import cn.fuego.misp.webservice.up.model.GetClientVersionRsp;


@Path("/")
@Produces("application/json")  
@Consumes("application/json")  
public interface MispSystemManageRest
{
 
	@POST
	@Path("/ClientVersion/GetLatestVersion_rest")
	GetClientVersionRsp getAppVersion(GetClientVersionReq req);
}
