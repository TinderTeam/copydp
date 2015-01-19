package cn.fuego.eshoping.ui.widget;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.util.Log;
import android.widget.Toast;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.constant.ErrorMessageConst;
import cn.fuego.eshoping.ui.MainTabbarActivity;
import cn.fuego.eshoping.ui.MainTabbarInfo;
import cn.fuego.eshoping.ui.home.HomeFragment;
import cn.fuego.eshoping.ui.order.ProductOrderSuccess;
import cn.fuego.eshoping.webservice.up.model.GetSellerRsp;
import cn.fuego.eshoping.webservice.up.model.LoginReq;
import cn.fuego.eshoping.webservice.up.model.LoginRsp;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.constant.MISPErrorMessageConst;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.widget.login.LoginFormView;

public class AppLoginView extends LoginFormView
{
	FuegoLog log = FuegoLog.getLog(AppLoginView.class);
	
    private ProgressDialog proDialog;
    
    public AppLoginView(Activity context){
    	super(context,  R.id.txt_username, R.id.txt_password,R.id.login_btn);
    }

	@Override
	public void onCreate()
	{
		setVerificationViewID(R.id.txt_loginerror);
	}

	@Override
	public void onLogin(String name, String pwd)
	{
	
		proDialog =ProgressDialog.show(context, "请稍等", "登录信息验证中……");	
		
		LoginReq req = new LoginReq();
		req.setPassword(pwd);
		req.setUsername(name);
		log.info("login request:"+req.toString());	
		MispHttpHandler loginHandler = new MispHttpHandler(){
			@Override
			public void handle(MispHttpMessage message)
			{
				proDialog.dismiss();
				if (message.isSuccess()){		
					LoginRsp rsp = (LoginRsp) message.getMessage().obj;
					AppCache.setCustomer(rsp.getCustomer());
					AppCache.setUser(rsp.getUser());
					AppCache.setToken(rsp.getToken());
					Intent intent = new Intent(context,MainTabbarActivity.class);
					intent.putExtra(MainTabbarActivity.SELECTED_TAB, MainTabbarInfo.getIndexByClass(HomeFragment.class));
					context.startActivity(intent);
				}
				else{
					showErrorMsg(MISPErrorMessageConst.getMessageByErrorCode(message.getErrorCode()));
				}
			}	
		};
		WebServiceContext.getInstance().getUserManageRest(loginHandler).login(req);	
	}
}
