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
import cn.fuego.eshoping.ui.RegistActivity;
import cn.fuego.eshoping.ui.home.HomeFragment;
import cn.fuego.eshoping.ui.order.ProductOrderSuccess;
import cn.fuego.eshoping.webservice.up.model.GetSellerRsp;
import cn.fuego.eshoping.webservice.up.model.LoginReq;
import cn.fuego.eshoping.webservice.up.model.LoginRsp;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.constant.MISPErrorMessageConst;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.base.MispBaseActivtiy;
import cn.fuego.misp.ui.widget.login.LoginFormView;

public class AppLoginView extends LoginFormView
{
	FuegoLog log = FuegoLog.getLog(AppLoginView.class);
	
    public static final int HOME_PAGE=0;
	public static final int BACK_PAGE=1;	
    private ProgressDialog proDialog;
	private int returnType=HOME_PAGE;

	
	
    public AppLoginView(Activity context,int backType){
    	super(context,  R.id.txt_username, R.id.txt_password,R.id.login_btn);
    	returnType=backType;
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
					AppCache.getInstance().setCustomer(rsp.getCustomer());
					AppCache.getInstance().setUser(rsp.getUser());
					AppCache.setToken(rsp.getToken());
					
					log.info("page after login is:" + returnType);
					if(returnType==HOME_PAGE){
						Intent intent = new Intent(context,MainTabbarActivity.class);
						intent.putExtra(MainTabbarActivity.SELECTED_TAB, MainTabbarInfo.getIndexByClass(HomeFragment.class));
						context.startActivity(intent);	
					}else if(returnType==BACK_PAGE){
						(context).finish();
					}		
				}
				else{
					showErrorMsg(MISPErrorMessageConst.getMessageByErrorCode(message.getErrorCode()));
				}
			}	
		};
		WebServiceContext.getInstance().getUserManageRest(loginHandler).login(req);	
	}

}
