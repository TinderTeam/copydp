package cn.fuego.eshoping.ui.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ListView;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.constant.ListItemTypeConst;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.ui.base.MyAdapter;
import cn.fuego.misp.service.http.MispHttpMessage;

public class UserInfoActivity extends BaseActivtiy implements OnClickListener
{


    
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.user_info);
		ListView user_info_list = (ListView) findViewById(R.id.user_info_list);
		//ArrayList<HashMap<String,Object>> datasource = new ArrayList<HashMap<String,Object>>();
		//String[] data={"昵称","user1",};
		MyAdapter userInfoAdapter = new MyAdapter(this, getBtnData());
		user_info_list.setAdapter(userInfoAdapter);
		
		Button back_btn=(Button)findViewById(R.id.user_info_back);
		back_btn.setOnClickListener(this);
		back_btn.setTag(1);
	}

	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub
		
	}
	private List<Map<String, Object>> getBtnData()
	{
		// 生成数据源
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		// 每个Map结构为一条数据，key与Adapter中定义的String数组中定义的一一对应。
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("title", "头像");
		map1.put("content", R.drawable.default_head);
		map1.put("type", ListItemTypeConst.IMG_CONTENT);
		list.add(map1);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("title", "昵称");
		map2.put("content", "user11");
		map2.put("type", ListItemTypeConst.TEXT_CONTENT);
		list.add(map2);
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("title", "积分");
		map3.put("content", "6分");
		map3.put("type", ListItemTypeConst.TEXT_CONTENT);
		list.add(map3);
		//分割区域
		Map<String, Object> map4 = new HashMap<String, Object>();
		map4.put("title", "");
		map4.put("content", "");
		map4.put("type", ListItemTypeConst.NULL_CONTENT);
		list.add(map4);	
		
		Map<String, Object> map5 = new HashMap<String, Object>();
		map5.put("title", "手机号");
		map5.put("content", "18620783355");
		map5.put("type", ListItemTypeConst.TEXT_CONTENT);
		list.add(map5);
		Map<String, Object> map6 = new HashMap<String, Object>();
		map6.put("title", "邮箱");
		map6.put("content", "test@163.com");
		map6.put("type", ListItemTypeConst.TEXT_CONTENT);
		list.add(map6);
		Map<String, Object> map7 = new HashMap<String, Object>();
		map7.put("title", "修改密码");
		map7.put("content", "");
		map7.put("type", ListItemTypeConst.DEFAULT_CONTENT);
		list.add(map7);

		return list;
	}

	@Override
	public void onClick(View v)
	{
		int tag = (Integer) v.getTag();
		switch(tag)
		{
		case 1: 
			this.finish();
				break;

		default:break;
		}
		
	}
}
