package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class GetProductEvalReq extends BaseJsonReq
{
	private int product_id;		//根据城市获取活动列表

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	@Override
	public String toString() {
		return "GetProductReq [product_id=" + product_id + ", token=" + token
				+ "]";
	}

}
