package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.ActivityJson;
import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;

public class GetActivityListRsp extends BaseJsonRsp
{
	List<ActivityJson> activityList = new ArrayList<ActivityJson>();

	public List<ActivityJson> getActivityList() {
		return activityList;
	}

	public void setActivityList(List<ActivityJson> activityList) {
		this.activityList = activityList;
	}

	@Override
	public String toString() {
		return "GetActivityListRsp [activityList=" + activityList + "]";
	}
	
}
