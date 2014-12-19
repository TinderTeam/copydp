package cn.fuego.eshoping.ui.home;

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
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;

public class ProductDataAdapter extends ArrayAdapter<ProductJson>
{
	private LoadImageUtil loadImageUtil = new LoadImageUtil();
 
	private Context context;
     
    public ProductDataAdapter(Context context,List<ProductJson> productList) {
        super(context, R.layout.home_list_item,productList);
        this.context = context;
      
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View view = LayoutInflater.from(context).inflate( R.layout.home_list_item, null);
        ProductJson record = getItem(position);

        TextView titleView = (TextView) view.findViewById(R.id.home_list_item_title);
        titleView.setText(record.getName());
        
        TextView curPrice = (TextView) view.findViewById(R.id.home_list_item_curPrice);
        curPrice.setText(String.valueOf(record.getPrice()));
        TextView oldPrice = (TextView) view.findViewById(R.id.home_list_item_oldPrice);
        oldPrice.setText(String.valueOf(record.getOriginal_price()));

        TextView desp = (TextView) view.findViewById(R.id.home_list_item_desp);
        desp.setText(String.valueOf(record.getDscr()));

        ImageView imageView = (ImageView) view.findViewById(R.id.home_list_item_img);
 
        loadImageUtil.loadImage(imageView, DataConvertUtil.getAbsUrl(record.getImgsrc()), false);
 

        return view;
    }
}

