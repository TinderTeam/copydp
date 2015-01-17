package cn.fuego.eshoping.webservice.up.model;

import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.model.base.SellerEvalJson;
import cn.fuego.eshoping.webservice.up.model.base.SellerJson;

public class GetSellerRsp extends BaseJsonRsp
{
	private SellerJson seller;
	private List<ProductJson> productList;
	private List<SellerEvalJson> sellerEvalList;

	public SellerJson getSeller() {
		return seller;
	}

	public void setSeller(SellerJson seller) {
		this.seller = seller;
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
		return "GetSellerRsp [seller=" + seller + ", productList="
				+ productList + ", sellerEvalList=" + sellerEvalList
				+ ", result=" + result + "]";
	}
}
