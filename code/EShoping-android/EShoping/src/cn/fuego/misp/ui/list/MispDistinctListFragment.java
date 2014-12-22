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
import android.widget.ListView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.misp.service.http.MispHttpMessage;

public abstract class MispDistinctListFragment<E> extends MispBaseListFragment<E> implements
     MispListViewInteface,OnItemClickListener
{
	private FuegoLog log = FuegoLog.getLog(getClass());

 

	protected List<E> dataList = new ArrayList<E>();

	private MispListAdapter<E> adapter;

	protected ListViewResInfo listViewRes = new ListViewResInfo();

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{

		this.initRes();
		View rootView = inflater.inflate(this.fragmentRes.getFragmentView(), null);

		ListView listView = (ListView) rootView.findViewById(this.listViewRes.getListView());

		adapter = new MispListAdapter<E>(this.getActivity(), this,this.listViewRes,this.dataList);
		listView.setAdapter(adapter);
		listView.setOnItemClickListener(this);
		loadSendList();

		return rootView;

	}
 
	

	public abstract void loadSendList();



	public abstract List<E> loadListRecv(Object obj);
	
	public abstract View getListItemView(LayoutInflater inflater,E item);
	@Override
	public View getView(LayoutInflater inflater, Object item)
	{
 
		return getListItemView(inflater,(E)item);
	}
	
	public void update(List<E> newList)
	{
		this.dataList.clear();
		if(!ValidatorUtil.isEmpty(newList))
		{
			dataList.addAll(newList);
		}
		this.adapter.notifyDataSetChanged();
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

	public void onItemClick(E item)
	{

		Intent intent = new Intent(this.getActivity(),this.listViewRes.getClickActivityClass());
		intent.putExtra(ListViewResInfo.SELECT_ITEM, (Serializable) item);

		this.startActivity(intent);
	}
	@Override
	final public void onItemClick(AdapterView<?> parent, View view, int position,
			long id)
	{
		E item = this.adapter.getItem(position);
		onItemClick(item);
	}
}
