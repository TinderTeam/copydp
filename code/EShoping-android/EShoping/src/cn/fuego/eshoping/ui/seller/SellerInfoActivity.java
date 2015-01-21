package cn.fuego.eshoping.ui.seller;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.format.HtmlUtil;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.ui.home.ImagePagerAdapter;
import cn.fuego.eshoping.ui.home.ProductSearchActivity;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.model.base.SellerJson;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.model.ListViewResInfo;

import com.baidu.mapapi.SDKInitializer;
import com.baidu.mapapi.map.MapView;

public class SellerInfoActivity extends BaseActivtiy
{
	private FuegoLog log = FuegoLog.getLog(SellerInfoActivity.class);
	//对象
 	private SellerJson seller;
 	private List<ProductJson> productList;
 	//组件
 	private MapView mMapView = null;
 	private ViewGroup group =null;
	private ViewPager viewPager=null;
	private ImageView imageView;
	private TextView positionView ;
	private TextView nameView;
	private TextView infoView;
	private TextView discView;
	
	/**
	 * 显示所有产品
	 */	
	public void showSellerProductEvent(View v)
	{
		log.info("show seller products list clicked...");
		
		ProductJson productFilter = new ProductJson();
		productFilter.setSeller_id(seller.getUser_id());
		
		//jump to product list
		Intent intent = new Intent();
		intent.setClass(this, ProductSearchActivity.class);
		/*
		 * mark: 这里由于接口设计缘故没有提供条件话查询的通用接口，而是在seller获取的接口中代来了product的信息
		 * 故而同search product activity的结构无法匹配。
		 */
		intent.putExtra(SharedPreferenceConst.PRODUCT_FILTER,productFilter);
		startActivity(intent);
	}	
	
	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.seller_info);
		this.activityRes.setBackBtn(R.id.com_back_btn);	
	}
	
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		SDKInitializer.initialize(getApplicationContext());
		super.onCreate(savedInstanceState);
		//初始化数据
		InitializationData();
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
		//产品信息
		positionView = (TextView) findViewById(R.id.seller_city);
		nameView = (TextView) findViewById(R.id.seller_name);
	//infoView = (TextView) findViewById(R.id.seller_info);
		discView = (TextView) findViewById(R.id.seller_disc);
		viewPager = (ViewPager)findViewById(R.id.seller_img);
		group= (ViewGroup)findViewById(R.id.seller_image_view_group);
		
		positionView.setText(seller.getCity()+seller.getZone_name());
		nameView.setText(seller.getSeller_name());
		sellerComponentUpdateData();
		//infoView.setText(Html.fromHtml(seller.getInfo()));
		discView.setText(seller.getDscr());
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
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub
		
	}
}
