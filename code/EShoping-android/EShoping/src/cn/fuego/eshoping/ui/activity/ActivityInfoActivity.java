package cn.fuego.eshoping.ui.activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.service.verification.VerificationService;
import cn.fuego.eshoping.ui.LoginActivity;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.ui.order.ActivityOrderSuccess;
import cn.fuego.eshoping.ui.widget.AppLoginView;
import cn.fuego.eshoping.webservice.up.model.SetActivityOrderReq;
import cn.fuego.eshoping.webservice.up.model.SetActivityOrderRsp;
import cn.fuego.eshoping.webservice.up.model.base.ActivityJson;
import cn.fuego.eshoping.webservice.up.model.base.ActivityOrderJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.model.ListViewResInfo;
import cn.fuego.misp.ui.util.LoadImageUtil;

import com.baidu.mapapi.map.MapView;

public class ActivityInfoActivity extends BaseActivtiy
{
	private FuegoLog log = FuegoLog.getLog(ActivityInfoActivity.class);

	MapView mMapView = null;
	ActivityJson activity;
	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.activity_details);
		this.activityRes.setBackBtn(R.id.com_back_btn);		
		this.activityRes.setName(getString(R.string.page_activity_info));
		this.activityRes.setTitleTextView(R.id.com_head_title);
	}
 
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		//初始化数据
		InitializationData();
		//初始化组件
		InitializationComponent();
	}




	//参加按钮事件
	public void attendEvent(View v)
	{
		log.info("attend button clicked");
		if(AppCache.getInstance().getUser()!=null && VerificationService.buyProductVerification(AppCache.getInstance().getUser().getUser_id())){	
			activityAttend();
		}else{
			//转至登陆页面
			Intent intent = new Intent();
			intent.setClass(this, LoginActivity.class);
			intent.putExtra(SharedPreferenceConst.LOGIN_RETURN_TYPE, AppLoginView.BACK_PAGE);
			startActivity(intent);
		}
	}	
	
	//参与活动
	private void activityAttend()
	{
		SetActivityOrderReq orderReq = new SetActivityOrderReq();
		orderReq.setActivityID(activity.getActivity_id());
		orderReq.setToken(AppCache.getInstance().getToken());
		orderReq.setUserID(AppCache.getInstance().getUser().getUser_id());
		
		MispHttpHandler handler = new  MispHttpHandler(){

			@Override
			public void handle(MispHttpMessage message)
			{
				log.info(message.toString());
				boolean result = message.isSuccess();
				log.info("message.isSuccess()="+result);
				if(result)
				{
						SetActivityOrderRsp rsp = (SetActivityOrderRsp) message.getMessage().obj;
						// get order rsp data
						ActivityOrderJson order=rsp.getActivityOrder();
						log.info("create order rsp: "+order);
						// jump to order success
						Intent intent = new Intent();
						intent.setClass(ActivityInfoActivity.this, ActivityOrderSuccess.class);
						intent.putExtra(SharedPreferenceConst.ACTIVITY_ORDER, order);
						startActivity(intent);
				}
				else
				{
					showMessage(message);
				}
			}
		};
		//call create order api
		WebServiceContext.getInstance().getActivityManageRest(handler).createActivityOrder(orderReq);

	}


	private void InitializationData()
	{
		//获取活动数据
	 	Intent intent = this.getIntent();
		activity = (ActivityJson) intent.getSerializableExtra(ListViewResInfo.SELECT_ITEM);
		log.info(activity.toString());
	
	}


	private void InitializationComponent()
	{
		// 获取地图控件引用
		mMapView = (MapView) findViewById(R.id.bmapView);		
		//活动图片
		ImageView imageView = (ImageView)findViewById(R.id.order_product_img);
		LoadImageUtil.getInstance().loadImage(imageView, MemoryCache.getImageUrl()+activity.getImgsrc());
		
		TextView titleView = (TextView) findViewById(R.id.activity_title);
		titleView.setText(activity.getTitle());
		
		TextView contentView = (TextView) findViewById(R.id.activity_dscr);
		contentView.setText(activity.getDscr());
	}

	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub
		
	}
	

}
