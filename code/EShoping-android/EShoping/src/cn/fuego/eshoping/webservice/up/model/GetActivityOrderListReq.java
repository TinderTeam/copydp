package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class GetActivityOrderListReq extends BaseJsonReq
{
	private int userID;			//根据用户ID获取活动订单列表

	

	public int getUserID() {
		return userID;
	}



	public void setUserID(int userID) {
		this.userID = userID;
	}



	@Override
	public String toString() {
		return "GetActivityOrderListReq [userID=" + userID + ", token=" + token
				+ "]";
	}

	
	
	
}
