package cn.fuego.eshoping.webservice.up.model;

import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.SellerJson;

public class GetSellerListRsp extends BaseJsonRsp
{
	private List<SellerJson> sellerList;


	public List<SellerJson> getSellerList() {
		return sellerList;
	}

	public void setSellerList(List<SellerJson> sellerList) {
		this.sellerList = sellerList;
	}

	@Override
	public String toString() {
		return "GetSellerListRsp [sellerList=" + sellerList + ", result="
				+ result + "]";
	}
	

}
