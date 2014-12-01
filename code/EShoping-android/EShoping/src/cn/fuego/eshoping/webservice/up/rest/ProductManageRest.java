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
	//APP��ȡ�Ƽ���Ʒ�б�
	@POST
	@Path("/RecommendProduct_rest")
	GetProductListRsp getRecommendProductList(GetProductListReq req);
	
	//APP��ȡ�����ػݲ�Ʒ�б�
	@POST
	@Path("/NewProduct_rest")
	GetProductListRsp getNewProductList(GetProductListReq req);
	
	//APP��ȡ�����Ƽ���Ʒ�б�
	@POST
	@Path("/TypeRecProduct_rest")
	GetProductListRsp getTypeRecProductList(GetProductListReq req);
	
	//APP��ȡ���в�Ʒ�б�
	@POST
	@Path("/AllProduct_rest")
	GetProductListRsp getAllProductList(GetProductListReq req);
	
	//APP��ȡ��Ʒ�����б�
	@POST
	@Path("/GetProdutType_rest")
	GetProductTypeRsp getProductType(GetProductTypeReq req);
	
	//APP��ȡ��Ʒ�����б�
	@POST
	@Path("/ProductOrder_rest")
	GetProductOrderListRsp getProductOrderList(GetProductOrderListReq req);
	
	//APP��Ʒ�µ�
	@POST
	@Path("/CreateOrder_rest")
	SetProductOrderRsp createProductOrder(SetProductOrderReq req);
	
	//APPȡ������
	@POST
	@Path("/CancelOrder_rest")
	SetProductOrderRsp cancelProductOrder(SetProductOrderReq req);
	
	//APPɾ������
	@POST
	@Path("/DeleteOrder_rest")
	SetProductOrderRsp deleteProductOrder(SetProductOrderReq req);
 
}
