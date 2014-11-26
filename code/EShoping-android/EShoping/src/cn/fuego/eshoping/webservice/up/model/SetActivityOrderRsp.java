package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.ActivityOrderJson;
import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;

public class SetActivityOrderRsp extends BaseJsonRsp
{
	private ActivityOrderJson activityOrder;

	public ActivityOrderJson getActivityOrder() {
		return activityOrder;
	}

	public void setActivityOrder(ActivityOrderJson activityOrder) {
		this.activityOrder = activityOrder;
	}

	@Override
	public String toString() {
		return "SetActivityOrderRsp [activityOrder=" + activityOrder
				+ ", result=" + result + "]";
	}
	

}
