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

/**
 * 
* @ClassName: MispListActivity 
* @Description: TODO
* @author Tangjun 
* @edit Nan Bowen
* @date 2015年1月8日 上午9:30:56 
* 
* @param <E>
 */
public abstract class MispListActivity<E> extends MispBaseListActivity<E> implements MispListViewInteface,OnItemClickListener
{
	private FuegoLog log = FuegoLog.getLog(getClass());
	
	//数据列表
	private  List<E> dataList = new ArrayList<E>();
	//适配器
	private MispListAdapter<E> adapter;
	//列表视图资源文件
	protected ListViewResInfo listViewRes = new ListViewResInfo();

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		adapter = new MispListAdapter<E>(this, this,this.listViewRes,this.dataList);
		ListView listView = (ListView) findViewById(this.listViewRes.getListView());
		listView.setAdapter(adapter);
		listView.setOnItemClickListener(this);
		loadSendList();
	}
	

	public abstract void loadSendList();
	
	public void refreshList(List<E> newDataList)
	{
		this.dataList.clear();
		if(!ValidatorUtil.isEmpty(newDataList))
		{
			this.dataList.addAll(newDataList);
		}
		repaint();
	}
	
	public void repaint()
	{
		this.adapter.notifyDataSetChanged();
	}
	
	@Override
	public int getItemViewType(Object item)
	{
		// TODO Auto-generated method stub
		return 0;
	}
	public int getItemTypeCount()
	{
		return 1;
	}
	


	public abstract List<E> loadListRecv(Object obj);
	
	public abstract View getListItemView(View view, E item);

	
	@Override
	public View getView(LayoutInflater inflater,View convertView, ViewGroup parent, Object item)
	{
		View view = inflater.inflate(this.listViewRes.getListItemView(), null);
		return getListItemView(view,(E)item);
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


	/**
	 * @return the dataList
	 */
	public List<E> getDataList()
	{
		return dataList;
	}


	/**
	 * @param dataList the dataList to set
	 */
	public void setDataList(List<E> dataList)
	{
		if(dataList==null){
			dataList = new ArrayList<E>();
		}
		this.dataList = dataList;
	}
}
