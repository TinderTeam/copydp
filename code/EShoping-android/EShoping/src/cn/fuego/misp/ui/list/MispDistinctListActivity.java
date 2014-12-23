package cn.fuego.misp.ui.list;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.Button;
import android.widget.ListView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.base.CommonItemMeta;
import cn.fuego.eshoping.ui.base.MyAdapter;
import cn.fuego.misp.service.http.MispHttpMessage;

public abstract class MispDistinctListActivity<E> extends MispBaseListActivity<E> implements
     MispListViewInteface,OnItemClickListener
{
	private FuegoLog log = FuegoLog.getLog(getClass());

 

	protected List<E> dataList = new ArrayList<E>();

	private MispListAdapter<E> adapter;

	protected ListViewResInfo listViewRes = new ListViewResInfo();

 
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		this.initRes();
 
		
		setContentView(this.activityRes.getAvtivityView());
		
		adapter = new MispListAdapter<E>(this,this,this.listViewRes,this.dataList);
		ListView productView = (ListView) findViewById(this.listViewRes.getListView());
;
		productView.setAdapter(adapter);
		productView.setOnItemClickListener(this);
		loadSendList();

	}
	

	public abstract void loadSendList();



	public abstract List<E> loadListRecv(Object obj);
	
	public abstract View getListItemView(LayoutInflater inflater,E item);
	

	@Override
	public int getItemViewType(Object item)
	{
		return getListItemType((CommonItemMeta)item);
	}
	
 
	public abstract int getListItemType(CommonItemMeta item);
	@Override
	public View getView(LayoutInflater inflater,View convertView, ViewGroup parent, Object item)
	{
 
		return getListItemView(inflater,(E)item);
	}
 

	@Override
	public void handle(MispHttpMessage message)
	{
		if (message.isSuccess())
		{
			this.dataList.clear();

			List<E> newData = loadListRecv(message.getMessage().obj);
			if (!ValidatorUtil.isEmpty(newData))
			{
				this.dataList.addAll(newData);
			}

			this.adapter.notifyDataSetChanged();

		} else
		{
			log.error("query product failed");
			this.showMessage(message);
		}
	}

	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position,
			long id)
	{

		E item = this.adapter.getItem(position);
		Intent intent = new Intent(this,this.listViewRes.getClickActivityClass());
		intent.putExtra(ListViewResInfo.SELECT_ITEM, (Serializable) item);

		this.startActivity(intent);

	}
}
