package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class GetSellerReq extends BaseJsonReq
{
	private int seller_id;		//根据城市获取活动列表

	public int getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}

	@Override
	public String toString() {
		return "GetSellerReq [seller_id=" + seller_id + ", token=" + token
				+ "]";
	}

}
