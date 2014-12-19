package cn.fuego.eshoping.ui.base;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;

import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.FragmentResInfo;
import cn.fuego.eshoping.ui.home.HomeProductActivity;
import cn.fuego.eshoping.ui.home.MyGridView;
import cn.fuego.eshoping.ui.home.ProductDataAdapter;
import cn.fuego.eshoping.ui.util.DataConvertUtil;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.misp.ui.base.MispHttpFragment;

public abstract class MispListFragment<E> extends BaseFragment implements OnItemClickListener
{
	protected FragmentResInfo resource = new FragmentResInfo();

	protected List<E> dataList = new ArrayList<E>();
	
	protected MispListAdapter<E> adapter; 
	
	public FragmentResInfo getResource()
	{
		return resource;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{
		 

		View rootView = inflater.inflate(R.layout.home_fragment, null);
  
	    ListView  productView = (ListView) rootView .findViewById(R.id.home_latest_list);
	      
	    adapter = new MispListAdapter<E>(this,this.dataList);
	    productView.setAdapter(adapter);
	    productView.setOnItemClickListener(this);
	    loadList();
	    
 		return rootView;
		
	}
	
	public abstract void loadList();
	public abstract View getListItemView(View view,E item);
	
	@Override
	public void onItemClick(AdapterView<?> parent,View view, int position, long id)
	{
 
		E item =  this.adapter.getItem(position); 
		Intent intent = new Intent(this.getActivity(),resource.getClass());
		intent.putExtra("product", (Serializable)item);

		this.startActivity(intent); 

	}
}
