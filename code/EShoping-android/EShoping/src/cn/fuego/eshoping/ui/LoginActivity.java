package cn.fuego.eshoping.ui;

import java.security.MessageDigest;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.telephony.TelephonyManager;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.constant.ClientTypeEnum;
import cn.fuego.eshoping.constant.ErrorMessageConst;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.webservice.up.model.LoginReq;
import cn.fuego.eshoping.webservice.up.model.LoginRsp;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.constant.MISPErrorMessageConst;
import cn.fuego.misp.service.MemoryCache;

public class LoginActivity extends Activity
{
	private FuegoLog log = FuegoLog.getLog(getClass());
	private Button loginBtn;
	private EditText textName, textPwd;
	private String userName, password;
	
	private Handler handler = new Handler()
	{

		@Override
		public void handleMessage(Message msg)
		{
			// TODO Auto-generated method stub
			super.handleMessage(msg);
			// LoginRsp rsp =
			// WebServiceContext.getInstance().getUserManageRest(null).login(req);
			LoginRsp rsp = (LoginRsp) msg.obj;
			if (ErrorMessageConst.SUCCESS == rsp.getResult().getErrorCode())
			{
				// 存放个人信息cookie
				SharedPreferences userInfo = getSharedPreferences(SharedPreferenceConst.UESR_INFO, 0);
				userInfo.edit().putString(SharedPreferenceConst.NAME, userName).commit();

				Intent intent = new Intent();
				intent.setClass(LoginActivity.this, MainActivity.class);
				startActivity(intent);
				MemoryCache.setToken(rsp.getToken());
				LoginActivity.this.finish();

			} else
			{
				Toast toast = Toast.makeText(getApplicationContext(),
						MISPErrorMessageConst.getMessageByErrorCode(rsp
								.getResult().getErrorCode()),
						Toast.LENGTH_SHORT);
				toast.show();
			}

		}

	};

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_login);
		textName = (EditText) findViewById(R.id.txt_username);
		textPwd = (EditText) findViewById(R.id.txt_password);
		loginBtn = (Button) findViewById(R.id.login_btn);
		loginBtn.setOnClickListener(loginClick);

	}

	private OnClickListener loginClick = new OnClickListener()
	{

		@Override
		public void onClick(View v)
		{

			checkLogin();

		}

	};

	private void checkLogin()
	{

		userName = textName.getText().toString().trim();
		// password =textPwd.getText().toString();
		password = MD5(textPwd.getText().toString().trim());
		LoginReq req = new LoginReq();
		req.setPassword(password);
		req.setUserName(userName);
		req.setClientType(ClientTypeEnum.ANDRIOD_CLIENT.getStrValue());
		req.setClientVersion(MemoryCache.getVersion());
		req.setDevToken(getDeviceID());

		try
		{
			WebServiceContext.getInstance().getUserManageRest(this.handler).login(req);
 
		}
		catch(Exception e)
		{
			Toast toast = Toast.makeText(getApplicationContext(),e.getMessage(),Toast.LENGTH_SHORT);
			toast.show();
		}

	}

	public String getDeviceID()
	{
		TelephonyManager tm = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
		return tm.getDeviceId();
	}

	// MD5加密，32位
	public static String MD5(String str)
	{
		MessageDigest md5 = null;
		try
		{
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e)
		{
			e.printStackTrace();
			return "";
		}

		char[] charArray = str.toCharArray();
		byte[] byteArray = new byte[charArray.length];

		for (int i = 0; i < charArray.length; i++)
		{
			byteArray[i] = (byte) charArray[i];
		}
		byte[] md5Bytes = md5.digest(byteArray);

		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++)
		{
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16)
			{
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}

}
