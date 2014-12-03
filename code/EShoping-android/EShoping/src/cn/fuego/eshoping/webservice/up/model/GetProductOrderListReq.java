package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class GetProductOrderListReq extends BaseJsonReq
{
	private int userID;				//根据用户ID获取订单列表

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	@Override
	public String toString() {
		return "GetProductOrderListReq [userID=" + userID + ", token=" + token
				+ "]";
	}
	
}
