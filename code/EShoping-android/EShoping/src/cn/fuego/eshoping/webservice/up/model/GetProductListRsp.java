package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;

public class GetProductListRsp extends BaseJsonRsp
{
	private List<ProductJson> productList = new ArrayList<ProductJson>(); 

}
