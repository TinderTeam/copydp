package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductOrderJson;

public class SetProductOrderRsp extends BaseJsonRsp
{
	
	private ProductOrderJson productOrder;

	public ProductOrderJson getProductOrder() {
		return productOrder;
	}

	public void setProductOrder(ProductOrderJson productOrder) {
		this.productOrder = productOrder;
	}

	@Override
	public String toString() {
		return "SetProductOrderRsp [productOrder=" + productOrder + ", result="
				+ result + "]";
	}
	

}
