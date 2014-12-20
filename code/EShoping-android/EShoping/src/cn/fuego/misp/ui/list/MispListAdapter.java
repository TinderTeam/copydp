package cn.fuego.misp.ui.list;

import java.util.List;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;

public class MispListAdapter<E> extends ArrayAdapter<E>
{

	private MispBaseListFragment context;
	private ListViewResInfo resInfo;

	public MispListAdapter(MispBaseListFragment context,ListViewResInfo resInfo,List<E> dataList)
	{
		
        super(context.getActivity(), resInfo.getListView(),dataList);
	    this.context = context;
	    this.resInfo = resInfo;
		// TODO Auto-generated constructor stub
	}
	
	  @Override
	    public View getView(int position, View convertView, ViewGroup parent) {
	        View view = LayoutInflater.from(context.getActivity()).inflate(resInfo.getListItemView(), null);
	        E item = getItem(position);

	        view = context.getListItemView(view,item);
 
	        return view;
	    }

}
