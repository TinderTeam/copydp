package cn.fuego.misp.ui.widget.login;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.user.UserFragment;

public abstract class LoginFormView
{
	FuegoLog log = FuegoLog.getLog(LoginFormView.class);
	protected Activity context;
	
	/*
	 * basic component
	 */
    private EditText textName,textPwd;    
	private Button loginBtn;

    
	/*
	 *  fuction component
	 */	
	private TextView verificationMsgView;
	
	public abstract void onCreate();
	public abstract void onLogin(String name,String pwd);

	/*
	 * Constants
	 */
	public static final String VERIFICATION_UNDIFINE="use verification massige before difine view id";
	
	/**
	 * 
	 * @param content
	 * @param nameTextID
	 * @param pswdTextID
	 * @param loginBtnID
	 */
	
	public LoginFormView(Activity content,int nameTextID,int pswdTextID,int loginBtnID){
    	setContext(content);
    	textName = (EditText)context.findViewById(nameTextID);
		textPwd =(EditText)context.findViewById(pswdTextID);
		loginBtn=(Button)context.findViewById(loginBtnID);
		loginBtn.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v)
			{		
				onLogin(textName.getText().toString().trim(),textPwd.getText().toString().trim());
			}	
		});
		onCreate();	
    }

	public void showErrorMsg(String str)
	{
		log.info("show login error msg: "+ str);
		if(verificationMsgView!=null){
			verificationMsgView.setText(str);
		}else{
			throw new RuntimeException(VERIFICATION_UNDIFINE);
		}
	}
	
	public void setVerificationViewID(int id){
		verificationMsgView=(TextView)context.findViewById(id);
	}
	

	/**
	 * @return the context
	 */
	public Context getContext()
	{
		return context;
	}

	/**
	 * @param context the context to set
	 */
	public void setContext(Activity context)
	{
		this.context = context;
	}
}
