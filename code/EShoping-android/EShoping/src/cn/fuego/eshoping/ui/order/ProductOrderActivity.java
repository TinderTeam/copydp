package cn.fuego.eshoping.ui.order;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.constant.ErrorMessageConst;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderReq;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.model.base.ProductOrderJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.constant.MISPErrorMessageConst;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.service.http.MispHttpMessage;

public class ProductOrderActivity extends BaseActivtiy
{
	private FuegoLog log = FuegoLog.getLog(ProductOrderActivity.class);
	
	private TextView productPrice;
	private TextView sumPrice;
	private EditText quantitiy;
	private ProductJson product;
	private Button orderSubmitBtn;
	
	/**
	 * 修改购买数量、总价联动事件
	 */
	TextWatcher textWatcher = new TextWatcher(){
		@Override
		public void beforeTextChanged(CharSequence s, int start, int count,int after){}
		@Override
		public void onTextChanged(CharSequence s, int start, int before,int count){}
		@Override
		public void afterTextChanged(Editable s)
		{
			int num = 0; 
			float sum=0;
			
			if(!quantitiy.getText().toString().isEmpty()){			
				num=Integer.valueOf(quantitiy.getText().toString());
				log.info("new num is:"+quantitiy.getText().toString());
			};
			sum=product.getPrice()*num;
			//if different between quantity value...
			if(!String.valueOf(sum).equals(sumPrice.getText())){
				sumPrice.setText(String.valueOf(sum));
				quantitiy.setText(String.valueOf(num));
				quantitiy.setSelection(String.valueOf(num).length());	//move cursor to end 
				log.info("change sum successful...");
			}	
		}
	};
	
	// submit button handle
	OnClickListener submitOrderListener = new OnClickListener(){
		@Override
		public void onClick(View v)
		{
			//get submit data about order
			if(ValidatorUtil.isInt(quantitiy.getText().toString()))
			{
				int orderQantity = Integer.valueOf(quantitiy.getText().toString());
				SetProductOrderReq orderReq = new SetProductOrderReq();
				orderReq.setProductID(product.getProduct_id());
				orderReq.setQuantity(orderQantity);
				orderReq.setToken(MemoryCache.getToken());
				orderReq.setUserID(AppCache.getUser().getUser_id());
				//call create order api
				WebServiceContext.getInstance().getProductManageRest(ProductOrderActivity.this).createProductOrder(orderReq);
			}else{
				showMessage(MISPErrorMessageConst.TYPE_CONVERSION_FAILED);
			}
		}		
	};
	
	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.order_index);
		this.activityRes.setBackBtn(R.id.com_back_btn);
		this.activityRes.setTitleTextView(R.id.com_head_title);
		this.activityRes.setName(R.string.page_order_submit);
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

	


	//Initialization Data
	private void InitializationData()
	{
		Intent intent = this.getIntent();	
		//获取数据
		product=(ProductJson) intent.getSerializableExtra(SharedPreferenceConst.PRODUCT);
		log.info(product.toString());
	}

	//Initialization Component
	private void InitializationComponent()
	{
		//View
		productPrice = (TextView) findViewById(R.id.order_product_price);
		sumPrice = (TextView) findViewById(R.id.order_sum);
		quantitiy = (EditText) findViewById(R.id.order_quantity);	
		orderSubmitBtn= (Button) findViewById(R.id.order_submit_btn);
	}
	
	//Update Data
	private void ComponentUpdateData()
	{
		productPrice.setText(String.valueOf(product.getPrice()));
		sumPrice.setText(String.valueOf(product.getPrice()));
		quantitiy.setText(String.valueOf(1));	
		quantitiy.addTextChangedListener(textWatcher);	
		orderSubmitBtn.setOnClickListener(submitOrderListener);	
	}

	//create Order Handel 
	@Override
	public void handle(MispHttpMessage message)
	{
		log.info(message.toString());
		if (message.isSuccess()){
			SetProductOrderRsp rsp = (SetProductOrderRsp) message.getMessage().obj;
			if(null != rsp.getProductOrder()){
				// get order rsp data
				ProductOrderJson order= new ProductOrderJson();
				order=rsp.getProductOrder();
				log.info("create order rsp: "+order);
				
				// jump to order success
				Intent intent = new Intent();
				intent.setClass(ProductOrderActivity.this, ProductOrderSuccess.class);
				intent.putExtra(SharedPreferenceConst.PRODUCT_ORDER, order);
				startActivity(intent);
			}else{
				showMessage(ErrorMessageConst.GET_PRODUCT_ORDER_FAILED);
			}
		}
		else{
			showMessage(message);
		}
	}
}
