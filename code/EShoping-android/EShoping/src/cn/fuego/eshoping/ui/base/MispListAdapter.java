package cn.fuego.eshoping.ui.base;

import java.util.List;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;

public class MispListAdapter<E> extends ArrayAdapter<E>
{

	private MispListFragment context;

	public MispListAdapter(MispListFragment context,List<E> dataList)
	{
        super(context.getActivity(), context.getResource().getListView(),dataList);
	 
		// TODO Auto-generated constructor stub
	}
	
	  @Override
	    public View getView(int position, View convertView, ViewGroup parent) {
	        View view = LayoutInflater.from(context.getActivity()).inflate(context.getResource().getListItemView(), null);
	        E item = getItem(position);

	        view = context.getListItemView(view,item);
 
	        return view;
	    }

}
