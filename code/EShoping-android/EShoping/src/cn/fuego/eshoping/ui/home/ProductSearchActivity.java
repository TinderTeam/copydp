package cn.fuego.eshoping.ui.home;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.ui.util.DataConvertUtil;
import cn.fuego.eshoping.ui.widget.FilterPopupMenu;
import cn.fuego.eshoping.webservice.up.model.GetProductListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductListRsp;
import cn.fuego.eshoping.webservice.up.model.GetSellerReq;
import cn.fuego.eshoping.webservice.up.model.GetSellerRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.list.MispListActivity;
import cn.fuego.misp.ui.util.LoadImageUtil;

public class ProductSearchActivity extends  MispListActivity<ProductJson>
{
	
	private FuegoLog log = FuegoLog.getLog(ProductSearchActivity.class);
	//页面组件
    private RadioGroup searchGroup;
    private FilterPopupMenu popupMenu;
    private ProductJson filter;
    
	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.product_search);
		this.activityRes.setBackBtn(R.id.com_back_btn);		
		//List
		this.listViewRes.setListItemView(R.layout.home_list_item);
		this.listViewRes.setListView(R.id.product_search_list);	
		this.listViewRes.setClickActivityClass(HomeProductActivity.class);
	} 
	
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		InitializationData();
		super.onCreate(savedInstanceState);
		//初始化数据
		//初始化组件
		InitializationView();
		//初始化监听器
		InitializationListener();
	}
	
	private void InitializationData()
	{
		Intent intent = this.getIntent();
		filter = (ProductJson) intent.getSerializableExtra(SharedPreferenceConst.PRODUCT_FILTER);
		if(filter == null){
			filter = new ProductJson();
		}
		log.info("default select filter is = "+ filter );
		filter.setType_id(0);
		filter.setZone_id(0);
	}	
	
	private void InitializationView()
	{
		searchGroup = (RadioGroup) findViewById(R.id.product_serch_radio_group);   
		/*
		 * mark:如果已经设定了sellerid 的筛选条件，则不用显示上面的筛选框
		 */
		if(hasOtherFilter()){
			searchGroup.setVisibility(android.view.View.GONE);
		}
		popupMenu=new FilterPopupMenu(this,searchGroup);
	}
	
	private void InitializationListener()
	{
		//按钮组监听器
		searchGroup.setOnCheckedChangeListener(new OnCheckedChangeListener(){
			@Override
			public void onCheckedChanged(RadioGroup group, int checkedId)
			{
				int radioButtonId = group.getCheckedRadioButtonId();
				if (radioButtonId == R.id.product_serch_radio_type)
				{   
					log.info("type filter clicked...");
					popupMenu.showTypeFilter();
					group.clearCheck();
				}else if(radioButtonId == R.id.product_serch_radio_area)
				{
					log.info("zone filter clicked...");
					popupMenu.showZoneFilter();
					group.clearCheck();
				}
	
			}	
		});		
	}
	


	public void zoneFilter(int selectedId)
	{
		filter.setZone_id(selectedId);
		log.info("select by filter: "+filter);
		super.refreshList(new ArrayList<ProductJson>());
		loadSendList();
	}

	public void tpyeFilter(int selectedId)
	{
		filter.setType_id(selectedId);
		log.info("select by filter: "+filter);
		super.refreshList(new ArrayList<ProductJson>());
		loadSendList();
	}

	@Override
	public void loadSendList()
	{
		/*
		 * mark:如果已经设定了sellerid 的筛选条件，则不用进行数据通信，数据直接从上个界面带过来
		 */
		if(hasOtherFilter()){
			log.info("load list by sellerID filter");
			GetSellerReq req = new GetSellerReq();
			req.setToken(AppCache.getToken());
			req.setSeller_id(filter.getSeller_id());		
			WebServiceContext.getInstance().getProductManageRest(new MispHttpHandler(){
				@Override
				public void handle(MispHttpMessage message)
				{
					if (message.isSuccess()){
						GetSellerRsp rsp = (GetSellerRsp) message.getMessage().obj;
						if(rsp.getProductList()!=null && !rsp.getProductList().isEmpty()){
							showSelectedList(rsp.getProductList());
						}
					}
					else{
						showMessage(message);
					}
				}		
			}).getSellerInfo(req);
		}else{
			log.info("load list by filter: filter="+filter);
			GetProductListReq req = new GetProductListReq();
			req.setToken(AppCache.getToken());
			req.setCity(AppCache.getCityInfo().getCity());
			req.setTypeRoot(filter.getType_id());
			req.setZone_id(filter.getZone_id());
			req.setSearch(false);
			WebServiceContext.getInstance().getProductManageRest(this).getAllProductList(req);
		}
	}

	protected void showSelectedList(List<ProductJson> productList)
	{
		 this.refreshList(productList);
	}

	@Override
	public List<ProductJson> loadListRecv(Object obj)
	{
		GetProductListRsp rsp = (GetProductListRsp)obj;
		List<ProductJson> data = rsp.getProductList();
		if(data==null){
			data = new ArrayList<ProductJson>();
		}
		/*
		 * mark:
		 * 因为接口没有提供根据sellerID查询
		 */
		
		log.info("product list num = "+data.size());
		this.repaint();	
		return data;
	}
	
	@Override
	public View getListItemView(View view, ProductJson item)
	{
		TextView nameView= (TextView) view.findViewById(R.id.home_list_item_title);
		nameView.setText(item.getName());	
		TextView oldPriceView= (TextView) view.findViewById(R.id.home_list_item_oldPrice);
		oldPriceView.setText(String.valueOf(item.getOriginal_price()));
		TextView curPriceView= (TextView) view.findViewById(R.id.home_list_item_curPrice);
		curPriceView.setText(String.valueOf(item.getPrice()));
		TextView despView= (TextView) view.findViewById(R.id.home_list_item_desp);
		despView.setText(item.getDscr());
		ImageView imageView = (ImageView)view.findViewById(R.id.home_list_item_img);
		LoadImageUtil.getInstance().loadImage(imageView, DataConvertUtil.getAbsUrl(item.getImgsrc()));
		return view;
	}
	
	/**
	 * 判断页面是否已经有其他非类型、地区的筛选条件了
	 * 一般为sellerID
	 * 此时不用通过
	 * @return
	 */
	
	private boolean hasOtherFilter(){
		if(filter.getSeller_id()!=0){
			return true;	
		}
		return false;	
	}

}
