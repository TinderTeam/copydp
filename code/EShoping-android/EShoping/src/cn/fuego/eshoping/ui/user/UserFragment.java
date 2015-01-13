package cn.fuego.eshoping.ui.user;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.ui.MainTabbarActivity;
import cn.fuego.eshoping.ui.base.BaseFragment;
import cn.fuego.eshoping.webservice.up.model.GetSellerRsp;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.model.FragmentResInfo;

public class UserFragment extends BaseFragment implements OnClickListener
{
	FuegoLog log = FuegoLog.getLog(UserFragment.class);
	
	TextView userName;
	TextView userPlace;
	
	View userInfoBtn;
	Button myOrderBtn;
	Button myActivityBtn;
	Button sysConfigBtn;
	
	@Override
	public void initRes()
	{
		this.fragmentRes.setImage(R.drawable.tabbar_user_icon);
		this.fragmentRes.setName(R.string.tabbar_user);
		this.fragmentRes.setFragmentView(R.layout.user_fragment);
 	}
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{
		View rootView  = super.onCreateView(inflater, container, savedInstanceState);
		//初始化组件
		InitializationComponent(rootView);
		//组件加载数据
		ComponentUpdateData();
		return rootView;
	}
	
	private void InitializationComponent(View rootView)
	{
		userInfoBtn = rootView.findViewById(R.id.user_info_btn);		
		myOrderBtn = (Button) rootView.findViewById(R.id.user_btn_order);
		myActivityBtn = (Button) rootView.findViewById(R.id.user_btn_activity);
		sysConfigBtn = (Button) rootView.findViewById(R.id.user_btn_setting);
		userName= (TextView) rootView.findViewById(R.id.user_username);
		userPlace= (TextView) rootView.findViewById(R.id.user_place);
	}

	
	private void ComponentUpdateData()
	{
		userName.setText(AppCache.getUser().getUsername());
		userPlace.setText(AppCache.getCurCity());
		
		userInfoBtn.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v){
				nextActivity(UserInfoActivity.class);
			}	
		});
		myOrderBtn.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v){
				nextActivity(UserOrderListActivity.class);
			}	
		});
		
		myActivityBtn.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v){
				nextActivity(UserActivityListActivity.class);
			}	
		});
		
		sysConfigBtn.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v){
				nextActivity(SystemConfigActivity.class);
			}	
		});
	}
	
	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onClick(View v)
	{
		Intent i = new Intent();
		i.setClass(this.getActivity(), UserInfoActivity.class);
       
        this.startActivity(i);
	}

	//跳转
	public void nextActivity(Class clazz){
		log.info("next activity:"+clazz.toString());
		Intent intent = new Intent();
		intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP );
		intent.setClass(this.getActivity(), clazz);
		this.startActivity(intent);
	}

}
