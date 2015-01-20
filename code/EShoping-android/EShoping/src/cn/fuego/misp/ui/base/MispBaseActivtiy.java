package cn.fuego.misp.ui.base;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import android.widget.Toast;
import cn.fuego.misp.constant.MISPErrorMessageConst;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.model.ActivityResInfo;

public abstract class MispBaseActivtiy extends Activity 
{
	public void backOnClick()
	{
		this.finish();
	}
	
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		initRes();
		// TODO Auto-generated method stub
 		super.onCreate(savedInstanceState);
		setContentView(activityRes.getAvtivityView());
		
		//setup back button
		initBackButton();
		//setup title
		initTitle();	
		
	}

	private void initTitle()
	{
		TextView title =(TextView) findViewById(activityRes.getTitleTextView());
		if(null != title)
		{
			title.setText(activityRes.getName());
		}
	}
	
	private void initBackButton()
	{
		View button = findViewById(activityRes.getBackBtn());
		if(null != button)
		{
			 
			OnClickListener l = new OnClickListener()
			{
				
				@Override
				public void onClick(View v)
				{
					backOnClick();
				}
			};
			button.setOnClickListener(l);
		}
	}

	public ActivityResInfo activityRes = new ActivityResInfo();

	public abstract void initRes();
	public void showMessage(MispHttpMessage message)
	{
		showMessage(message.getErrorCode());	
	}
	
	public void showMessage(int errorCode)
	{
		showMessage(MISPErrorMessageConst.getMessageByErrorCode(errorCode));
	}
	
	public void showMessage(String message)
	{
		Toast toast;
		toast = Toast.makeText(getApplicationContext(), message , Toast.LENGTH_LONG);
		toast.show();
	}
	

}
