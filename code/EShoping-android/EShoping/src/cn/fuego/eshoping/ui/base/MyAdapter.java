/**   
* @Title: MyAdapter.java 
* @Package cn.fuego.eshoping.ui.base 
* @Description: TODO
* @author Aether
* @date 2014-12-21 下午4:13:23 
* @version V1.0   
*/ 
package cn.fuego.eshoping.ui.base;

import java.util.List;
import java.util.Map;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.constant.ListItemTypeConst;

/** 
 * @ClassName: MyAdapter 
 * @Description:显示不同类型的item
 * @author Aether
 * @date 2014-12-21 下午4:13:23 
 *  
 */
public class MyAdapter extends BaseAdapter
{

	//数据源 
	//private List<HashMap<String,String>> mylist;
	private List<Map<String, Object>> mylist;
	private Context myContext;
	//private int[] myType;
	
	//构造函数
	public MyAdapter(Context context,List<Map<String, Object>> list)
	{
		this.myContext=context;
		this.mylist=list;
		//this.myType=type;
	}
	@Override
	public int getCount()
	{

		return mylist.size();
	}

	@Override
	public Object getItem(int position)
	{

		return mylist.get(position);
	}

	@Override
	public long getItemId(int position)
	{
		
		return position;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent)
	{

		LayoutInflater myInflater = LayoutInflater.from(myContext);
		View view =null;
		String type= mylist.get(position).get("type").toString();
		String title= mylist.get(position).get("title").toString();
		
		if(type.equals(ListItemTypeConst.IMG_CONTENT))
		{
			view = myInflater.inflate(R.layout.list_item_imgtype, null);
			TextView title_view = (TextView) view.findViewById(R.id.item_imgtype_name);
			ImageView img = (ImageView) view.findViewById(R.id.item_imgtype_img);
			title_view.setText(title);
			//String title=mylist.get(position).get("data");
			img.setImageResource(Integer.valueOf(mylist.get(position).get("content").toString()));
			
		}
		if(type.equals(ListItemTypeConst.TEXT_CONTENT))
		{
			view = myInflater.inflate(R.layout.list_item_texttype, null);
			TextView title_view = (TextView) view.findViewById(R.id.item_texttype_name);
			TextView content_view = (TextView) view.findViewById(R.id.item_texttype_text);
			title_view.setText(title);
			content_view.setText(mylist.get(position).get("content").toString());

		}
		if(type.equals(ListItemTypeConst.DEFAULT_CONTENT))
		{
			view = myInflater.inflate(R.layout.list_item_btntype, null);
			TextView title_view = (TextView) view.findViewById(R.id.item_btntype_name);
			title_view.setText(title);

		}
		if(type.equals(ListItemTypeConst.NULL_CONTENT))
		{
			view = myInflater.inflate(R.layout.list_item_divider, null);
			//view.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, 30));
		}
		//根据type不同的数据类型构造不同的View
		return view;
	}

}
