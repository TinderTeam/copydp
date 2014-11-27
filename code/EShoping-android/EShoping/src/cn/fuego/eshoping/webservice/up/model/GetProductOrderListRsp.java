package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductOrderJson;

public class GetProductOrderListRsp extends BaseJsonRsp
{
	List<ProductOrderJson> orderList = new ArrayList<ProductOrderJson>();

	public List<ProductOrderJson> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<ProductOrderJson> orderList) {
		this.orderList = orderList;
	}

	@Override
	public String toString() {
		return "GetProductOrderListRsp [orderList=" + orderList + ", result="
				+ result + "]";
	}
	
}
