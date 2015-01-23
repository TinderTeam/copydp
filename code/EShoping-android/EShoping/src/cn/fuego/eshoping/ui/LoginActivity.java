package cn.fuego.eshoping.ui;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.ui.base.ExitApplication;
import cn.fuego.eshoping.ui.widget.AppLoginView;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.model.ListViewResInfo;


public class LoginActivity extends BaseActivtiy
{
	private FuegoLog log = FuegoLog.getLog(getClass());
	
	
	
	private AppLoginView loginView;

	@Override
	public void initRes()
	{
		activityRes.setAvtivityView(R.layout.activity_login);
		this.activityRes.setBackBtn(R.id.com_back_btn);	
		this.activityRes.setName(getString(R.string.page_login));
		this.activityRes.setTitleTextView(R.id.com_head_title);
	}
	
    @Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		//获取需要登录页面的返回类型
		int typeNumber=0;
		if(this.getIntent()!=null&&this.getIntent().getSerializableExtra(SharedPreferenceConst.LOGIN_RETURN_TYPE)!=null){
			typeNumber=(Integer)this.getIntent().getSerializableExtra(SharedPreferenceConst.LOGIN_RETURN_TYPE);
		}	
		setLoginView(new AppLoginView(this,typeNumber));
		ExitApplication.getInstance().addActivity(this);	
		Button registBtn = (Button) this.findViewById(R.id.com_next_btn);
		registBtn.setText(R.string.page_regist);
		registBtn.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v)
			{		
				log.info("regist button clicked...");
				toRegist();
			}
		});
	}
    

    
	protected void toRegist()
	{
		Intent intent = new Intent();
		intent.setClass(this, RegistActivity.class);
		this.startActivity(intent);			
	}

	
	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub
		
	}

	public AppLoginView getLoginView()
	{
		return loginView;
	}

	public void setLoginView(AppLoginView loginView)
	{
		this.loginView = loginView;
	}
 
}
