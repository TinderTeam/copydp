package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;
import cn.fuego.eshoping.webservice.up.model.base.ProductOrderJson;

public class SetProductOrderReq extends BaseJsonReq
{
	private int userID;
	private ProductOrderJson productOrder;

}
