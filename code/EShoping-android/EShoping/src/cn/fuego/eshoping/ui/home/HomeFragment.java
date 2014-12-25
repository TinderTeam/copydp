package cn.fuego.eshoping.ui.home;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
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

public class HomeFragment extends MispDistinctListFragment implements OnItemClickListener,OnCheckedChangeListener
{
	private FuegoLog log = FuegoLog.getLog(getClass());
    //定义数组来存放按钮图片  
    private int mImageViewArray[] = {R.drawable.home_food,R.drawable.home_car,R.drawable.home_photo,R.drawable.home_education,
                                     R.drawable.home_entertainment,R.drawable.home_hotel,R.drawable.home_beauty,R.drawable.home_service};  
          
    //Tab选项卡的文字  
    private int mTextviewArray[] = {R.string.home_food, R.string.home_car,R.string.home_photo,R.string.home_education,
    								R.string.home_entertainment,R.string.home_hotel,R.string.home_beauty,R.string.home_service}; 
 
    private static final int ITEM_TYPE_GRID = 1; 
    
    private static final int ITEM_TYPE_TAB = 2; 
    private static final int ITEM_TYPE_PRODUCT_TYPE = 3; 

    private static final int ITEM_TYPE_PRODUCT = 4; 
    
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
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{
		// TODO Auto-generated method stub
		tabID = 0;
		View view = super.onCreateView(inflater, container, savedInstanceState);
		
		
		return view;
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
		gridItem.setLayoutType(ITEM_TYPE_GRID);
		gridItem.setContent(gridInitData());
		itemList.add(gridItem);
		
		CommonItemMeta tabItem = new CommonItemMeta();
		tabItem.setLayoutType(ITEM_TYPE_TAB);
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
					groupItem.setLayoutType(ITEM_TYPE_PRODUCT_TYPE);
					ProductTypeJson type = ProductTypeCache.getInstance().getTypeByID(typeID);
					if(null != type)
					{
						groupItem.setContent(type.getType_name());
					}
					else
					{
						groupItem.setContent("未知类型");
					}
					itemList.add(groupItem);
					for(ProductJson product : productList)
					{
						CommonItemMeta item = new CommonItemMeta();
						item.setLayoutType(ITEM_TYPE_PRODUCT);
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
				item.setLayoutType(ITEM_TYPE_PRODUCT);
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
	public int getItemTypeCount()
	{
		// TODO Auto-generated method stub
		return 5;
	}




	@Override
	public View getListItemView(LayoutInflater inflater,View convertView,CommonItemMeta item)
	{
		View view = null;
		
		switch(item.getLayoutType())
		{
		case ITEM_TYPE_GRID:
			if(null == convertView)
			{
				convertView = inflater.inflate(R.layout.home_list_item_gridview, null);
				view = convertView;
				convertView.setTag(view);
			}
			else
			{
				view = (View) convertView.getTag();
			}
 			
			List<Map<String, Object>> arrayListForEveryGridView = (List<Map<String, Object>>) item.getContent();
			GridViewAdapter gridViewAdapter = new GridViewAdapter(this.getActivity(),arrayListForEveryGridView);
			GridView gridView = (GridView) view.findViewById(R.id.home_gridview);
			gridView.setOnItemClickListener(new OnItemClickListener()
			{

				@Override
				public void onItemClick(AdapterView<?> parent, View view,	int position, long id)
				{
					//Toast.makeText(parent.getContext(), "position"+position, Toast.LENGTH_LONG);
					Intent i= new Intent();
					i.setClass(parent.getContext(), ProductSearchActivity.class);
					parent.getContext().startActivity(i);
				}
				
			});
			gridView.setAdapter(gridViewAdapter);
			break;
		case ITEM_TYPE_TAB:
			if(null == convertView)
			{
				convertView  = inflater.inflate(R.layout.home_list_item_radio, null);
				view = convertView;
				 
				RadioGroup group = (RadioGroup) view.findViewById(R.id.home_radio_group);
				group.setOnCheckedChangeListener(this);
				convertView.setTag(view);
			}
			else
			{
				view = (View) convertView.getTag();
			}
	

		    break;
		case ITEM_TYPE_PRODUCT_TYPE:
		    
			if(null == convertView)
			{
				convertView = inflater.inflate(R.layout.list_item_divider, null);
		        view = convertView;
		        convertView.setTag(view);
			}
			else
			{
				view = (View) convertView.getTag();
			}

			TextView text = (TextView) view.findViewById(R.id.list_divider_label);
			text.setText((String)item.getContent());
			break;
		case ITEM_TYPE_PRODUCT:
			if(null == convertView)
			{
				convertView = inflater.inflate(R.layout.home_list_item, null);
	

		        view = convertView;
		        convertView.setTag(view);
			}
			else
			{
				view = (View) convertView.getTag();
			}
			
			ProductJson product = (ProductJson) item.getContent();
		    TextView titleView = (TextView) convertView.findViewById(R.id.home_list_item_title);
	        titleView.setText(product.getName());
	        
	        TextView curPrice = (TextView) convertView.findViewById(R.id.home_list_item_curPrice);
	        curPrice.setText(String.valueOf(product.getPrice()));
	        TextView oldPrice = (TextView) convertView.findViewById(R.id.home_list_item_oldPrice);
	        oldPrice.setText(String.valueOf(product.getOriginal_price()));

	        TextView desp = (TextView) convertView.findViewById(R.id.home_list_item_desp);
	        desp.setText(String.valueOf(product.getDscr()));

	        ImageView imageView = (ImageView) convertView.findViewById(R.id.home_list_item_img);
	 
	        loadImageUtil.loadImage(imageView, DataConvertUtil.getAbsUrl(product.getImgsrc()));
	        
	        break;
		
		}
 

        return view;
	}

	public void onItemClick(CommonItemMeta item)
	{
		if(ITEM_TYPE_PRODUCT == item.getLayoutType())
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
			if(ValidatorUtil.isEmpty(this.allProductData))
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
			if(ValidatorUtil.isEmpty(this.typeProductData))
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
			if(ValidatorUtil.isEmpty(this.newProductData))
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
