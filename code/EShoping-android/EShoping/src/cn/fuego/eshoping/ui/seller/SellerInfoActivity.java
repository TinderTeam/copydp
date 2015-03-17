package cn.fuego.eshoping.ui.seller;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.graphics.Paint;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.text.Html;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.string.StringLengthLimit;
import cn.fuego.common.util.format.HtmlUtil;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.ui.home.HomeProductActivity;
import cn.fuego.eshoping.ui.home.ImagePagerAdapter;
import cn.fuego.eshoping.ui.home.ProductSearchActivity;
import cn.fuego.eshoping.webservice.up.model.GetSellerReq;
import cn.fuego.eshoping.webservice.up.model.GetSellerRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.model.base.SellerJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.ui.list.MispListActivity;
import cn.fuego.misp.ui.model.ListViewResInfo;
import cn.fuego.misp.ui.util.LoadImageUtil;

import com.baidu.mapapi.SDKInitializer;
import com.baidu.mapapi.map.MapStatus;
import com.baidu.mapapi.map.MapStatusUpdate;
import com.baidu.mapapi.map.MapStatusUpdateFactory;
import com.baidu.mapapi.map.MapView;
import com.baidu.mapapi.model.LatLng;

public class SellerInfoActivity extends MispListActivity<ProductJson>
{
	private FuegoLog log = FuegoLog.getLog(SellerInfoActivity.class);
	//对象
 	private SellerJson seller;
 	private List<ProductJson> productList;
 	//组件
 	private MapView mMapView = null;
 	private ViewGroup group =null;
	private ViewPager viewPager=null;
 	private TextView nameView;
	
	private TextView cityView;
	private TextView zoneView;
	private TextView typeView;
	private TextView infoView;

	private TextView discView;
	
