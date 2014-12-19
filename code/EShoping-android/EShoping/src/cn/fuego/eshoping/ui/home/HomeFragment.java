package cn.fuego.eshoping.ui.home;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.FragmentResInfo;
import cn.fuego.eshoping.ui.base.BaseFragment;
import cn.fuego.eshoping.webservice.up.model.GetProductListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductListRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.service.http.MispHttpMessage;

public class HomeFragment extends BaseFragment implements OnItemClickListener
{
	private FuegoLog log = FuegoLog.getLog(getClass());
    //定义数组来存放按钮图片  
    private int mImageViewArray[] = {R.drawable.home_food,R.drawable.home_car,R.drawable.home_photo,R.drawable.home_education,
                                     R.drawable.home_entertainment,R.drawable.home_hotel,R.drawable.home_beauty,R.drawable.home_service};  
          
    //Tab选项卡的文字  
    private int mTextviewArray[] = {R.string.home_food, R.string.home_car,R.string.home_photo,R.string.home_education,
    								R.string.home_entertainment,R.string.home_hotel,R.string.home_beauty,R.string.home_service}; 

    
    private ProductDataAdapter productAdapter;
    private List<ProductJson> productList = new ArrayList<ProductJson>();
    

    private static final int GET_CUR_CITY = 1;
    private static final int GET_CITY_LIST = 2;
    private static final int GET_TYPE_LIST = 3;
    private static final int GET_PRODUCT = 4;
    private int cmdcode = 0; 
    
    
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
	      SimpleAdapter saImageItems = new SimpleAdapter(this.getActivity(), lstImageItem, R.layout.home_grid_item, new String[] {"ItemImage","ItemText"},new int[] {R.id.grid_item_img,R.id.grid_item_title});  
	      //添加并且显示  
	      gridview.setAdapter(saImageItems);  
	      ListView  productView = (ListView) rootView .findViewById(R.id.home_latest_list);
	      
	      productAdapter = new ProductDataAdapter(this.getActivity(),this.productList);
	      productView.setAdapter(productAdapter);
	     
	      update();
     

		return rootView;
	}
	
	public void update()
	{
		
		GetProductListReq req = new GetProductListReq();
		req.setCity(MemoryCache.getCurCity());
		this.cmdcode = GET_PRODUCT;
		WebServiceContext.getInstance().getProductManageRest(this).getNewProductList(req);
	}

	
	@Override
	public void handle(MispHttpMessage message)
	{
		if (message.isSuccess())
		{
			switch(cmdcode)
			{
			 case GET_CUR_CITY:
				 break;
			 case GET_PRODUCT:
			 {
					this.productList.clear();

					GetProductListRsp rsp = (GetProductListRsp) message.getMessage().obj;
					if(!ValidatorUtil.isEmpty(rsp.getProductList()))
					{
						this.productList.addAll(rsp.getProductList());
					}

					this.productAdapter.notifyDataSetChanged();
			 }
				 break;
			 default:
				 break;
			
			}

		}
		else
		{
			log.error("query product failed");
			this.showMessage(message);
		}
		
		
	}
	
	@Override
	public void onItemClick(AdapterView<?> parent,View view, int position, long id)
	{
 
		ProductJson product =  this.productAdapter.getItem(position); 
		Intent intent = new Intent(this.getActivity(),ProductActivity.class);

		this.startActivity(intent); 

	}

 

}
