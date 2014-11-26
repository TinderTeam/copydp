package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class SetActivityOrderReq extends BaseJsonReq
{
	private String userID;
	private String activityID;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getActivityID() {
		return activityID;
	}
	public void setActivityID(String activityID) {
		this.activityID = activityID;
	}
	@Override
	public String toString() {
		return "SetActivityOrderReq [userID=" + userID + ", activityID="
				+ activityID + ", token=" + token + "]";
	}
	
	
}
