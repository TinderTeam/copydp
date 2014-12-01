package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class SetActivityOrderReq extends BaseJsonReq
{
	private int userID;					//�����������û�ID
	private int activityID;				//���������ĻID
	
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
