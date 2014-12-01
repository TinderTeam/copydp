package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class GetProductTypeReq extends BaseJsonReq
{
	private int typeRoot;		//typeRoot=0 ??????,??1-42??????type_id???????

	public int getTypeRoot() {
		return typeRoot;
	}

	public void setTypeRoot(int typeRoot) {
		this.typeRoot = typeRoot;
	}

	@Override
	public String toString() {
		return "GetProductTypeReq [typeRoot=" + typeRoot + ", token=" + token
				+ "]";
	}

	

}
