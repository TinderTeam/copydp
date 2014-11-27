package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.CommunityDiscussSum;

public class GetCommunityDiscussSumRsp extends BaseJsonRsp
{
	private List<CommunityDiscussSum> communityDiscussSum = new ArrayList<CommunityDiscussSum>();

	public List<CommunityDiscussSum> getCommunityDiscussSum() {
		return communityDiscussSum;
	}

	public void setCommunityDiscussSum(List<CommunityDiscussSum> communityDiscussSum) {
		this.communityDiscussSum = communityDiscussSum;
	}

	@Override
	public String toString() {
		return "GetCommunityDiscussSumRsp [communityDiscussSum="
				+ communityDiscussSum + ", result=" + result + "]";
	}
	
	
}
