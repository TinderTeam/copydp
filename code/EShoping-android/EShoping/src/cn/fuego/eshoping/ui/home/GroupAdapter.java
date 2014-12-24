/**   
* @Title: GroupAdapter.java 
* @Package cn.fuego.eshoping.ui.home 
* @Description: TODO
* @author Aether
* @date 2014-12-23 下午9:22:17 
* @version V1.0   
*/ 
package cn.fuego.eshoping.ui.home;

import java.util.List;

import android.content.Context;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import cn.fuego.eshoping.R;

/** 
 * @ClassName: GroupAdapter 
 * @Description: TODO
 * @author Aether
 * @date 2014-12-23 下午9:22:17 
 *  
 */
public class GroupAdapter extends BaseAdapter
{
	  private Context context;  
	  
	    private List<String> list;  
	  
	    public GroupAdapter(Context context, List<String> list) {  
	  
	        this.context = context;  
	        this.list = list;  
	  
	    }  
	  
	    @Override  
	    public int getCount() {  
	        return list.size();  
	    }  
	  
	    @Override  
	    public Object getItem(int position) {  
	  
	        return list.get(position);  
	    }  
	  
	    @Override  
	    public long getItemId(int position) {  
	        return position;  
	    }  
	  
	    @Override  
	    public View getView(int position, View convertView, ViewGroup viewGroup) {  
	  
	          
	        ViewHolder holder;  
	        if (convertView==null) {  
	            convertView=LayoutInflater.from(context).inflate(R.layout.search_condition_item, null);  
	            holder=new ViewHolder();  
	              
	            convertView.setTag(holder);  
	              
	            holder.groupItem=(TextView) convertView.findViewById(R.id.search_item_text);  
	              
	        }  
	        else{  
	            holder=(ViewHolder) convertView.getTag();  
	        }  
	        holder.groupItem.setTextColor(Color.BLACK);  
	        holder.groupItem.setText(list.get(position));  
	          
	        return convertView;  
	    }  
	  
	    static class ViewHolder {  
	        TextView groupItem;  
	    }  
}
