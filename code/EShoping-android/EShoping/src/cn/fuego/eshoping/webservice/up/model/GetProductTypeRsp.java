package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductTypeJson;

public class GetProductTypeRsp extends BaseJsonRsp
{
	private List<ProductTypeJson> typeList = new ArrayList<ProductTypeJson>();

	public List<ProductTypeJson> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<ProductTypeJson> typeList) {
		this.typeList = typeList;
	}

	@Override
	public String toString() {
		return "GetProductTypeRsp [typeList=" + typeList + ", result=" + result
				+ "]";
	}
	

}
