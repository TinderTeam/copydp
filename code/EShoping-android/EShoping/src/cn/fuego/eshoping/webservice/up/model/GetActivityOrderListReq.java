package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class GetActivityOrderListReq extends BaseJsonReq
{
	private String userID;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	@Override
	public String toString() {
		return "GetActivityOrderListReq [userID=" + userID + ", token=" + token
				+ "]";
	}

	
	
	
}
