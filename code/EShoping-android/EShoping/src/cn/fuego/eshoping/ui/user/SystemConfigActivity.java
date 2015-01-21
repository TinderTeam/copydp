package cn.fuego.eshoping.ui.user;

import android.view.View;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.misp.service.http.MispHttpMessage;

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

	public void to_version_update(View v){
		log.info("next activity: version_update");
	}
	
	public void to_about_us(View v){
		log.info("next activity: to_about_us");
	}
}
