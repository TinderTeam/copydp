package cn.fuego.eshoping.ui.home;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.format.HtmlUtil;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.service.verification.VerificationService;
import cn.fuego.eshoping.ui.LoginActivity;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.ui.order.ProductOrderActivity;
import cn.fuego.eshoping.webservice.up.model.GetSellerReq;
import cn.fuego.eshoping.webservice.up.model.GetSellerRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.model.base.SellerJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.model.ListViewResInfo;

import com.baidu.mapapi.SDKInitializer;
import com.baidu.mapapi.map.MapView;

public class HomeProductActivity extends BaseActivtiy
{
	private FuegoLog log = FuegoLog.getLog(HomeProductActivity.class);
	//对象
 	private ProductJson product;
 	private SellerJson seller;
 	//组件
	private ImageView[] tips=null;
 	private MapView mMapView = null;
 	private ViewGroup group =null;
	private ViewPager viewPager=null;
	private List<ImageView> mImageViews = new ArrayList<ImageView>();  
	private TextView priceView ;
	private TextView limitView;
	private TextView view;
	private Button orderBtn;
	
	/**
	 * 操作
	 */
	//购买按钮
	OnClickListener orderBtnHandel= new OnClickListener(){
		@Override
		public void onClick(View v)
		{
			if(AppCache.getInstance().getUser()==null){ 
				//转至登陆页面
				Intent intent = new Intent();
				intent.setClass(HomeProductActivity.this, LoginActivity.class);
				startActivity(intent);
			}
			if(!VerificationService.buyProductVerification(AppCache.getInstance().getUser().getUser_id())){
				;
			}else{
				Intent intent = new Intent();
				intent.setClass(HomeProductActivity.this, ProductOrderActivity.class);
				intent.putExtra(SharedPreferenceConst.PRODUCT, product);
				startActivity(intent);
			}
		}	
	};
	
	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.home_product);
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
		//组件加载数据
		ComponentUpdateData();
	}

	/**
	 * 初始化数据
	 */
	private void InitializationData()
	{
		//获取产品数据
	 	Intent intent = this.getIntent();
		product = (ProductJson) intent.getSerializableExtra(ListViewResInfo.SELECT_ITEM);
		log.info(product.toString());
		
		//获取商家数据
		GetSellerReq req = new GetSellerReq();
		req.setSeller_id(product.getSeller_id());
		/**
		 * 获取商家信息
		 */
		MispHttpHandler getSellerHandel=new MispHttpHandler(){
			@Override
			public void handle(MispHttpMessage message)
			{
				if (message.isSuccess()){
					GetSellerRsp rsp = (GetSellerRsp) message.getMessage().obj;
					if(null != rsp.getSeller()){
						seller=rsp.getSeller();
						//update SellerCompoment
						sellerComponentUpdateData();					
					}
				}
				else{
					showMessage(message);
				}
			}
		};
		WebServiceContext.getInstance().getProductManageRest(getSellerHandel).getSellerInfo(req); 
	}
	 
	private void InitializationComponent()
	{
		// 获取地图控件引用
		mMapView = (MapView) findViewById(R.id.bmapView);
		//产品信息
		priceView = (TextView) findViewById(R.id.home_product_price);
		limitView = (TextView) findViewById(R.id.order_activity_status);
		view = (TextView) findViewById(R.id.home_product_seller_info);	
		group = (ViewGroup)findViewById(R.id.home_product_image_view_group);
		//产品图片
		viewPager = (ViewPager) findViewById(R.id.home_product_image);	
		//按钮
		orderBtn = (Button)findViewById(R.id.order_activity_cancel_btn); 
	}
	
	/**
	 * 组件加载数据（同步）
	 */
	private void ComponentUpdateData()
	{		
		priceView.setText(String.valueOf(product.getPrice()));
		limitView.setText(String.valueOf(product.getEnd_date_time()));
		orderBtn.setOnClickListener(orderBtnHandel);
	}

	/**
	 * 加载商户组件数据（异步）
	 */
	private void sellerComponentUpdateData()
	{
		List<String> imageList = HtmlUtil.getImgStr(seller.getInfo());
		if(ValidatorUtil.isEmpty(imageList)){
			imageList = new ArrayList<String>();
		}
		imageList.add(0,MemoryCache.getImageUrl()+product.getImgsrc());
		ImagePagerAdapter adapter = new ImagePagerAdapter(this,group,imageList);
        viewPager.setAdapter(adapter);  
        viewPager.setCurrentItem(0); 
        viewPager.setOnPageChangeListener(adapter);		
		view.setText(seller.getDscr());
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
	}
}
