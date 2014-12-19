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
import cn.fuego.eshoping.ui.FragmentResInfo;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.base.MispHttpFragment;

public abstract class MispListFragment<E> extends MispHttpFragment implements
		OnItemClickListener
{
	private FuegoLog log = FuegoLog.getLog(getClass());

	public static final String SELECT_ITEM = "SELECT_ITEM";
 

	protected List<E> dataList = new ArrayList<E>();

	protected MispListAdapter<E> adapter;



	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{

		View rootView = inflater.inflate(getResource().getFragmentView(), null);

		ListView productView = (ListView) rootView.findViewById(getResource()
				.getListView());

		adapter = new MispListAdapter<E>(this, this.dataList);
		productView.setAdapter(adapter);
		productView.setOnItemClickListener(this);
		loadSendList();

		return rootView;

	}

	public abstract void loadSendList();

	public abstract View getListItemView(View view, E item);

	public abstract List<E> loadListRecv(Object obj);

	@Override
	public void handle(MispHttpMessage message)
	{
		if (message.isSuccess())
		{
			this.dataList.clear();

			List<E> newData = loadListRecv(message.getMessage().obj);
			if (!ValidatorUtil.isEmpty(newData))
			{
				this.adapter.addAll(newData);
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
		Intent intent = new Intent(this.getActivity(), getResource().getClickActivityClass());
		intent.putExtra(SELECT_ITEM, (Serializable) item);

		this.startActivity(intent);

	}
}
