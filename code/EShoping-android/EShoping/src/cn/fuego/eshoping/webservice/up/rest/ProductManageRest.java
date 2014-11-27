package cn.fuego.eshoping.webservice.up.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import cn.fuego.eshoping.webservice.up.model.GetProductListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductListRsp;
import cn.fuego.eshoping.webservice.up.model.GetProductOrderListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductOrderListRsp;
import cn.fuego.eshoping.webservice.up.model.GetProductTypeReq;
import cn.fuego.eshoping.webservice.up.model.GetProductTypeRsp;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderReq;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderRsp;


@Path("/Buy")
@Produces("application/json")  
@Consumes("application/json")  
public interface ProductManageRest
{
	@POST
	@Path("/RecommendProduct_rest")
	GetProductListRsp getRecommendProductList(GetProductListReq req);
	
	@POST
	@Path("/NewProduct_rest")
	GetProductListRsp getNewProductList(GetProductListReq req);
	
	@POST
	@Path("/TypeRecProduct_rest")
	GetProductListRsp getTypeRecProductList(GetProductListReq req);
	
	@POST
	@Path("/AllProduct_rest")
	GetProductListRsp getAllProductList(GetProductListReq req);
	
	@POST
	@Path("/GetProdutType_rest")
	GetProductTypeRsp getProductType(GetProductTypeReq req);
	
	@POST
	@Path("/ProductOrder_rest")
	GetProductOrderListRsp getProductOrderList(GetProductOrderListReq req);
	
	@POST
	@Path("/CreateOrder_rest")
	SetProductOrderRsp createProductOrder(SetProductOrderReq req);
	
	@POST
	@Path("/CancelOrder_rest")
	SetProductOrderRsp cancelProductOrder(SetProductOrderReq req);
	
	@POST
	@Path("/DeleteOrder_rest")
	SetProductOrderRsp deleteProductOrder(SetProductOrderReq req);
 
}
