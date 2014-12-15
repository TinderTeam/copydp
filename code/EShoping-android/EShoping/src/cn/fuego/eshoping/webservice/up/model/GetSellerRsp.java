package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.SellerJson;

public class GetSellerRsp extends BaseJsonRsp
{
	private SellerJson seller;

	public SellerJson getSeller() {
		return seller;
	}

	public void setSeller(SellerJson seller) {
		this.seller = seller;
	}

	@Override
	public String toString() {
		return "GetSellerRsp [seller=" + seller + ", result=" + result + "]";
	}
	

}
