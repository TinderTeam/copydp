package cn.fuego.eshoping.webservice.up.model;

import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.model.base.SellerEvalJson;
import cn.fuego.eshoping.webservice.up.model.base.SellerJson;

public class GetSellerListRsp extends BaseJsonRsp
{
	private List<SellerJson> sellerList;
	private List<ProductJson> productList;
	private List<SellerEvalJson> sellerEvalList;

	public List<SellerJson> getSellerList() {
		return sellerList;
	}

	public void setSellerList(List<SellerJson> sellerList) {
		this.sellerList = sellerList;
	}

	public List<ProductJson> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductJson> productList) {
		this.productList = productList;
	}

	public List<SellerEvalJson> getSellerEvalList() {
		return sellerEvalList;
	}

	public void setSellerEvalList(List<SellerEvalJson> sellerEvalList) {
		this.sellerEvalList = sellerEvalList;
	}

	@Override
	public String toString() {
		return "GetSellerListRsp [sellerList=" + sellerList + ", productList="
				+ productList + ", sellerEvalList=" + sellerEvalList
				+ ", result=" + result + "]";
	}

}
