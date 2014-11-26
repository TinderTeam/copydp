package cn.fuego.eshoping.webservice.up.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import cn.fuego.eshoping.webservice.up.model.GetActivityOrderListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductOrderListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductOrderListRsp;
import cn.fuego.eshoping.webservice.up.model.SetActivityOrderReq;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderReq;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderRsp;

@Path("/order")
@Produces("application/json")  
@Consumes("application/json")  
public interface OrderManageRest
{
	@POST
	@Path("/product/list")
	GetProductOrderListRsp getProductOrderList(GetProductOrderListReq req);
	
	@POST
	@Path("/product/create")
	SetProductOrderRsp create(SetProductOrderReq req);
	
	@POST
	@Path("/product/cancel")
	SetProductOrderRsp cancel(SetProductOrderReq req);
	
	@POST
	@Path("/product/abolish")
	SetProductOrderRsp abolish(SetProductOrderReq req);
	
	@POST
	@Path("/product/delete")
	SetProductOrderRsp delete(SetProductOrderReq req);
	


}
