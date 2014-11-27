package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class SetCommunityReq extends BaseJsonReq
{
	private String communityType;		//总共可传递4种类型，“全部分类”、“房介信息”、“应聘信息”、“招聘信息”
	private int userID;
	private String context;
	private String title;
	public String getCommunityType() {
		return communityType;
	}
	public void setCommunityType(String communityType) {
		this.communityType = communityType;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "SetCommunityReq [communityType=" + communityType + ", userID="
				+ userID + ", context=" + context + ", title=" + title
				+ ", token=" + token + "]";
	}
	
	
	
	
}
