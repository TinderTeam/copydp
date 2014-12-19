package cn.fuego.eshoping.ui.home;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ImageView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.FragmentResInfo;
import cn.fuego.eshoping.ui.util.DataConvertUtil;
import cn.fuego.eshoping.ui.util.LoadImageUtil;
import cn.fuego.eshoping.webservice.up.model.GetProductListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductListRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.ui.list.MispListFragment;

public class HomeFragment extends MispListFragment<ProductJson> implements OnItemClickListener
{
	private FuegoLog log = FuegoLog.getLog(getClass());
    //定义数组来存放按钮图片  
    private int mImageViewArray[] = {R.drawable.home_food,R.drawable.home_car,R.drawable.home_photo,R.drawable.home_education,
                                     R.drawable.home_entertainment,R.drawable.home_hotel,R.drawable.home_beauty,R.drawable.home_service};  
          
    //Tab选项卡的文字  
    private int mTextviewArray[] = {R.string.home_food, R.string.home_car,R.string.home_photo,R.string.home_education,
    								R.string.home_entertainment,R.string.home_hotel,R.string.home_beauty,R.string.home_service}; 
 
    private static final int GET_CUR_CITY = 1;
    private static final int GET_CITY_LIST = 2;
    private static final int GET_TYPE_LIST = 3;
    private static final int GET_PRODUCT = 4;
    private int cmdcode = 0; 
    
    
	private LoadImageUtil loadImageUtil = new LoadImageUtil();

    
	@Override
	public FragmentResInfo getResource()
	{
		FragmentResInfo resource = new FragmentResInfo();

		resource.setImage(R.drawable.tabbar_home_icon);
		resource.setName(R.string.tabbar_home);
		resource.setFragmentView(R.layout.home_fragment);
		resource.setListView(R.id.home_latest_list);
		resource.setListItemView(R.layout.home_list_item);
		resource.setClickActivityClass(HomeProductActivity.class);
		
		return resource;
	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{
		 
		 

		  View rootView = super.onCreateView(inflater, container, savedInstanceState);
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
	      SimpleAdapter saImageItems = new SimpleAdapter(this.getActivity(), lstImageItem, R.layout.home_grid_item, new String[] {"ItemImage","ItemText"},new int[] {R.id.grid_item_img,R.id.grid_item_title});  
	      //添加并且显示  
	      gridview.setAdapter(saImageItems);  
 
 
     

		return rootView;
	}

	@Override
	public void loadSendList()
	{
		
		GetProductListReq req = new GetProductListReq();
		req.setCity(MemoryCache.getCurCity());
		this.cmdcode = GET_PRODUCT;
		WebServiceContext.getInstance().getProductManageRest(this).getNewProductList(req);
	}
	
	@Override
	public List<ProductJson> loadListRecv(Object obj)
	{
		GetProductListRsp rsp = (GetProductListRsp) obj;
		return rsp.getProductList();
	}

	@Override
	public View getListItemView(View view, ProductJson item)
	{
	    TextView titleView = (TextView) view.findViewById(R.id.home_list_item_title);
        titleView.setText(item.getName());
        
        TextView curPrice = (TextView) view.findViewById(R.id.home_list_item_curPrice);
        curPrice.setText(String.valueOf(item.getPrice()));
        TextView oldPrice = (TextView) view.findViewById(R.id.home_list_item_oldPrice);
        oldPrice.setText(String.valueOf(item.getOriginal_price()));

        TextView desp = (TextView) view.findViewById(R.id.home_list_item_desp);
        desp.setText(String.valueOf(item.getDscr()));

        ImageView imageView = (ImageView) view.findViewById(R.id.home_list_item_img);
 
        loadImageUtil.loadImage(imageView, DataConvertUtil.getAbsUrl(item.getImgsrc()), false);
        return view;
	}



 

}
