package cn.fuego.eshoping.ui.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.list.tools.IteratorSelector;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.ui.home.HomeProductActivity;
import cn.fuego.eshoping.webservice.up.model.GetProductOrderListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductOrderListRsp;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderReq;
import cn.fuego.eshoping.webservice.up.model.base.ProductOrderJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.list.MispListActivity;
import cn.fuego.misp.ui.util.LoadImageUtil;

public class UserOrderListActivity extends  MispListActivity<ProductOrderJson>
{
FuegoLog log = FuegoLog.getLog(UserOrderListActivity.class);
	
	//默认查询已订购
	int defaltType=R.string.order_type_ordered;	
	int curType=R.string.order_type_ordered;	
	List<ProductOrderJson> orderList=new ArrayList<ProductOrderJson>();
	Map<Integer,List<ProductOrderJson>> productListTypeMap=new HashMap<Integer,List<ProductOrderJson>>(); 
	
	@Override
	public void initRes()
	{
		//Basic
		this.activityRes.setAvtivityView(R.layout.user_order);
		this.activityRes.setBackBtn(R.id.com_back_btn);
		this.activityRes.setTitleTextView(R.id.com_head_title);
		this.activityRes.setName(getString(R.string.page_user_order));		
		//List
		this.listViewRes.setListItemView(R.layout.user_order_item);
		this.listViewRes.setListView(R.id.order_listview);	
		this.listViewRes.setClickActivityClass(HomeProductActivity.class);
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
		GetProductOrderListReq req = new GetProductOrderListReq();
		req.setToken(AppCache.getToken());
		req.setUserID(AppCache.getInstance().getUser().getUser_id());
		WebServiceContext.getInstance().getProductManageRest(this).getProductOrderList(req);
		productListTypeMap.clear();
		orderList=new ArrayList<ProductOrderJson>();
		log.info("request:"+req.toString());
	}
	
	@Override
	public List<ProductOrderJson> loadListRecv(Object obj)
	{
		//储存所有订单
		GetProductOrderListRsp rsp = (GetProductOrderListRsp)obj;
		if(rsp.getOrderList()!=null){
			orderList=rsp.getOrderList();	
		}
		return getOrderListByType(defaltType);
	}

	@Override
	public View getListItemView(View view, ProductOrderJson item)
	{		
		TextView nameView= (TextView) view.findViewById(R.id.order_activity_name);
		nameView.setText(item.getProduct_name());
		nameView.setTag(item);
		
		TextView idView= (TextView) view.findViewById(R.id.order_id);
		idView.setText(String.valueOf(item.getOrder_id()));
		TextView statusView= (TextView) view.findViewById(R.id.order_status);
		statusView.setText(item.getOrder_status());
		TextView dueDateView= (TextView) view.findViewById(R.id.order_overdue_date);
		dueDateView.setText(item.getEnd_date_time());
		Button deleteBtn = (Button)view.findViewById(R.id.order_delete_btn);
		if(curType==R.string.order_type_ordered){
			//已下单显示取消按钮
			deleteBtn.setText("取消订单");		
		}else{
			deleteBtn.setText("删除订单");
		}
		deleteBtn.setTag(item);
		ImageView imageView = (ImageView)view.findViewById(R.id.order_product_img);
		LoadImageUtil.getInstance().loadImage(imageView,MemoryCache.getImageUrl()+item.getImgsrc());
		return view;
	}
	 
	/**
	 * 选择订单类型
	 * @param typeResID
	 */
	public List<ProductOrderJson> getOrderListByType(int typeResID){
		log.info("select type:"+ getString(typeResID));
		//从缓存中预读
		List<ProductOrderJson> selectList = productListTypeMap.get(typeResID);
		if(productListTypeMap.containsKey(typeResID)){
			selectList = productListTypeMap.get(typeResID);
		}else{
			selectList = IteratorSelector.selectByField(
					orderList, ProductOrderJson.STATUS, getString(typeResID));	
			productListTypeMap.put(typeResID, selectList);
		}
		curType=typeResID;
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
		log.info("select type:"+ getString(R.string.order_type_ordered));
		refreshList(getOrderListByType(R.string.order_type_ordered));
	}
	public void selectOverDueOrder(View v){
		log.info("select type:"+ getString(R.string.order_type_overdue));
		refreshList(getOrderListByType(R.string.order_type_overdue));
	}
	
	/**
	 * 删除、取消事件处理
	 * @param v
	 */
	public void deleteCancelOrderEvent(View v){	
		
		ProductOrderJson delOrder = (ProductOrderJson)v.getTag();
		//发送取消活动请求
		SetProductOrderReq req = new SetProductOrderReq();
		req.setOrderID(delOrder.getOrder_id());
		req.setToken(AppCache.getToken());
		req.setUserID(AppCache.getInstance().getUser().getUser_id());
		
		MispHttpHandler handle = new MispHttpHandler(){
			@Override
			public void handle(MispHttpMessage message)
			{
				log.info(message.toString());
				if (message.isSuccess()){
					Toast.makeText(getApplicationContext(), "操作成功",Toast.LENGTH_SHORT).show();
					loadSendList();
				}
				else{
					showMessage(message);
				}
			}			
		};
	
		if(curType==R.string.order_type_ordered){
			//取消
			log.info("cancelEvent:ID="+delOrder.toString());
			WebServiceContext.getInstance().getProductManageRest(handle).cancelProductOrder(req);
		}else{
			//删除
			log.info("deleteEvent:ID="+delOrder.toString());
			WebServiceContext.getInstance().getProductManageRest(handle).deleteProductOrder(req);
		}
	
	}	
	
 
}
