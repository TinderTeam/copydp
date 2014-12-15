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
import cn.fuego.eshoping.webservice.up.model.GetSellerReq;
import cn.fuego.eshoping.webservice.up.model.GetSellerRsp;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderReq;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderRsp;


@Path("/Buy")
@Produces("application/json")  
@Consumes("application/json")  
public interface ProductManageRest
{
	//APP获取推荐产品列表
	@POST
	@Path("/RecommendProduct_rest")
	GetProductListRsp getRecommendProductList(GetProductListReq req);
	
	//APP获取最新特惠产品列表
	@POST
	@Path("/NewProduct_rest")
	GetProductListRsp getNewProductList(GetProductListReq req);
	
	//APP获取分类推荐产品列表
	@POST
	@Path("/TypeRecProduct_rest")
	GetProductListRsp getTypeRecProductList(GetProductListReq req);
	
	//APP获取所有产品列表
	@POST
	@Path("/AllProduct_rest")
	GetProductListRsp getAllProductList(GetProductListReq req);
	
	//APP获取产品类型列表
	@POST
	@Path("/GetProdutType_rest")
	GetProductTypeRsp getProductType(GetProductTypeReq req);
	
	//APP获取产品订单列表
	@POST
	@Path("/ProductOrder_rest")
	GetProductOrderListRsp getProductOrderList(GetProductOrderListReq req);
	
	//APP产品下单
	@POST
	@Path("/CreateOrder_rest")
	SetProductOrderRsp createProductOrder(SetProductOrderReq req);
	
	//APP取消订单
	@POST
	@Path("/CancelOrder_rest")
	SetProductOrderRsp cancelProductOrder(SetProductOrderReq req);
	
	//APP删除订单
	@POST
	@Path("/DeleteOrder_rest")
	SetProductOrderRsp deleteProductOrder(SetProductOrderReq req);
	
	//APP获取商家信息
	@POST
	@Path("/GetSellerInfo_rest")
	GetSellerRsp getSellerInfo(GetSellerReq req);
 
}
