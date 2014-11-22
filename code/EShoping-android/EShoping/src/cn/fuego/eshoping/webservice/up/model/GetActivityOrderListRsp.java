package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.ActivityOrderJson;
import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;

public class GetActivityOrderListRsp extends BaseJsonRsp
{
	List<ActivityOrderJson> orderList = new ArrayList<ActivityOrderJson>();
}
