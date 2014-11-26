package cn.fuego.eshoping.webservice.up.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import cn.fuego.eshoping.webservice.up.model.GetActivityListReq;
import cn.fuego.eshoping.webservice.up.model.GetActivityListRsp;
import cn.fuego.eshoping.webservice.up.model.GetActivityOrderListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductOrderListRsp;
import cn.fuego.eshoping.webservice.up.model.SetActivityOrderReq;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderRsp;


@Path("/")
@Produces("application/json")  
@Consumes("application/json")  
public interface ActivityManageRest
{
	@POST
	@Path("//list")
	GetActivityListRsp getActivityList(GetActivityListReq req);
	
	
	@POST
	@Path("/activitya/list")
	GetProductOrderListRsp getProductOrderList(GetActivityOrderListReq req);
	
	@POST
	@Path("/activity/create")
	SetProductOrderRsp create(SetActivityOrderReq req);
	
	@POST
	@Path("/activity/cancel")
	SetProductOrderRsp cancel(SetActivityOrderReq req);
	
	@POST
	@Path("/activity/delete")
	SetProductOrderRsp delete(SetActivityOrderReq req);

}
