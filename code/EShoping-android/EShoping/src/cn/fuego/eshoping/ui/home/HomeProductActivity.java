package cn.fuego.eshoping.ui.home;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.webservice.up.model.GetSellerReq;
import cn.fuego.eshoping.webservice.up.model.GetSellerRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.list.ListViewResInfo;

import com.baidu.mapapi.SDKInitializer;
import com.baidu.mapapi.map.MapView;

public class HomeProductActivity extends BaseActivtiy 
{
	private FuegoLog log = FuegoLog.getLog(HomeProductActivity.class);

	private MapView mMapView = null;

	private ViewPager viewPager;
	private ImageView[] tips;    

	private ImageView[] mImageViews;  
    
	  
 	private ProductJson product;
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		// 在使用SDK各组件之前初始化context信息，传入ApplicationContext
		// 注意该方法要再setContentView方法之前实现
		SDKInitializer.initialize(getApplicationContext());
		setContentView(R.layout.home_product);
		// 获取地图控件引用
		mMapView = (MapView) findViewById(R.id.bmapView);
		
		Intent intent = this.getIntent();
		
		product = (ProductJson) intent.getSerializableExtra(ListViewResInfo.SELECT_ITEM);
		TextView priceView = (TextView) findViewById(R.id.home_product_price);
		
		getSeller();
		
		priceView.setText(String.valueOf(product.getPrice()));
		
		
		
	}
	
	
	private void displayImage()
	{
		ViewGroup group = (ViewGroup)findViewById(R.id.home_product_image_view_group);  
        viewPager = (ViewPager) findViewById(R.id.home_product_image);  
          
        //载入图片资源ID  
        int[] imgIdArray = new int[]{R.drawable.home_beauty, R.drawable.home_car,  
                R.drawable.home_education };  
          
        //将点点加入到ViewGroup中  
        tips = new ImageView[imgIdArray.length];  
        for(int i=0; i<tips.length; i++){  
            ImageView imageView = new ImageView(this);  
            imageView.setLayoutParams(new LayoutParams(10,10));  
            tips[i] = imageView;  
            if(i == 0){  
                tips[i].setBackgroundResource(R.drawable.app_icon);  
            }else{  
                tips[i].setBackgroundResource(R.drawable.app_logo);  
            }  
              
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(new ViewGroup.LayoutParams(LayoutParams.WRAP_CONTENT,    
                    LayoutParams.WRAP_CONTENT));  
            layoutParams.leftMargin = 5;  
            layoutParams.rightMargin = 5;  
            group.addView(imageView, layoutParams);  
        }  
          
  
        //将图片装载到数组中  
        mImageViews = new ImageView[imgIdArray.length];  
        for(int i=0; i<mImageViews.length; i++){  
            ImageView imageView = new ImageView(this);  
            mImageViews[i] = imageView;  
            imageView.setBackgroundResource(imgIdArray[i]);  
        }  
          
        //设置Adapter  
        viewPager.setAdapter(new MyAdapter());  
        //设置监听，主要是设置点点的背景  
        //viewPager.setOnPageChangeListener(this);  
        //设置ViewPager的默认项, 设置为长度的100倍，这样子开始就能往左滑动  
        viewPager.setCurrentItem((mImageViews.length) * 100);  
	}
			
	 public class MyAdapter extends PagerAdapter{  
		  
	        @Override  
	        public int getCount() {  
	            return Integer.MAX_VALUE;  
	        }  
	  
	        @Override  
	        public boolean isViewFromObject(View arg0, Object arg1) {  
	            return arg0 == arg1;  
	        }  
	  
	        @Override  
	        public void destroyItem(View container, int position, Object object) {  
	            ((ViewPager)container).removeView(mImageViews[position % mImageViews.length]);  
	              
	        }  
	  
	        /** 
	         * 载入图片进去，用当前的position 除以 图片数组长度取余数是关键 
	         */  
	        @Override  
	        public Object instantiateItem(View container, int position) {  
	            ((ViewPager)container).addView(mImageViews[position % mImageViews.length], 0);  
	            return mImageViews[position % mImageViews.length];  
	        }
 
	          
	          
	          
	    }  
	private void getSeller()
	{
		GetSellerReq req = new GetSellerReq();
		req.setSeller_id(product.getSeller_id());
		WebServiceContext.getInstance().getProductManageRest(this).getSellerInfo(req); 
	}


	@Override
	public void handle(MispHttpMessage message)
	{
		if (message.isSuccess())
		{
			GetSellerRsp rsp = (GetSellerRsp) message.getMessage().obj;
			if(null != rsp.getSeller())
			{
				TextView view = (TextView) findViewById(R.id.home_product_seller_info);
				view.setText(rsp.getSeller().getDscr());
			}
 
		}
		else
		{
			this.showMessage(message);
		}
		

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

}
