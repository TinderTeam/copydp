package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.CommunityJson;

public class GetCommunityListRsp extends BaseJsonRsp
{
	private List<CommunityJson> communityList = new ArrayList<CommunityJson>();

	public List<CommunityJson> getCommunityList() {
		return communityList;
	}

	public void setCommunityList(List<CommunityJson> communityList) {
		this.communityList = communityList;
	}

	@Override
	public String toString() {
		return "GetCommunityListRsp [communityList=" + communityList
				+ ", result=" + result + "]";
	}

	
		
	
}
