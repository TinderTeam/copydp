package cn.fuego.eshoping.webservice.up.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import cn.fuego.eshoping.webservice.up.model.GetProductListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductListRsp;
import cn.fuego.eshoping.webservice.up.model.GetProductTypeReq;
import cn.fuego.eshoping.webservice.up.model.GetProductTypeRsp;


@Path("/product")
@Produces("application/json")  
@Consumes("application/json")  
public interface ProductManageRest
{
	@POST
	@Path("/list")
	GetProductListRsp getProductList(GetProductListReq req);
	
	@POST
	@Path("/type/list")
	GetProductTypeRsp getProductTye(GetProductTypeReq req);
	
	
 
}
