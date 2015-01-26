package cn.fuego.eshoping.ui.user;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.model.KeyValuePair;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.ui.LoginActivity;
import cn.fuego.eshoping.ui.MainTabbarActivity;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.ui.list.MispListActivity;

public class UserInfoActivity extends MispListActivity<KeyValuePair<String>>
{
	
	FuegoLog log = FuegoLog.getLog(UserInfoActivity.class);
	
	List<KeyValuePair<String>> infoList;	//User info 
	
	@Override
	public void initRes()
	{	
		InitializationData();
		
		//Basic
		this.activityRes.setAvtivityView(R.layout.user_info);
		this.activityRes.setBackBtn(R.id.com_back_btn);
		this.activityRes.setTitleTextView(R.id.com_head_title);
		this.activityRes.setName(getString(R.string.page_user_info));	
		//List
		this.setDataList(infoList);		
		this.listViewRes.setListItemView(R.layout.list_item_texttype);
		this.listViewRes.setListView(R.id.user_info_list);	
	}

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		//初始化数据
		super.onCreate(savedInstanceState);
		Button registBtn = (Button) this.findViewById(R.id.com_next_btn);
		registBtn.setText("修改密码");
		registBtn.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v)
			{		
				log.info("regist button clicked...");
				toResetPwd();
			}
		});
		
	}
	


	//初始化数据
	private void InitializationData()
	{
		/* 这里的KeyValuePair就是一个简单的二元项（一个类里面包含两个值），因为这里的列表项
		 * 处理是做了抽象，本来应该是建立一个类对它进行处理来表示这里的一个Item有两个动态属性(一个标签一个值)，
		 * 这里就做一个抽象的模型KeyValuePair来表示这个好了
		 * 其中Key表示Label值，比如，手机、积分等等、Value代表它的值
		 */
		infoList = new ArrayList<KeyValuePair<String>>();
		infoList.add(new KeyValuePair<String>("用户名",AppCache.getInstance().getUser().getUsername()));
		infoList.add(new KeyValuePair<String>("积分",AppCache.getInstance().getCustomer().getScore()+"分"));
		infoList.add(new KeyValuePair<String>("手机号",AppCache.getInstance().getCustomer().getCellphone()));
		infoList.add(new KeyValuePair<String>("邮箱",AppCache.getInstance().getCustomer().getEmail()));
	}

	@Override
	public void loadSendList()
	{		
		
	}

	@Override
	public List<KeyValuePair<String>> loadListRecv(Object obj)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public View getListItemView(View view, KeyValuePair<String> item)
	{		
		TextView  title= (TextView) view.findViewById(R.id.item_texttype_name);
		title.setText(item.getKey());
		TextView  value= (TextView) view.findViewById(R.id.item_texttype_text);
		value.setText(item.getValue());
		return view;
	}
 

	public void logoutBtnEvent(View v){
		log.info("user logout...");
		AppCache.getInstance().cleanToken();
		AppCache.getInstance().cleanUser();
		//转至主页面
		Intent intent = new Intent();
		intent.setClass(this,MainTabbarActivity.class);
		startActivity(intent);
	}
	
	protected void toResetPwd()
	{
		log.info("reset pwd button clicked");
		//转至主页面
		Intent intent = new Intent();
		intent.setClass(this,ResetPwdActivity.class);
		startActivity(intent);
	}

}
