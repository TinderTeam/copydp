package cn.fuego.eshoping.ui.user;

import java.io.Serializable;

import android.content.Intent;
import android.view.View;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.common.upgrage.UpgradeActivity;
import cn.fuego.misp.webservice.up.model.GetClientVersionReq;
import cn.fuego.misp.webservice.up.model.GetClientVersionRsp;

public class SystemConfigActivity extends BaseActivtiy
{

	private FuegoLog log = FuegoLog.getLog(SystemConfigActivity.class);
	
	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.user_sysconfig);
		this.activityRes.setBackBtn(R.id.com_back_btn);
		this.activityRes.setTitleTextView(R.id.com_head_title);
		this.activityRes.setName(getString(R.string.page_user_sysconfig));	
	}

	public void to_version_update(View v)
	{	
		GetClientVersionReq req = new GetClientVersionReq();
		WebServiceContext.getInstance().getMispSystemManageRest(new MispHttpHandler()
		{

			@Override
			public void handle(MispHttpMessage message)
			{
				if(message.isSuccess())
				{
					GetClientVersionRsp rsp = (GetClientVersionRsp) message.getMessage().obj;
					Intent intent = new Intent(SystemConfigActivity.this,UpgradeActivity.class);
					intent.putExtra(UpgradeActivity.CLIENT_INFO, (Serializable) rsp.getObj());

					startActivity(intent);
				}
				else
				{
					showMessage(message);
				}
				
			}
			
			
		}).getAppVersion(req);
	}
	
	public void to_about_us(View v){
		log.info("next activity: to_about_us");
	}
}
