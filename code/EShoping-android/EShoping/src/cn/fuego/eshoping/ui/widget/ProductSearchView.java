package cn.fuego.eshoping.ui.widget;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.widget.SearchView;
import android.widget.SearchView.OnQueryTextListener;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.ui.home.ProductSearchActivity;

/**
 * 产品搜索框组件
* @ClassName: ProductSearchView 
* @Description: TODO
* @author Nan Bowen
* @date 2015年1月22日 上午9:20:15 
*
 */
public class ProductSearchView 
{
	private FuegoLog log = FuegoLog.getLog(getClass());
	SearchView searchView;
	Context context;
	
	public ProductSearchView (Activity activity){
		context = activity;
		searchView=(SearchView) activity.findViewById(R.id.search_view);
		searchView.setOnQueryTextListener(new OnQueryTextListener(){
			@Override
			public boolean onQueryTextSubmit(String query)
			{
				log.info("search button clicked...");
				searchEvent(query);
				return false;
			}
			@Override
			public boolean onQueryTextChange(String newText)
			{
				return false;
			}			
		});
	}
	
	public ProductSearchView(Activity activity, View view)
	{
		context = activity;
		searchView=(SearchView) view.findViewById(R.id.search_view);
		searchView.setOnQueryTextListener(new OnQueryTextListener(){
			@Override
			public boolean onQueryTextSubmit(String query)
			{
				log.info("search button clicked...");
				searchEvent(query);
				return false;
			}
			@Override
			public boolean onQueryTextChange(String newText)
			{
				return false;
			}			
		});
	}
	protected void searchEvent(String query)
	{
		Intent intent = new Intent();
		intent.setClass(context, ProductSearchActivity.class);
		intent.putExtra(SharedPreferenceConst.PRODUCT_FILTER_KEYWORD, query);
		context.startActivity(intent);
	}
}
