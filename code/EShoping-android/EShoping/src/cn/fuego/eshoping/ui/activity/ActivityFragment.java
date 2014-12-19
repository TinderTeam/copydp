package cn.fuego.eshoping.ui.activity;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.FragmentResInfo;
import cn.fuego.eshoping.ui.base.BaseFragment;
import cn.fuego.misp.service.http.MispHttpMessage;

public class ActivityFragment extends BaseFragment
{

	
	@Override
	public FragmentResInfo getResource()
	{
		resource.setImage(R.drawable.tabbar_activity_icon);
		resource.setName(R.string.tabbar_activity);
		
		return resource;
	}



	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{
		// TODO Auto-generated method stub
		View rootView = inflater.inflate(R.layout.activity_fragment, null);
		
		return rootView;
	}



	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub
		
	}

}
