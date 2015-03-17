package cn.fuego.eshoping.ui.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.format.DateUtil;
import cn.fuego.common.util.list.tools.IteratorSelector;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.constant.ErrorMessageConst;
import cn.fuego.eshoping.ui.activity.ActivityInfoActivity;
import cn.fuego.eshoping.ui.home.HomeProductActivity;
import cn.fuego.eshoping.webservice.up.model.GetActivityListReq;
import cn.fuego.eshoping.webservice.up.model.GetActivityListRsp;
import cn.fuego.eshoping.webservice.up.model.GetActivityOrderListReq;
import cn.fuego.eshoping.webservice.up.model.GetActivityOrderListRsp;
import cn.fuego.eshoping.webservice.up.model.GetSellerReq;
import cn.fuego.eshoping.webservice.up.model.GetSellerRsp;
import cn.fuego.eshoping.webservice.up.model.SetActivityOrderReq;
import cn.fuego.eshoping.webservice.up.model.SetActivityOrderRsp;
import cn.fuego.eshoping.webservice.up.model.base.ActivityJson;
import cn.fuego.eshoping.webservice.up.model.base.ActivityOrderJson;
import cn.fuego.eshoping.webservice.up.model.base.ProductOrderJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.list.MispListActivity;
import cn.fuego.misp.ui.model.ListViewResInfo;
import cn.fuego.misp.ui.util.LoadImageUtil;

public class UserActivityListActivity extends MispListActivity<ActivityOrderJson>
{
	FuegoLog log = FuegoLog.getLog(UserActivityListActivity.class);
	
	//默认查询已订购
	int defaltType=R.string.order_type_attend;	
	
	List<ActivityOrderJson> orderList=new ArrayList<ActivityOrderJson>();
	Map<Integer,List<ActivityOrderJson>> orderListTypeMap=new HashMap<Integer,List<ActivityOrderJson>>(); 

	
	@Override
	public void initRes()
	{
		//Basic
		this.activityRes.setAvtivityView(R.layout.user_activity_order);
		this.activityRes.setBackBtn(R.id.com_back_btn);
		this.activityRes.setTitleTextView(R.id.com_head_title);
		this.activityRes.setName(getString(R.string.page_user_activity_order));		
		//List
		this.listViewRes.setListItemView(R.layout.user_activity_item);
		this.listViewRes.setListView(R.id.order_listview);	
		this.listViewRes.setClickActivityClass(ActivityInfoActivity.class);
	}

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		//初始化数据
		super.onCreate(savedInstanceState);
	}
	
	@Override
	public void loadSendList()
	{
		GetActivityOrderListReq req = new GetActivityOrderListReq();
		req.setToken(AppCache.getInstance().getToken());
		req.setUserID(AppCache.getInstance().getUser().getUser_id());
		WebServiceContext.getInstance().getActivityManageRest(this).getActivityOrderList(req);
		orderListTypeMap.clear();
		orderList=new ArrayList<ActivityOrderJson>();
		log.info("request:"+req.toString());
	}
	
	@Override
	public List<ActivityOrderJson> loadListRecv(Object obj)
	{
		//储存所有订单
		GetActivityOrderListRsp rsp = (GetActivityOrderListRsp)obj;
		if(rsp.getOrderList()!=null){
			orderList=rsp.getOrderList();	
		}
		return getOrderListByType(defaltType);
	}

	@Override
	public View getListItemView(View view, ActivityOrderJson item)
	{		
		TextView nameView= (TextView) view.findViewById(R.id.order_activity_name);
		nameView.setText(item.getActivity_title());
		nameView.setTag(item);
		
		TextView idView= (TextView) view.findViewById(R.id.order_activity_limitnum);
		idView.setText(String.valueOf(item.getMemberlimit()));
		idView.setTag(item);
		
		TextView statusView= (TextView) view.findViewById(R.id.order_status);

		if("已过期".equals(item.getActivity_status()))
		{
			statusView.setText(item.getActivity_status());

		}
		else
		{
			statusView.setText(item.getStatus());

		}
		statusView.setTag(item);
		
		Button deleteBtn = (Button)view.findViewById(R.id.order_activity_cancel_btn);
		deleteBtn.setTag(item);
		
		ImageView imageView = (ImageView)view.findViewById(R.id.order_product_img);
		LoadImageUtil.getInstance().loadImage(imageView,MemoryCache.getImageUrl()+item.getImgsrc());
		imageView.setTag(item);
		return view;
	}
	
	/**
	 * 选择订单类型
	 * @param typeResID
	 */
	public List<ActivityOrderJson> getOrderListByType(int typeResID){
		log.info("select type:"+ getString(typeResID));
		//从缓存中预读
		List<ActivityOrderJson> selectList = orderListTypeMap.get(typeResID);
		if(orderListTypeMap.containsKey(typeResID)){
			selectList = orderListTypeMap.get(typeResID);
		}else{
			selectList = IteratorSelector.selectByField(
					orderList, ActivityOrderJson.STATUS, getString(typeResID));	
			orderListTypeMap.put(typeResID, selectList);
		}
		return selectList;
	}
	
	public void selectCancelOrder(View v){
		log.info("select type:"+ getString(R.string.order_type_cancel));
		refreshList(getOrderListByType(R.string.order_type_cancel));
	}
	public void selectUsedOrder(View v){
		log.info("select type:"+ getString(R.string.order_type_used));
		refreshList(getOrderListByType(R.string.order_type_used));
	}
	public void selectNormalOrder(View v){
		log.info("select type:"+ getString(R.string.order_type_attend));
		refreshList(getOrderListByType(R.string.order_type_attend));
	}
	public void selectOverDueOrder(View v){
		log.info("select type:"+ getString(R.string.order_type_overdue));
		refreshList(getOrderListByType(R.string.order_type_overdue));
	}
	
	public void deleteOrderEvent(View v){	
		ActivityOrderJson delOrder = (ActivityOrderJson)v.getTag();
		log.info("deleteEvent:ID="+delOrder.toString());
		//发送取消活动请求
		SetActivityOrderReq req = new SetActivityOrderReq();
		req.setActivityID(delOrder.getActivity_id());
		req.setToken(AppCache.getInstance().getToken());
		req.setUserID(AppCache.getInstance().getUser().getUser_id());
		
		MispHttpHandler handle = new MispHttpHandler(){
			@Override
			public void handle(MispHttpMessage message)
			{
				log.info(message.toString());
				if (message.isSuccess()){
					SetActivityOrderRsp rsp = (SetActivityOrderRsp) message.getMessage().obj;
					Toast.makeText(getApplicationContext(), "取消成功",Toast.LENGTH_SHORT).show();
					loadSendList();
				}
				else{
					showMessage(message);
				}
			}			
		};
		WebServiceContext.getInstance().getActivityManageRest(handle).cancelActivityOrder(req);
	}
	
	/**
	 * 选择订单跳转到产品详情
	 * @param v
	 */
	public void showActivity(View v){	
		log.info("show product clicked...");
		ActivityOrderJson order = (ActivityOrderJson)v.getTag();	

		ActivityJson activity = new ActivityJson();
		
		activity.setActivity_id(order.getActivity_id());
		activity.setImgsrc(order.getImgsrc());
		activity.setDscr(order.getActivity_disc());
		activity.setTitle(order.getActivity_title());
		Intent intent = new Intent();
		intent.setClass(this, ActivityInfoActivity.class);
		log.info("show activity : "+ activity.toString());
		intent.putExtra(ListViewResInfo.SELECT_ITEM, activity);
		startActivity(intent);
	}
 
	
	
}
