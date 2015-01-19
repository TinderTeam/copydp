package cn.fuego.eshoping.ui;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.ui.base.ExitApplication;
import cn.fuego.eshoping.webservice.up.model.RegisterReq;
import cn.fuego.eshoping.webservice.up.model.base.CustomerJson;
import cn.fuego.eshoping.webservice.up.model.base.UserJson;
import cn.fuego.misp.service.http.MispHttpMessage;

public class RegistActivity extends BaseActivtiy 
{
	private FuegoLog log = FuegoLog.getLog(getClass());
	private EditText name;
	private EditText pwd;
	private EditText code;
	private EditText email;
	
	@Override
	public void initRes()
	{
		activityRes.setAvtivityView(R.layout.activity_regist);
		this.activityRes.setBackBtn(R.id.com_back_btn);	
		this.activityRes.setName(R.string.page_regist);
		this.activityRes.setTitleTextView(R.id.com_head_title);
	}
	
    @Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		ExitApplication.getInstance().addActivity(this);	
		name=(EditText) this.findViewById(R.id.txt_username);
		pwd=(EditText) this.findViewById(R.id.txt_password);
		code=(EditText) this.findViewById(R.id.txt_code);
		email=(EditText) this.findViewById(R.id.txt_email);
	}

	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub
		
	}
	
	public void submit(View v){
		RegisterReq req = new RegisterReq();
		req.setToken(AppCache.getToken());
		UserJson user = new UserJson();
		user.setUsername(name.getText().toString().trim());
		user.setPassword(pwd.getText().toString().trim());
		CustomerJson customer =new CustomerJson();
		customer.setEmail(email.getText().toString().trim());
		req.setCode(code.getText().toString().trim());
		req.setUser(user);
	}
}
