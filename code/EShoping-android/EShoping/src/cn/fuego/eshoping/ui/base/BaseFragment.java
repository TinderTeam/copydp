package cn.fuego.eshoping.ui.base;

import android.widget.Toast;
import cn.fuego.eshoping.ui.FragmentResInfo;
import cn.fuego.misp.constant.MISPErrorMessageConst;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.base.MispHttpFragment;

public abstract class BaseFragment extends MispHttpFragment  
{ 
	protected FragmentResInfo resource = new FragmentResInfo();
	
	
	public FragmentResInfo getResource()
	{
		return resource;
	}
	public void showMessage(int errorCode)
	{
		showMessage(MISPErrorMessageConst.getMessageByErrorCode(errorCode));
	}
	public void showMessage(String message)
	{
		Toast toast;
		toast = Toast.makeText(this.getActivity(), message , Toast.LENGTH_LONG);
		toast.show();
	}
	public void showMessage(MispHttpMessage message)
	{
		showMessage(message.getErrorCode());	
	}
}
