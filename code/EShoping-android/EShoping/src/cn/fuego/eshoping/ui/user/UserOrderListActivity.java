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
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.TextView;
import android.widget.Toast;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.string.StringLengthLimit;
import cn.fuego.common.util.list.tools.IteratorSelector;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.ui.home.HomeProductActivity;
import cn.fuego.eshoping.webservice.up.model.GetProductOrderListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductOrderListRsp;
import cn.fuego.eshoping.webservice.up.model.GetSellerReq;
import cn.fuego.eshoping.webservice.up.model.GetSellerRsp;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderReq;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.model.base.ProductOrderJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.list.MispListActivity;
import cn.fuego.misp.ui.model.ListViewResInfo;
import cn.fuego.misp.ui.util.LoadImageUtil;

public class UserOrderListActivity extends  MispListActivity<ProductOrderJson>
implements OnCheckedChangeListener
{
FuegoLog log = FuegoLog.getLog(UserOrderListActivity.class);
	
	//默认查询已订购
	int defaltType=R.string.order_type_ordered;	
	int curType=defaltType;	
	List<ProductOrderJson> orderList=new ArrayList<ProductOrderJson>();
	Map<Integer,List<ProductOrderJson>> productListTypeMap=new HashMap<Integer,List<ProductOrderJson>>(); 
	private ProductOrderJson selectedOrder;
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
		
		RadioGroup radioGroup = (RadioGroup) findViewById(R.id.orderStatusRadioGroup);
		radioGroup.setOnCheckedChangeListener(this);
	}
	
	@Override
	public void loadSendList()
	{
		GetProductOrderListReq req = new GetProductOrderListReq();
		req.setToken(AppCache.getInstance().getToken());
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
		
		return getOrderListByType(curType);
	}

	@Override
	public View getListItemView(View view, ProductOrderJson item)
	{		
		TextView nameView= (TextView) view.findViewById(R.id.order_activity_name);
		nameView.setText(StringLengthLimit.limitStringLen(item.getProduct_name(),9));
		nameView.setTag(item);
		
		TextView idView= (TextView) view.findViewById(R.id.order_id);
		idView.setText(String.valueOf(item.getOrder_id()));
		idView.setTag(item);
		
		TextView statusView= (TextView) view.findViewById(R.id.order_status);
		statusView.setText(item.getOrder_status());
		statusView.setTag(item);
		
		TextView dueDateView= (TextView) view.findViewById(R.id.order_overdue_date);
		dueDateView.setText(item.getEnd_date_time());
		dueDateView.setTag(item);
		
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
		imageView.setTag(item);
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
	

	
	/**
	 * 删除、取消事件处理
	 * @param v
	 */
	public void deleteCancelOrderEvent(View v){	
		
		ProductOrderJson delOrder = (ProductOrderJson)v.getTag();
		//发送取消活动请求
		SetProductOrderReq req = new SetProductOrderReq();
		req.setOrderID(delOrder.getOrder_id());
		req.setToken(AppCache.getInstance().getToken());
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
			this.refreshList(new ArrayList<ProductOrderJson>());
			WebServiceContext.getInstance().getProductManageRest(handle).cancelProductOrder(req);
		}else{
			//删除
			log.info("deleteEvent:ID="+delOrder.toString());
			this.refreshList(new ArrayList<ProductOrderJson>());
			
			WebServiceContext.getInstance().getProductManageRest(handle).deleteProductOrder(req);
		}
	
	}	
	
	/**
	 * 选择订单跳转到产品详情
	 * @param v
	 */
	public void showOrder(View v){	
		log.info("show product clicked...");
		//获取商家信息
		GetSellerReq req =new GetSellerReq();
		selectedOrder = (ProductOrderJson)v.getTag();
		req.setSeller_id(selectedOrder.getSeller_id());
		req.setToken(AppCache.getInstance().getToken());
		WebServiceContext.getInstance().getProductManageRest(new MispHttpHandler(){
			@Override
			public void handle(MispHttpMessage message)
			{
				if (message.isSuccess()){
					GetSellerRsp rsp = (GetSellerRsp) message.getMessage().obj;
					if(rsp.getProductList()!=null && !rsp.getProductList().isEmpty()){
						//获取当前的Product
						getProductAndShowByList(rsp.getProductList());
							}
				}
				else{
					showMessage(message);
				}
			}
		}).getSellerInfo(req);
	}

	/**
	 * 
	 * @param productList
	 */
	protected void getProductAndShowByList(List<ProductJson> productList)
	{
		if(selectedOrder!=null)
		{
			ProductJson product = IteratorSelector.findbyAttr(productList, ProductJson.PRODUCT_ID, selectedOrder.getProduct_id());
			
			if(null == product)
			{
				showMessage("该订单产品不存在");
			}
			else
			{
				Intent intent = new Intent();
				intent.setClass(this, HomeProductActivity.class);
				log.info("show product : "+ product.toString());
				intent.putExtra(ListViewResInfo.SELECT_ITEM, product);
				startActivity(intent);
			}

		}
	}

	@Override
	public void onCheckedChanged(RadioGroup group, int checkedId)
	{
		switch (checkedId)
		{
		case R.id.selectCancelOrder:
			selectCancelOrder(group);
			break;
		case R.id.selectUsedOrder:
			selectUsedOrder(group);
			break;
		case R.id.selectNormalOrder:
			selectNormalOrder(group);
			break;
		case R.id.selectOverDueOrder:
			selectOverDueOrder(group);
			break;
		default:
			break;
		}
		
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
 
}
