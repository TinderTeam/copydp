package cn.fuego.eshoping.ui.user;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.FragmentResInfo;
import cn.fuego.eshoping.ui.base.BaseFragment;
import cn.fuego.misp.service.http.MispHttpMessage;

public class UserFragment extends BaseFragment
{

	
	@Override
	public FragmentResInfo getResource()
	{
		FragmentResInfo resource = new FragmentResInfo();

		resource.setImage(R.drawable.tabbar_user_icon);
		resource.setName(R.string.tabbar_user);
		
		return resource;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{
		View rootView = inflater.inflate(R.layout.user_fragment, null);
		
		return rootView;
	}

	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub
		
	}

}
