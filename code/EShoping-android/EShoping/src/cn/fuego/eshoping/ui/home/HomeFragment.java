package cn.fuego.eshoping.ui.home;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.content.Intent;
import android.graphics.Paint;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.string.StringLengthLimit;
import cn.fuego.common.util.format.DataTypeConvert;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.cache.ProductTypeCache;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.ui.seller.SellerInfoActivity;
import cn.fuego.eshoping.ui.widget.ProductSearchView;
import cn.fuego.eshoping.webservice.up.model.GetProductListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductListRsp;
import cn.fuego.eshoping.webservice.up.model.GetSellerListRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.model.base.SellerJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.base.MispGridView;
import cn.fuego.misp.ui.grid.MispGridViewAdapter;
import cn.fuego.misp.ui.list.MispDistinctListFragment;
import cn.fuego.misp.ui.model.CommonItemMeta;
import cn.fuego.misp.ui.model.ListViewResInfo;
import cn.fuego.misp.ui.model.MispGridDataModel;
import cn.fuego.misp.ui.util.LoadImageUtil;

public class HomeFragment extends MispDistinctListFragment implements OnCheckedChangeListener
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
    
    private  final int TAB_0 = 0;
    private  final int TAB_1 = 1;
    private  final int TAB_2 = 2;
    
    
	private LoadImageUtil loadImageUtil = LoadImageUtil.getInstance();
 

 	private ProductSearchView productSearchView;
	
	@Override
	public void initRes()
	{ 
		this.fragmentRes.setImage(R.drawable.tabbar_home_icon);
		this.fragmentRes.setName(R.string.tabbar_home);
		this.fragmentRes.setFragmentView(R.layout.home_fragment);
 		listViewRes.setListView(R.id.home_main_list);
		listViewRes.setClickActivityClass(HomeProductActivity.class);
		ProductTypeCache.getInstance();


 	}
 
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{
		log.info("current City is: " + AppCache.getInstance().getCityInfo().getCity());
		
		tabID = TAB_0;
		View view = super.onCreateView(inflater, container, savedInstanceState);	
 
		
		productSearchView=new ProductSearchView(this.getActivity(),view);
		
		TextView cityView =  (TextView)view.findViewById(R.id.home_city);
		cityView.setText(AppCache.getInstance().getCityInfo().getCity());
		cityView.setOnClickListener(new OnClickListener(){
			@Override
			public void onClick(View v)
			{
				log.info("change city button clicked...");
				changeCity();

			}		
		});
		View scranView =  view.findViewById(R.id.home_scan_to_order_btn);
		scranView.setOnClickListener(this);


		return view;
	}

	protected void changeCity()
	{
		Intent intent = new Intent();
		intent.setClass(this.getActivity(), CitySelectListActivity.class);
		this.startActivity(intent);		
	}
	
	@Override
	public void onClick(View v)
	{
		 toQrOrder();
	}
	protected void toQrOrder()
	{
		Intent intent = new Intent();
		intent.setClass(this.getActivity(), QrOrderActivity.class);
		this.startActivity(intent);		
	}



	@Override
	public void loadSendList()
	{		
		GetProductListReq req = new GetProductListReq();
		req.setCity(AppCache.getInstance().getCityInfo().getCity());
		log.info("load req:"+req.toString());
 
		switch(tabID)
		{
		case TAB_0:
			
			if(ValidatorUtil.isEmpty(ProductCache.getInstance().getNewProductData()))
			{
				WebServiceContext.getInstance().getProductManageRest(tabHander0).getNewProductList(req);
			}
			refresh(ProductCache.getInstance().getNewProductData());	
 
			break;
			
		case TAB_1:
			
 			if(ValidatorUtil.isEmpty(ProductCache.getInstance().getTypeProductData()))
			{
				WebServiceContext.getInstance().getProductManageRest(tabHander1).getSellerList(req);

  			} 
 			 refresh(ProductCache.getInstance().getTypeProductData());	
 
			break;
		case TAB_2:
			if(ValidatorUtil.isEmpty(ProductCache.getInstance().getAllProductData()))
			{
				WebServiceContext.getInstance().getProductManageRest(tabHander2).getRecommendProductList(req);
			}
			 refresh(ProductCache.getInstance().getAllProductData());	
 
			break;
		default:
			break;
		}
	}
	
	private List<CommonItemMeta> getHeaderData()
	{
		List<CommonItemMeta> itemList = new ArrayList<CommonItemMeta>();	
		CommonItemMeta gridItem = new CommonItemMeta();
		gridItem.setLayoutType(ITEM_TYPE_GRID);
		gridItem.setContent(gridInitData());
		itemList.add(gridItem);
		CommonItemMeta tabItem = new CommonItemMeta();
		tabItem.setLayoutType(ITEM_TYPE_TAB);
		itemList.add(tabItem);
		return itemList;
	}
	private MispHttpHandler tabHander0 = new MispHttpHandler()
	{
		
		@Override
		public void handle(MispHttpMessage message)
		{


				if(message.isSuccess())
				{

					List<CommonItemMeta> itemList = new ArrayList<CommonItemMeta>();	

						GetProductListRsp rsp = (GetProductListRsp) message.getMessage().obj;	
						if(rsp.getProductList()!=null){
							for(ProductJson product : rsp.getProductList())
							{
								CommonItemMeta item = new CommonItemMeta();
								item.setLayoutType(ITEM_TYPE_PRODUCT);
								item.setContent(product);
								itemList.add(item);
							}	
						}
						ProductCache.getInstance().setNewProductData(itemList);
						//newProductData = itemList;
				}
				else
				{
					showMessage(message);
				}
				if(tabID==TAB_0)
				{
					refresh(ProductCache.getInstance().getNewProductData());
				}
			
		}
	}; 
	private MispHttpHandler tabHander1 = new MispHttpHandler()
	{
		
		@Override
		public void handle(MispHttpMessage message)
		{


				if(message.isSuccess())
				{

 
					 
					List<CommonItemMeta> itemList = new ArrayList<CommonItemMeta>();	

						GetSellerListRsp rsp = (GetSellerListRsp) message.getMessage().obj;	
						if(rsp.getSellerList()!=null)
						{
							for(SellerJson seller : rsp.getSellerList())
							{
								CommonItemMeta item = new CommonItemMeta();
								item.setLayoutType(ITEM_TYPE_PRODUCT);		
								item.setContent(seller);
								itemList.add(item);
							}	
						}
						 
						ProductCache.getInstance().setTypeProductData(itemList);
						
					 
				}
				else
				{
					showMessage(message);
				}
				if(tabID==TAB_1)
				{
					refresh(ProductCache.getInstance().getTypeProductData());
				}
			
		}
	}; 
	
	
	private MispHttpHandler tabHander2 = new MispHttpHandler()
	{
		
		@Override
		public void handle(MispHttpMessage message)
		{
 
				if(message.isSuccess())
				{

					List<CommonItemMeta> itemList = new ArrayList<CommonItemMeta>();	

					GetProductListRsp rsp = (GetProductListRsp) message.getMessage().obj;	
					if(rsp.getProductList()!=null){
						for(ProductJson product : rsp.getProductList())
						{
							CommonItemMeta item = new CommonItemMeta();
							item.setLayoutType(ITEM_TYPE_PRODUCT);
							item.setContent(product);
							itemList.add(item);
						}	
					}
					ProductCache.getInstance().setAllProductData(itemList);
						
					 
				}
				else
				{
					showMessage(message);
				}
				if(tabID==TAB_2)
				{
					refresh(ProductCache.getInstance().getAllProductData());
				}
			
		}
	}; 
	@Override
	public List<CommonItemMeta> loadListRecv(Object obj)
	{
		return null;
	}
	private List<MispGridDataModel>  gridInitData()
	{
		
		List<MispGridDataModel> mArrayList = new ArrayList<MispGridDataModel>();
		
        for (int j = 0; j < mImageViewArray.length; j++)
		{

        	MispGridDataModel gridData = new MispGridDataModel();
			int typeID=ProductTypeCache.getInstance().getTypeIDByName(getString(mTextviewArray[j]));

        	gridData.setData(typeID);
        	gridData.setImage( mImageViewArray[j]);
        	gridData.setName(getString(mTextviewArray[j]));
   
        	mArrayList.add(gridData); 
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
			List<MispGridDataModel>  arrayListForEveryGridView = (List<MispGridDataModel> )item.getContent();
			final MispGridViewAdapter gridViewAdapter = new MispGridViewAdapter(this.getActivity(),arrayListForEveryGridView);
			MispGridView gridView = (MispGridView) view.findViewById(R.id.home_gridview);
			gridView.setOnItemClickListener(new OnItemClickListener()
			{

				@Override
				public void onItemClick(AdapterView<?> parent, View view,	int position, long id)
				{
					MispGridDataModel data = (MispGridDataModel) gridViewAdapter.getItem(position);
					int typeID =   (Integer) data.getData();
					log.info("select type id is : "+typeID);
					if(typeID!=-1){
						Intent i= new Intent();
						ProductJson filter = new ProductJson();
						filter.setType_id(typeID);
						filter.setCity(AppCache.getInstance().getCityInfo().getCity());
						i.setClass(parent.getContext(), ProductSearchActivity.class);
						i.putExtra(SharedPreferenceConst.PRODUCT_FILTER, filter);
						parent.getContext().startActivity(i);
					}
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
		
			if(item.getContent().getClass().equals(SellerJson.class)){	
				SellerJson seller = (SellerJson) item.getContent();		
				//商家名称 20字
			    TextView titleView = (TextView) convertView.findViewById(R.id.home_list_item_title);
		        titleView.setText(StringLengthLimit.limitStringLen(seller.getSeller_name(),10));      
		        //商家类别 25
		        TextView typeView = (TextView) convertView.findViewById(R.id.home_list_item_curPrice);
		        typeView.setText(String.valueOf(seller.getType_name()));
		        
		       //刷新残留数据
		        TextView oldPrice = (TextView) convertView.findViewById(R.id.home_list_item_oldPrice);
		        oldPrice.setText("");
		       
		        
		        //商家描述
		        TextView desp = (TextView) convertView.findViewById(R.id.home_list_item_desp);
		        desp.setText(String.valueOf(StringLengthLimit.limitStringLen(seller.getDscr(), 20)));
		        //商家图片
		        ImageView imageView = (ImageView) convertView.findViewById(R.id.home_list_item_img); 
		        loadImageUtil.loadImage(imageView, MemoryCache.getImageUrl()+seller.getImg());    		
			}else{
				ProductJson product = (ProductJson) item.getContent();		
				//产品名称
			    TextView titleView = (TextView) convertView.findViewById(R.id.home_list_item_title);
		        titleView.setText(StringLengthLimit.limitStringLen(product.getName(),10));      
		        //产品现价
		        TextView curPrice = (TextView) convertView.findViewById(R.id.home_list_item_curPrice);
		        curPrice.setText(String.valueOf(getString(R.string.misp_rmb_unit)+DataTypeConvert.float2(product.getPrice())));
		        //产品原价
		        TextView oldPrice = (TextView) convertView.findViewById(R.id.home_list_item_oldPrice);
		        oldPrice.setText(String.valueOf(getString(R.string.misp_rmb_unit)+DataTypeConvert.float2(product.getOriginal_price())));
		        oldPrice.getPaint().setFlags(Paint. STRIKE_THRU_TEXT_FLAG ); 
		        //产品描述
		        TextView desp = (TextView) convertView.findViewById(R.id.home_list_item_desp);
		        desp.setText(String.valueOf(StringLengthLimit.limitStringLen(product.getDscr(),20)));
		        
		        ImageView imageView = (ImageView) convertView.findViewById(R.id.home_list_item_img); 
		        loadImageUtil.loadImage(imageView,MemoryCache.getImageUrl()+product.getImgsrc());        
			}			
	        break;	
		}
        return view;
	}

	@Override
	public void onItemListClick(AdapterView<?> parent, View view,long id, CommonItemMeta item)
	{
		if(ITEM_TYPE_PRODUCT == item.getLayoutType())
		{
			if(tabID==TAB_1){
				Intent intent = new Intent(this.getActivity(),SellerInfoActivity.class);
				intent.putExtra(ListViewResInfo.SELECT_ITEM, (Serializable) item.getContent());
				this.startActivity(intent);
			}else{
				Intent intent = new Intent(this.getActivity(),this.listViewRes.getClickActivityClass());
				intent.putExtra(ListViewResInfo.SELECT_ITEM, (Serializable) item.getContent());
				this.startActivity(intent);
			}
		}
	}
	@Override
	public void onCheckedChanged(RadioGroup group, int checkedId)
	{
		
		int radioButtonId = group.getCheckedRadioButtonId();
		if (radioButtonId == R.id.home_radio_all)
		{   
			tabID = TAB_2;
		}
		else if (radioButtonId == R.id.home_radio_type)
		{
			tabID = TAB_1;
 
		}		
		else 
		{
			tabID = TAB_0;
 
		}
		
		loadSendList();	
	}
	
	private void refresh(List<CommonItemMeta> newDataList)
	{
		List<CommonItemMeta> dataList = this.getHeaderData();
		if(!ValidatorUtil.isEmpty(newDataList))
		{
			dataList.addAll(newDataList);

		}
		refreshList(dataList);	

	}
	 

}
