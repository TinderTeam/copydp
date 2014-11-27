package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class SetCommunityDiscussReq extends BaseJsonReq
{
	private int community_id;		//总共可传递4种类型，“全部分类”、“房介信息”、“应聘信息”、“招聘信息”
	private int userID;
	private String content;
	
	public int getCommunity_id() {
		return community_id;
	}
	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "SetCommunityDiscussReq [community_id=" + community_id
				+ ", userID=" + userID + ", content=" + content + ", token="
				+ token + "]";
	}
	
	
	
}
