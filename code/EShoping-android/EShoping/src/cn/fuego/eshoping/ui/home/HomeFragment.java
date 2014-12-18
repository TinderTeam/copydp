package cn.fuego.eshoping.ui.home;

import java.util.ArrayList;
import java.util.HashMap;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.GridView;
import android.widget.SimpleAdapter;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.FragmentResInfo;
import cn.fuego.eshoping.ui.base.BaseFragment;
import cn.fuego.misp.service.http.MispHttpMessage;

public class HomeFragment extends BaseFragment
{
    //定义数组来存放按钮图片  
    private int mImageViewArray[] = {R.drawable.home_food,R.drawable.home_car,R.drawable.home_photo,R.drawable.home_education,
                                     R.drawable.home_entertainment,R.drawable.home_hotel,R.drawable.home_beauty,R.drawable.home_service};  
          
    //Tab选项卡的文字  
    private int mTextviewArray[] = {R.string.home_food, R.string.home_car,R.string.home_photo,R.string.home_education,
    								R.string.home_entertainment,R.string.home_hotel,R.string.home_beauty,R.string.home_service}; 

	@Override
	public FragmentResInfo getResource()
	{
		resource.setImage(R.drawable.tabbar_home_icon);
		resource.setName(R.string.tabbar_home);
		
		return resource;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{
		 

		  View rootView = inflater.inflate(R.layout.home_fragment, null);
		  MyGridView gridview = (MyGridView) rootView.findViewById(R.id.home_gridview);  

	      //生成动态数组，并且转入数据  
	      ArrayList<HashMap<String, Object>> lstImageItem = new ArrayList<HashMap<String, Object>>();  
	      for(int i=0;i<mImageViewArray.length;i++)  
	      {  
	        HashMap<String, Object> map = new HashMap<String, Object>();  
	        map.put("ItemImage", mImageViewArray[i]);//添加图像资源的ID  
	        map.put("ItemText", getString(mTextviewArray[i]));//按序号做ItemText  
	        lstImageItem.add(map);  
	      }  
	      //生成适配器的ImageItem <====> 动态数组的元素，两者一一对应  
	      SimpleAdapter saImageItems = new SimpleAdapter(this.getActivity(), lstImageItem, R.layout.grid_item, new String[] {"ItemImage","ItemText"},new int[] {R.id.grid_item_img,R.id.grid_item_title});  
	      //添加并且显示  
	      gridview.setAdapter(saImageItems);  
     

		return rootView;
	}

	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub
		
	}
 

}
