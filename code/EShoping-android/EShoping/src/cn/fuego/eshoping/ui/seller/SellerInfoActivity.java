package cn.fuego.eshoping.ui.seller;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.text.Html;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.ui.home.ImagePagerAdapter;
import cn.fuego.eshoping.ui.util.DataConvertUtil;
import cn.fuego.eshoping.ui.util.LoadImageUtil;
import cn.fuego.eshoping.webservice.up.model.base.SellerJson;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.list.ListViewResInfo;

import com.baidu.mapapi.SDKInitializer;
import com.baidu.mapapi.map.MapView;

public class SellerInfoActivity extends BaseActivtiy
{
	private FuegoLog log = FuegoLog.getLog(SellerInfoActivity.class);
	//对象
 	private SellerJson seller;
 	//组件
 	private MapView mMapView = null;
 	private ViewGroup group =null;
	private ViewPager viewPager=null;
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
//		Intent intent = new Intent();
//		intent.setClass(SellerInfoActivity.this, ProductOrderActivity.class);
//		intent.putExtra(SharedPreferenceConst.PRODUCT, product);
//		startActivity(intent);
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
		infoView = (TextView) findViewById(R.id.seller_info);
		discView = (TextView) findViewById(R.id.seller_disc);
		//产品图片
		
		
		
		positionView.setText(seller.getCity()+seller.getZone_name());
		nameView.setText(seller.getSeller_name());
		infoView.setText(Html.fromHtml(seller.getInfo()));
		discView.setText(seller.getDscr());
	}


	/**
	 * 加载商户组件数据（异步）
	 */
	private void sellerComponentUpdateData()
	{
		List<String> imageList = LoadImageUtil.getImgStr(seller.getInfo());
		if(ValidatorUtil.isEmpty(imageList)){
			imageList = new ArrayList<String>();
		}
		imageList.add(0,DataConvertUtil.getAbsUrl(seller.getImg()));
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
