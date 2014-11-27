package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class GetProductOrderListReq extends BaseJsonReq
{
	private int userID;

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
