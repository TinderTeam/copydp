package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductOrderJson;

public class GetProductOrderListRsp extends BaseJsonRsp
{

	List<ProductOrderJson> orderList = new ArrayList<ProductOrderJson>();
}
