package cn.fuego.eshoping.ui.user;

import java.util.ArrayList;
import java.util.List;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.constant.ListItemTypeConst;
import cn.fuego.eshoping.ui.base.CommonItemMeta;
import cn.fuego.misp.ui.list.MispDistinctListActivity;

public class UserInfoActivity extends MispDistinctListActivity<CommonItemMeta> implements OnClickListener
{


	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.user_info);
		this.listViewRes.setListView(R.id.user_info_list);
		this.dataList.clear();
		this.dataList.addAll(getBtnData());

	}
	
	@Override
	public void loadSendList()
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CommonItemMeta> loadListRecv(Object obj)
	{
		// TODO Auto-generated method stub
		return null;
	}

 
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		
		Button back_btn=(Button)findViewById(R.id.user_info_back);
		back_btn.setOnClickListener(this);
		back_btn.setTag(1);
	}

	
	private List<CommonItemMeta> getBtnData()
	{
		// 生成数据源
		List<CommonItemMeta> list = new ArrayList<CommonItemMeta>();
		// 每个Map结构为一条数据，key与Adapter中定义的String数组中定义的一一对应。
		CommonItemMeta meta1 = new CommonItemMeta();
		meta1.setTitle("头像");
		meta1.setType(ListItemTypeConst.IMG_CONTENT);
 		list.add(meta1);
		
		CommonItemMeta meta2 = new CommonItemMeta();
		meta2.setTitle("昵称");
		meta2.setType(ListItemTypeConst.TEXT_CONTENT);
		meta2.setContent("user11");
		list.add(meta2);
		
		CommonItemMeta meta3 = new CommonItemMeta();
		meta3.setTitle("积分");
		meta3.setType(ListItemTypeConst.TEXT_CONTENT);
		meta3.setContent("6分");
		list.add(meta3);
		
		
		
		CommonItemMeta meta4 = new CommonItemMeta();
 
		meta4.setType(ListItemTypeConst.NULL_CONTENT);
		list.add(meta4);
		
		CommonItemMeta meta5 = new CommonItemMeta();

		meta5.setTitle("手机号");
		meta5.setType(ListItemTypeConst.TEXT_CONTENT);
		meta5.setContent("18620783355");
		list.add(meta5);
		
		
		CommonItemMeta meta6 = new CommonItemMeta();

		meta6.setTitle("邮箱");
		meta6.setType(ListItemTypeConst.TEXT_CONTENT);
		meta6.setContent("test@163.com");
		
		list.add(meta6);
		
		CommonItemMeta meta7 = new CommonItemMeta();
		meta7.setTitle("修改密码");
		meta7.setType(ListItemTypeConst.DEFAULT_CONTENT);
		list.add(meta7);
		
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

	@Override
	public View getListItemView(LayoutInflater inflater, CommonItemMeta item)
	{
 		View view =null;
		String type= item.getType();
		String title= item.getTitle();
		
		if(type.equals(ListItemTypeConst.IMG_CONTENT))
		{
			view = inflater.inflate(R.layout.list_item_imgtype, null);
			TextView title_view = (TextView) view.findViewById(R.id.item_imgtype_name);
			ImageView img = (ImageView) view.findViewById(R.id.item_imgtype_img);
			title_view.setText(title);
			//String title=mylist.get(position).get("data");
			//img.setImageResource((Integer) item.getContent());
			
		}
		if(type.equals(ListItemTypeConst.TEXT_CONTENT))
		{
			view = inflater.inflate(R.layout.list_item_texttype, null);
			TextView title_view = (TextView) view.findViewById(R.id.item_texttype_name);
			TextView content_view = (TextView) view.findViewById(R.id.item_texttype_text);
			title_view.setText(title);
			content_view.setText( (String) item.getContent());

		}
		if(type.equals(ListItemTypeConst.DEFAULT_CONTENT))
		{
			view = inflater.inflate(R.layout.list_item_btntype, null);
			TextView title_view = (TextView) view.findViewById(R.id.item_btntype_name);
			title_view.setText(title);

		}
		if(type.equals(ListItemTypeConst.NULL_CONTENT))
		{
			view = inflater.inflate(R.layout.list_item_divider, null);
			//view.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, 30));
		}
		//根据type不同的数据类型构造不同的View
		return view;
	}
 


}
