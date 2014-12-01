package cn.fuego.eshoping.webservice.up.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import cn.fuego.eshoping.webservice.up.model.GetActivityListReq;
import cn.fuego.eshoping.webservice.up.model.GetActivityListRsp;
import cn.fuego.eshoping.webservice.up.model.GetActivityOrderListReq;
import cn.fuego.eshoping.webservice.up.model.GetActivityOrderListRsp;
import cn.fuego.eshoping.webservice.up.model.GetProductOrderListRsp;
import cn.fuego.eshoping.webservice.up.model.SetActivityOrderReq;
import cn.fuego.eshoping.webservice.up.model.SetActivityOrderRsp;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderRsp;


@Path("/Activity")
@Produces("application/json")  
@Consumes("application/json")  
public interface ActivityManageRest
{
	//APP��ȡ��б�
	@POST
	@Path("/activity_rest")
	GetActivityListRsp getActivityList(GetActivityListReq req);
	
	//APP��ȡ���˻�����б�
	@POST
	@Path("/activityOrder_rest")
	GetActivityOrderListRsp getActivityOrderList(GetActivityOrderListReq req);
	
	//APP���������
	@POST
	@Path("/createOrder_rest")
	SetActivityOrderRsp createActivityOrder(SetActivityOrderReq req);
	
	//APPȡ�������
	@POST
	@Path("/cancelOrder_rest")
	SetActivityOrderRsp cancelActivityOrder(SetActivityOrderReq req);
	

}
