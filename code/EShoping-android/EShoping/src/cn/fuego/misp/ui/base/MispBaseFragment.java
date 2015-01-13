package cn.fuego.misp.ui.base;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import cn.fuego.eshoping.R;
import cn.fuego.misp.constant.MISPErrorMessageConst;
import cn.fuego.misp.service.http.HttpListener;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.model.FragmentResInfo;

public abstract class MispBaseFragment extends Fragment implements HttpListener 
{ 
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{
		this.initRes();
		View rootView = inflater.inflate(this.fragmentRes.getFragmentView(), null);
		
		//初始化标题
		initFragmentTitle(rootView);
		return rootView;
	}

	private void initFragmentTitle(View rootView)
	{
		TextView title = (TextView) rootView.findViewById(this.fragmentRes.getTitleView());	
		if(title!=null){
			title.setText(this.fragmentRes.getName());
		}
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
	public FragmentResInfo fragmentRes = new FragmentResInfo();
	public abstract void initRes();
}
