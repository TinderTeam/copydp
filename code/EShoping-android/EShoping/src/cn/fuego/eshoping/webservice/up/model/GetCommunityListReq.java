package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class GetCommunityListReq extends BaseJsonReq
{
	private String communityType;		//总共可传递4种类型，“全部分类”、“房介信息”、“应聘信息”、“招聘信息”

	public String getCommunityType() {
		return communityType;
	}

	public void setCommunityType(String communityType) {
		this.communityType = communityType;
	}

	@Override
	public String toString() {
		return "GetCommunityListReq [communityType=" + communityType
				+ ", token=" + token + "]";
	}

	
	
}
