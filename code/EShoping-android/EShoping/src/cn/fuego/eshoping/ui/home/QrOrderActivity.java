package cn.fuego.eshoping.ui.home;

import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.webservice.up.model.GetSellerReq;
import cn.fuego.eshoping.webservice.up.model.GetSellerRsp;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.lib.qr.zxing.MipcaActivityCapture;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.base.MispHttpActivtiy;

public class QrOrderActivity extends MispHttpActivtiy
{
	private final static int SCANNIN_GREQUEST_CODE = 1;
 
	private TextView mTextView;
 
	private ImageView mImageView;
	
	private TextView sellerNameView;
	private TextView sellerDespView;


	@Override
	public void initRes()
	{
		this.activityRes.setName("扫码消费");
		this.activityRes.setAvtivityView(R.layout.qr_order);
		this.activityRes.getButtonIDList().add(R.id.button1);
		
	}

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
 
		mTextView = (TextView) findViewById(R.id.result);
		mImageView = (ImageView) findViewById(R.id.qrcode_bitmap);
		sellerDespView = (TextView) findViewById(R.id.seller_desp);
 
	}

	@Override
	public void onClick(View v)
	{
		Intent intent = new Intent();
		intent.setClass(QrOrderActivity.this,
				MipcaActivityCapture.class);
		intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
		startActivityForResult(intent, SCANNIN_GREQUEST_CODE);
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
				Bundle bundle = data.getExtras();
				// ��ʾɨ�赽������
				mTextView.setText(bundle.getString("result"));
				// ��ʾ
				mImageView.setImageBitmap((Bitmap) data
						.getParcelableExtra("bitmap"));
			}
			break;
		}
	}

	public void getSeller(String qrcode)
	{
		int sellerID = 1;
		GetSellerReq req = new GetSellerReq();
		req.setSeller_id(sellerID);
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
				sellerNameView.setText(rsp.getSeller().getSeller_name());

				sellerDespView.setText(rsp.getSeller().getDscr());
			}
			else
			{
				showMessage("商家不存在");
			}

			
 		}
		else
		{
			showMessage(message);
		}
		
	}
	


}
