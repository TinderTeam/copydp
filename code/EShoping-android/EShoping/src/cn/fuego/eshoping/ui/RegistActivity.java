package cn.fuego.eshoping.ui;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.ui.base.ExitApplication;
import cn.fuego.eshoping.webservice.up.model.RegisterReq;
import cn.fuego.eshoping.webservice.up.model.RegisterRsp;
import cn.fuego.eshoping.webservice.up.model.base.CustomerJson;
import cn.fuego.eshoping.webservice.up.model.base.UserJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
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
		this.activityRes.setName(getString(R.string.page_regist));
		this.activityRes.setTitleTextView(R.id.com_head_title);
	}
	
    @Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		ExitApplication.getInstance().addActivity(this);	
		name=(EditText) this.findViewById(R.id.reg_user);
		pwd=(EditText) this.findViewById(R.id.reg_pwd);
		code=(EditText) this.findViewById(R.id.reg_code);
		email=(EditText) this.findViewById(R.id.reg_email);
	}

	@Override
	public void handle(MispHttpMessage message)
	{
		if (message.isSuccess()){
			RegisterRsp rsp = (RegisterRsp) message.getMessage().obj;
			showMessage("注册成功，请等待管理员审核。");
			backOnClick();
		}
		else{
			showMessage(message);
		}
	}
	
	public void submit(View v){
		RegisterReq req = new RegisterReq();
		req.setToken(AppCache.getInstance().getToken());
		UserJson user = new UserJson();
		
		String nameStr = name.getText().toString().trim();
		
	    if(ValidatorUtil.isEmpty(nameStr))
	    {
	    	showMessage("用户名不能为空");
	    	return;
	       
	    }
				
		user.setUsername(nameStr);
		
		String pwdStr = pwd.getText().toString().trim();
		
		if(ValidatorUtil.isEmpty(pwdStr) || pwdStr.length()<6)
		{
			showMessage("密码输入不能少于6位");
			return;
		}
		
		user.setPassword(pwdStr);
		
		CustomerJson customer =new CustomerJson();
		String emailStr = email.getText().toString().trim();
		if(!ValidatorUtil.isEmail(emailStr))
		{
			showMessage("邮箱格式不正确");
			return;
		}
				
		customer.setEmail(emailStr);
		req.setCode(code.getText().toString().trim());
		req.setUser(user);
		log.info("Regist req = "+req);
		WebServiceContext.getInstance().getUserManageRest(this).registerMemeber(req);	
	}
}
