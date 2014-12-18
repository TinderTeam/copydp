package cn.fuego.eshoping.ui.home;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RadioGroup;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.FragmentResInfo;
import cn.fuego.eshoping.ui.base.BaseFragment;
import cn.fuego.misp.service.http.MispHttpMessage;

public class HomeFragment extends BaseFragment
{
 
	@Override
	public FragmentResInfo getResource()
	{
		resource.setImage(R.drawable.tabbar_home_icon);
		resource.setName(R.string.tabbar_home);
		
		return resource;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{
		 
		 
		View rootView = inflater.inflate(R.layout.home_fragment, null);
 
	 
        

		return rootView;
	}

	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub
		
	}
 

}
