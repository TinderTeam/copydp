package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductEvalJson;

public class GetProductEvalRsp extends BaseJsonRsp
{
	private List<ProductEvalJson> productEvalList = new ArrayList<ProductEvalJson>();

	public List<ProductEvalJson> getProductEvalList() {
		return productEvalList;
	}

	public void setProductEvalList(List<ProductEvalJson> productEvalList) {
		this.productEvalList = productEvalList;
	}

	@Override
	public String toString() {
		return "GetProductEvalRsp [productEvalList=" + productEvalList
				+ ", result=" + result + "]";
	}	

}
