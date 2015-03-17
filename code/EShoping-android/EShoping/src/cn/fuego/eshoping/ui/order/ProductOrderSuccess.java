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
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.model.base.ProductOrderJson;
import cn.fuego.misp.service.http.MispHttpMessage;

public class ProductOrderSuccess extends BaseActivtiy
{
	private FuegoLog log = FuegoLog.getLog(ProductOrderSuccess.class);
	
	private ProductOrderJson order;
	private TextView orderInfo;
	private TextView orderNum;
	private TextView orderID;
	private Button buyMoreBtn;
	
	/**
	 * buy more button handle
	 */
	OnClickListener buyMoreHandle = new OnClickListener(){
		@Override
		public void onClick(View v)
		{
			MainTabbarActivity.jump(ProductOrderSuccess.this, HomeFragment.class, 1);
 
		}
	};
	
	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.order_success);
		this.activityRes.setBackBtn(R.id.com_back_btn);
		this.activityRes.setTitleTextView(R.id.com_head_title);
		this.activityRes.setName(getString(R.string.page_order_success));	
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
		orderInfo = (TextView) findViewById(R.id.order_success_label);
		orderNum = (TextView) findViewById(R.id.order_success_label_num);
		orderID= (TextView) findViewById(R.id.order_success_id);
		buyMoreBtn=(Button) findViewById(R.id.order_success_keep);
	}

	private void ComponentUpdateData()
	{
		orderInfo.setText(order.getProduct_name()+" ￥"+order.getOrder_price()+"×"+order.getQuantity());
		orderNum.setText(order.getQuantity()+"份");
		orderID.setText(order.getOrder_id());
		buyMoreBtn.setOnClickListener(buyMoreHandle);
	}

	private void InitializationData()
	{
		Intent intent = this.getIntent();	
		//获取数据
		order=(ProductOrderJson) intent.getSerializableExtra(SharedPreferenceConst.PRODUCT_ORDER);
		log.info(order.toString());
	}

	@Override
	public void handle(MispHttpMessage message)
	{
		//
	}

}
