package cn.fuego.eshoping.ui.news;

import java.util.List;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.util.DataConvertUtil;
import cn.fuego.eshoping.ui.util.LoadImageUtil;
import cn.fuego.eshoping.webservice.up.model.base.NewsJson;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;

public class NewsDataAdapter extends ArrayAdapter<NewsJson>
{
	private LoadImageUtil loadImageUtil = new LoadImageUtil();
 
	private Context context;
     
    public NewsDataAdapter(Context context,List<NewsJson> productList) {
        super(context, R.layout.home_list_item,productList);
        this.context = context;
      
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View view = LayoutInflater.from(context).inflate( R.layout.home_list_item, null);
        NewsJson record = getItem(position);

        TextView titleView = (TextView) view.findViewById(R.id.home_list_item_title);
        titleView.setText(record.getTitle());
 
        return view;
    }
}

