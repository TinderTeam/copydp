package cn.fuego.eshoping.ui.home;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.MemoryCache;
import cn.fuego.eshoping.cache.ProductTypeCache;
import cn.fuego.eshoping.ui.base.CommonItemMeta;
import cn.fuego.eshoping.ui.util.DataConvertUtil;
import cn.fuego.eshoping.ui.util.LoadImageUtil;
import cn.fuego.eshoping.webservice.up.model.GetProductListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductListRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.model.base.ProductTypeJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.ui.list.ListViewResInfo;
import cn.fuego.misp.ui.list.MispDistinctListFragment;

public class HomeFragment extends MispDistinctListFragment<CommonItemMeta> implements OnItemClickListener,OnCheckedChangeListener
{
	private FuegoLog log = FuegoLog.getLog(getClass());
    //定义数组来存放按钮图片  
    private int mImageViewArray[] = {R.drawable.home_food,R.drawable.home_car,R.drawable.home_photo,R.drawable.home_education,
                                     R.drawable.home_entertainment,R.drawable.home_hotel,R.drawable.home_beauty,R.drawable.home_service};  
          
    //Tab选项卡的文字  
    private int mTextviewArray[] = {R.string.home_food, R.string.home_car,R.string.home_photo,R.string.home_education,
    								R.string.home_entertainment,R.string.home_hotel,R.string.home_beauty,R.string.home_service}; 
 
    private static final String ITEM_TYPE_GRID = "grid"; 
    
    private static final String ITEM_TYPE_TAB = "tab"; 
    private static final String ITEM_TYPE_PRODUCT_TYPE = "type"; 

    private static final String ITEM_TYPE_PRODUCT = "product"; 
    
    private int tabID = 0;

 
    
	private LoadImageUtil loadImageUtil = LoadImageUtil.getInstance();
	
	private View homeGridView;
	private View homeTabView;
	
	private List<CommonItemMeta> newProductData;
	private List<CommonItemMeta> typeProductData;
	private List<CommonItemMeta> allProductData;


	@Override
	public void initRes()
	{ 
		this.fragmentRes.setImage(R.drawable.tabbar_home_icon);
		this.fragmentRes.setName(R.string.tabbar_home);
		this.fragmentRes.setFragmentView(R.layout.home_fragment);
 
		listViewRes.setListView(R.id.home_main_list);
		//listViewRes.setListItemView(R.layout.home_list_item);
		listViewRes.setClickActivityClass(HomeProductActivity.class);
 
 	}
 
	 


	@Override
	public void loadSendList()
	{
		
		GetProductListReq req = new GetProductListReq();
		req.setCity(MemoryCache.getCurCity());
 
		switch(tabID)
		{
		case 0:
			WebServiceContext.getInstance().getProductManageRest(this).getNewProductList(req);
			break;
			
		case 1:
			WebServiceContext.getInstance().getProductManageRest(this).getTypeRecProductList(req);
			break;
		case 2:
			WebServiceContext.getInstance().getProductManageRest(this).getAllProductList(req);
			break;
		default:
			break;
		}
	}
	
	@Override
	public List<CommonItemMeta> loadListRecv(Object obj)
	{
		GetProductListRsp rsp = (GetProductListRsp) obj;
		
		List<CommonItemMeta> itemList = new ArrayList<CommonItemMeta>();
		
		CommonItemMeta gridItem = new CommonItemMeta();
		gridItem.setType(ITEM_TYPE_GRID);
		gridItem.setContent(gridInitData());
		itemList.add(gridItem);
		
		CommonItemMeta tabItem = new CommonItemMeta();
		tabItem.setType(ITEM_TYPE_TAB);
		itemList.add(tabItem); 
		if(tabID == 1)
		{
			Map<Integer,List<ProductJson>> productGroup = divideGroup(rsp.getProductList());
			
			for(Integer typeID : productGroup.keySet())
			{
				
				List<ProductJson> productList = productGroup.get(typeID);
				if(!ValidatorUtil.isEmpty(productList))
				{
					CommonItemMeta groupItem = new CommonItemMeta();
					groupItem.setType(ITEM_TYPE_PRODUCT_TYPE);
					ProductTypeJson type = ProductTypeCache.getInstance().getTypeByID(typeID);
					if(null != type)
					{
						groupItem.setContent(type.getType_name());
					}
					else
					{
						groupItem.setContent("未知类型");
					}
					for(ProductJson product : productList)
					{
						CommonItemMeta item = new CommonItemMeta();
						item.setType(ITEM_TYPE_PRODUCT);
						item.setContent(product);
						itemList.add(item);
					}	
				}
			}
		}
		else
		{
			for(ProductJson product : rsp.getProductList())
			{
				CommonItemMeta item = new CommonItemMeta();
				item.setType(ITEM_TYPE_PRODUCT);
				item.setContent(product);
				itemList.add(item);
			}	
		}
		switch (tabID)
		{
		case 0:
			this.newProductData = itemList;
			break;
		case 1:
			this.typeProductData = itemList;
			break;
		case 2:
			this.allProductData = itemList;
			break;
		default:
			this.newProductData = itemList;
			break;
		}
		
		return itemList;
	}
	private List<Map<String,Object>> gridInitData()
	{
		List<Map<String,Object>> mArrayList = new ArrayList<Map<String, Object>>();
        for (int j = 0; j < mImageViewArray.length; j++)
		{
        	HashMap<String, Object> map = new HashMap<String, Object>();  
        	map.put("ItemImage", mImageViewArray[j]);//添加图像资源的ID  
        	map.put("ItemText", getString(mTextviewArray[j]));//按序号做ItemText  
        	mArrayList.add(map); 
		}
			
		 return mArrayList;
	}
	
