package cn.fuego.eshoping.ui.order;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.ui.MainTabbarActivity;
import cn.fuego.eshoping.ui.MainTabbarInfo;
import cn.fuego.eshoping.ui.activity.ActivityFragment;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.ui.home.HomeFragment;
import cn.fuego.eshoping.webservice.up.model.base.ActivityOrderJson;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.model.base.ProductOrderJson;
import cn.fuego.misp.service.http.MispHttpMessage;

public class ActivityOrderSuccess extends BaseActivtiy
{
	private FuegoLog log = FuegoLog.getLog(ActivityOrderSuccess.class);
	
	private ActivityOrderJson order;
	private TextView orderInfo;
	private TextView orderID;

	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.activity_order);
		this.activityRes.setBackBtn(R.id.com_back_btn);
		this.activityRes.setTitleTextView(R.id.com_head_title);
		this.activityRes.setName(getString(R.string.page_attend_success));	
	}
	
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);		
		//初始化数据
		InitializationData();
		//初始化组件
		InitializationComponent();
		//组件加载数据
		ComponentUpdateData();
	}

	private void InitializationComponent()
	{
		//View
		orderInfo = (TextView) findViewById(R.id.activity_order_title);
		orderID= (TextView) findViewById(R.id.order_success_id);
	}

	private void ComponentUpdateData()
	{
		
		orderInfo.setText(order.getActivity_title()+" 活动参与成功");	
		orderID.setText(order.getActivity_order_id());
	}

	private void InitializationData()
	{
		Intent intent = this.getIntent();	
		//获取数据
		order=(ActivityOrderJson) intent.getSerializableExtra(SharedPreferenceConst.ACTIVITY_ORDER);
		log.info(order.toString());
	}

	public void moreEvent(View v)
	{
		log.info("more button event...");
		Intent intent = new Intent();
		intent.setClass(ActivityOrderSuccess.this, MainTabbarActivity.class);
		intent.putExtra(MainTabbarActivity.SELECTED_TAB, MainTabbarInfo.getIndexByClass(ActivityFragment.class));		
		startActivity(intent);
	}
	@Override
	public void handle(MispHttpMessage message)
	{
		//
	}

}