	/**
	 * 显示所有产品
	 */	
	/*public void showSellerProductEvent(View v)
	{
		log.info("show seller products list clicked...");
		
		ProductJson productFilter = new ProductJson();
		productFilter.setSeller_id(seller.getUser_id());
		
		//jump to product list
		Intent intent = new Intent();
		intent.setClass(this, ProductSearchActivity.class);
		  //
		 //mark: 这里由于接口设计缘故没有提供条件话查询的通用接口，而是在seller获取的接口中代来了product的信息
		 // 故而同search product activity的结构无法匹配。
		 //
		intent.putExtra(SharedPreferenceConst.PRODUCT_FILTER,productFilter);
		startActivity(intent);
	}	*/
	
	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.seller_info);
		this.activityRes.setBackBtn(R.id.com_back_btn);	
		
		this.listViewRes.setListItemView(R.layout.home_list_item);
		this.listViewRes.setListView(R.id.product_search_list);	
		
		this.listViewRes.setClickActivityClass(HomeProductActivity.class);
		this.setAdapterForScrollView(true);
		InitializationData();
	}
	
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		SDKInitializer.initialize(getApplicationContext());
		super.onCreate(savedInstanceState);
		//初始化数据
		
		//初始化组件
		InitializationComponent();
	}

	/**
	 * 初始化数据
	 */
	private void InitializationData()
	{
		//获取产品数据
	 	Intent intent = this.getIntent();
		seller = (SellerJson) intent.getSerializableExtra(ListViewResInfo.SELECT_ITEM);
		log.info(seller.toString());
	}
	 
	private void InitializationComponent()
	{
		// 获取地图控件引用
		mMapView = (MapView) findViewById(R.id.bmapView);
		String location = seller.getPosition();

		
		log.info("location: "+location);
		LatLng point = null;
		if(location!=null&&!location.isEmpty()&&location.split(",").length ==2){
			log.info("location X: "+location.split(",")[0]);
			log.info("location Y: "+location.split(",")[1]);
			point = new LatLng(Float.valueOf(location.split(",")[1]),Float.valueOf(location.split(",")[0]));  
			//在地图上添加Marker，并显示  

		}
		else
		{
			point = new LatLng(39.91488,116.404017); 
		}
 		MapStatus mMapStatus = new MapStatus.Builder().target(point).zoom(18).build();
		MapStatusUpdate mMapStatusUpdate = MapStatusUpdateFactory.newMapStatus(mMapStatus);
		mMapView.getMap().setMapStatus(mMapStatusUpdate);
		
		
		viewPager = (ViewPager)findViewById(R.id.seller_img);
		group= (ViewGroup)findViewById(R.id.seller_image_view_group);
		//产品信息
		nameView = (TextView) findViewById(R.id.seller_name);
		discView = (TextView) findViewById(R.id.seller_desp);


		cityView = (TextView) findViewById(R.id.seller_city);
		zoneView = (TextView) findViewById(R.id.seller_zone);
		typeView = (TextView) findViewById(R.id.seller_type);
		
		infoView = (TextView) findViewById(R.id.seller_info);


	//infoView = (TextView) findViewById(R.id.seller_info);
		nameView.setText(seller.getSeller_name());
		discView.setText(seller.getDscr());

		
		cityView.setText("所在城市："+seller.getCity());
		zoneView.setText("所在区域："+seller.getZone_name());
		typeView.setText("商户类型："+seller.getType_name());
		
		infoView.setText(Html.fromHtml(HtmlUtil.removeImg(seller.getInfo())));
		
		sellerComponentUpdateData();
		//infoView.setText(Html.fromHtml(seller.getInfo()));
	}


	private void sellerComponentUpdateData()
	{
		List<String> imageList = HtmlUtil.getImgStr(seller.getInfo());
		if(ValidatorUtil.isEmpty(imageList)){
			imageList = new ArrayList<String>();
		}
		imageList.add(0,MemoryCache.getImageUrl()+seller.getImg());
		ImagePagerAdapter adapter = new ImagePagerAdapter(this,group,imageList);
        viewPager.setAdapter(adapter);  
        viewPager.setCurrentItem(0); 
        viewPager.setOnPageChangeListener(adapter);
        
	}

	@Override
	protected void onDestroy()
	{
		super.onDestroy();
		// 在activity执行onDestroy时执行mMapView.onDestroy()，实现地图生命周期管理
		mMapView.onDestroy();
	}

	@Override
	protected void onResume()
	{
		super.onResume();
		// 在activity执行onResume时执行mMapView. onResume ()，实现地图生命周期管理
		mMapView.onResume();
	}

	@Override
	protected void onPause()
	{
		super.onPause();
		// 在activity执行onPause时执行mMapView. onPause ()，实现地图生命周期管理
		mMapView.onPause();
	}
 
	@Override
	public View getListItemView(View view, ProductJson item)
	{
		TextView nameView= (TextView) view.findViewById(R.id.home_list_item_title);
		nameView.setText(StringLengthLimit.limitStringLen(item.getName(),10));	
		TextView oldPriceView= (TextView) view.findViewById(R.id.home_list_item_oldPrice);
		oldPriceView.setText(String.valueOf(getString(R.string.misp_rmb_unit)+item.getOriginal_price()));
		oldPriceView.getPaint().setFlags(Paint. STRIKE_THRU_TEXT_FLAG ); 

		TextView curPriceView= (TextView) view.findViewById(R.id.home_list_item_curPrice);
		curPriceView.setText(String.valueOf(getString(R.string.misp_rmb_unit)+item.getPrice()));
		TextView despView= (TextView) view.findViewById(R.id.home_list_item_desp);
		despView.setText(StringLengthLimit.limitStringLen(item.getDscr(),20));
		ImageView imageView = (ImageView)view.findViewById(R.id.home_list_item_img);
		LoadImageUtil.getInstance().loadImage(imageView, MemoryCache.getImageUrl()+item.getImgsrc());
		return view;
	}

	@Override
	public void loadSendList()
	{
		if(null != seller)
		{		
			GetSellerReq req = new GetSellerReq();
	    	req.setToken(AppCache.getInstance().getToken());
			req.setSeller_id(seller.getUser_id());
			 
			
			WebServiceContext.getInstance().getProductManageRest(this).getSellerInfo(req);
		}
 

		
	}

	@Override
	public List<ProductJson> loadListRecv(Object obj)
	{
		GetSellerRsp rsp = (GetSellerRsp)obj;
		List<ProductJson> data = rsp.getProductList();
		return data;
	}
}
