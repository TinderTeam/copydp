package cn.fuego.eshoping.ui.user;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.ui.base.ExitApplication;
import cn.fuego.eshoping.webservice.up.model.ModifyPwdReq;
import cn.fuego.eshoping.webservice.up.model.RegisterRsp;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.http.MispHttpMessage;
 
public class ResetPwdActivity extends BaseActivtiy 
{
	private FuegoLog log = FuegoLog.getLog(getClass());
	private EditText oldpswd;
	private EditText newpswd;
	
	@Override
	public void initRes()
	{
		activityRes.setAvtivityView(R.layout.reset_pswd);
		this.activityRes.setBackBtn(R.id.com_back_btn);	
		this.activityRes.setName(getString(R.string.page_regist));
		this.activityRes.setTitleTextView(R.id.com_head_title);
	}
	
    @Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		ExitApplication.getInstance().addActivity(this);	
		oldpswd=(EditText) this.findViewById(R.id.pswd_new);
		newpswd=(EditText) this.findViewById(R.id.pswd_old);
	}

	@Override
	public void handle(MispHttpMessage message)
	{
		if (message.isSuccess()){
			RegisterRsp rsp = (RegisterRsp) message.getMessage().obj;
			showMessage("修改成功");
			backOnClick();
		}
		else{
			showMessage(message);
		}
	}
	
	public void submit(View v){
		ModifyPwdReq req = new ModifyPwdReq();
		req.setToken(AppCache.getInstance().getToken());	
		String oldpswdStr = oldpswd.getText().toString().trim();
		req.setOldPwd(oldpswdStr);		
		String newpswdStr = newpswd.getText().toString().trim();		
		if(ValidatorUtil.isEmpty(newpswdStr) || newpswdStr.length()<6)
		{
			showMessage("密码输入不能少于6位");
			return;
		}		
		req.setPwdNew(newpswdStr);	
		req.setUsername(AppCache.getInstance().getUser().getUsername());
		log.info("Regist req = "+req);
		WebServiceContext.getInstance().getUserManageRest(this).modifyPassword(req);	
	}
}