	public Map<Integer,List<ProductJson>> divideGroup(List<ProductJson> productList)
	{
		Map<Integer,List<ProductJson>> map = new HashMap<Integer,List<ProductJson>>();
		for(ProductJson json : productList)
		{
			List<ProductJson> jsonList = map.get(json.getType_id());
			if(null == jsonList)
			{
				jsonList = new ArrayList<ProductJson>();
				map.put(json.getType_id(), jsonList);
			}
			jsonList.add(json);
		}
		
		return map;
	}
	
	@Override
	public View getListItemView(LayoutInflater inflater, CommonItemMeta item)
	{
		View view = null;
		if(ITEM_TYPE_GRID.equals(item.getType()))
		{
			if(null == homeGridView)
			{
				homeGridView = inflater.inflate(R.layout.home_list_item_gridview, null);
				 
				List<Map<String, Object>> arrayListForEveryGridView = (List<Map<String, Object>>) item.getContent();
				GridViewAdapter gridViewAdapter = new GridViewAdapter(this.getActivity(),arrayListForEveryGridView);
				GridView gridView = (GridView) homeGridView.findViewById(R.id.home_gridview);
				gridView.setAdapter(gridViewAdapter);
			}
			view = homeGridView;

		}
		else if(ITEM_TYPE_TAB.equals(item.getType()))
		{
			if(null == homeTabView)
			{
				homeTabView = inflater.inflate(R.layout.home_list_item_radio, null);
				 
				RadioGroup group = (RadioGroup) homeTabView.findViewById(R.id.home_radio_group);
				group.setOnCheckedChangeListener(this);
			}
			view = homeTabView;

		}
		else if(ITEM_TYPE_PRODUCT_TYPE.equals(item.getType()))
		{
			view = inflater.inflate(R.layout.list_item_divider, null);
			TextView text = (TextView) view.findViewById(R.id.list_divider_label);
			text.setText((String)item.getContent());
		}
		else
		{
			view = inflater.inflate(R.layout.home_list_item, null);

			ProductJson product = (ProductJson) item.getContent();
		    TextView titleView = (TextView) view.findViewById(R.id.home_list_item_title);
	        titleView.setText(product.getName());
	        
	        TextView curPrice = (TextView) view.findViewById(R.id.home_list_item_curPrice);
	        curPrice.setText(String.valueOf(product.getPrice()));
	        TextView oldPrice = (TextView) view.findViewById(R.id.home_list_item_oldPrice);
	        oldPrice.setText(String.valueOf(product.getOriginal_price()));

	        TextView desp = (TextView) view.findViewById(R.id.home_list_item_desp);
	        desp.setText(String.valueOf(product.getDscr()));

	        ImageView imageView = (ImageView) view.findViewById(R.id.home_list_item_img);
	 
	        loadImageUtil.loadImage(imageView, DataConvertUtil.getAbsUrl(product.getImgsrc()));
		}

        return view;
	}

	public void onItemClick(CommonItemMeta item)
	{
		if(ITEM_TYPE_PRODUCT.equals(item.getType()))
		{
			Intent intent = new Intent(this.getActivity(),this.listViewRes.getClickActivityClass());
			intent.putExtra(ListViewResInfo.SELECT_ITEM, (Serializable) item.getContent());

			this.startActivity(intent);
		}
		

	}
	@Override
	public void onCheckedChanged(RadioGroup group, int checkedId)
	{
		
		int radioButtonId = group.getCheckedRadioButtonId();
		if (radioButtonId == R.id.home_radio_all)
		{   
			tabID = 2;
			if(ValidatorUtil.isEmpty(this.dataList))
			{
				loadSendList();	
			}
			else
			{
				update(this.allProductData);	
			}
			
		}
		else if (radioButtonId == R.id.home_radio_type)
		{
			tabID = 1;
			if(ValidatorUtil.isEmpty(this.dataList))
			{
				loadSendList();	
			}
			else
			{
				update(this.typeProductData);	
			}
		}		
		else 
		{
			tabID = 0;
			if(ValidatorUtil.isEmpty(this.dataList))
			{
				loadSendList();	
			}
			else
			{
				update(this.newProductData);	
			}
			
		}

		
		
	}



 

}
