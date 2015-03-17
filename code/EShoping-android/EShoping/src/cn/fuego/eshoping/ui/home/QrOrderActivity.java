package cn.fuego.eshoping.ui.home;

import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.format.JsonConvert;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.service.verification.VerificationService;
import cn.fuego.eshoping.ui.LoginActivity;
import cn.fuego.eshoping.ui.order.ProductOrderActivity;
import cn.fuego.eshoping.ui.widget.AppLoginView;
import cn.fuego.eshoping.webservice.up.model.GetSellerReq;
import cn.fuego.eshoping.webservice.up.model.GetSellerRsp;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderReq;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderRsp;
import cn.fuego.eshoping.webservice.up.model.base.QrcodeJson;
import cn.fuego.eshoping.webservice.up.model.base.SellerJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.lib.qr.zxing.MipcaActivityCapture;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.base.MispHttpActivtiy;

public class QrOrderActivity extends MispHttpActivtiy
{
	private final static int SCANNIN_GREQUEST_CODE = 1;
	private FuegoLog log = FuegoLog.getLog(getClass());
	private TextView sellerNameView;
	private TextView sellerDespView;
	private QrcodeJson code;
	private SellerJson seller;

	@Override
	public void initRes()
	{
		this.activityRes.setName("扫码消费");
		this.activityRes.setAvtivityView(R.layout.qr_order);
		this.activityRes.setBackBtn(R.id.com_back_btn);
		this.activityRes.setTitleTextView(R.id.com_head_title);
	}

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		toCapture();
 
	}

	private void toCapture()
	{
		Intent intent = new Intent();
		intent.setClass(QrOrderActivity.this,MipcaActivityCapture.class);
		intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
		startActivityForResult(intent, SCANNIN_GREQUEST_CODE);
	}

	@Override
	public void onClick(View v)
	{
		
	}
	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data)
	{
		 
		super.onActivityResult(requestCode, resultCode, data);
		switch (requestCode)
		{
			case SCANNIN_GREQUEST_CODE:
			if (resultCode == RESULT_OK)
			{
				sellerNameView = (TextView) findViewById(R.id.qr_seller_name);
				sellerDespView = (TextView) findViewById(R.id.qr_seller_desp);	
				
				Bundle bundle = data.getExtras();
				log.info("code is =" + bundle.getString("result"));
				try{
					code= (QrcodeJson) JsonConvert.jsonToObject(bundle.getString("result"), QrcodeJson.class);
					getSeller(code.getValue());	
					
				}catch(Exception ex){
					this.showMessage("二维码校验失败");
					toCapture();
				}			
			}else{
				this.finish();
			}
			break;
		}
	}

	public void getSeller(int id)
	{

		GetSellerReq req = new GetSellerReq();
		req.setSeller_id(id);
		WebServiceContext.getInstance().getProductManageRest(this).getSellerInfo(req);
	}
	@Override
	public void handle(MispHttpMessage message)
	{
		if(message.isSuccess())
		{
			GetSellerRsp rsp = (GetSellerRsp) message.getMessage().obj;
			
			if(null != rsp.getSeller())
			{
				seller=rsp.getSeller();
				sellerNameView.setText(rsp.getSeller().getSeller_name());
				sellerDespView.setText(rsp.getSeller().getDscr());
			}
			else
			{
				this.finish();
				showMessage("商家不存在");
			}		
 		}
		else
		{
			this.finish();
			showMessage(message);
		}		
	}
	
	/**
	 * 确认订单*/
	public void submitOrder(View v){
		log.info("submit button clicked...");
		
		if(AppCache.getInstance().isLogined()){
			SetProductOrderReq req = new SetProductOrderReq();
			req.setOrder_type("扫码下单");
			req.setSeller_id(seller.getUser_id());
			req.setToken(AppCache.getInstance().getToken());
			req.setUserID(AppCache.getInstance().getUser().getUser_id());
			WebServiceContext.getInstance().getProductManageRest(new MispHttpHandler(){

				@Override
				public void handle(MispHttpMessage message)
				{
					if(message.isSuccess())
					{
						showMessage("下单成功");
			 		}
					else
					{
						showMessage(message);
					}		
					finish();
				}
			}).createProductOrder(req);
		}else{
			//转至登陆页面
			Intent intent = new Intent();
			intent.setClass(this, LoginActivity.class);
			intent.putExtra(SharedPreferenceConst.LOGIN_RETURN_TYPE, AppLoginView.BACK_PAGE);
			startActivity(intent);
		}		
		
		
		
		
	}
}
