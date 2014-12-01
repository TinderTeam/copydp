package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class SetActivityOrderReq extends BaseJsonReq
{
	private int userID;					//产生订单的用户ID
	private int activityID;				//产生订单的活动ID
	
	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getActivityID() {
		return activityID;
	}

	public void setActivityID(int activityID) {
		this.activityID = activityID;
	}

	@Override
	public String toString() {
		return "SetActivityOrderReq [userID=" + userID + ", activityID="
				+ activityID + ", token=" + token + "]";
	}
	
	
}
