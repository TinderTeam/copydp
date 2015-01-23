package cn.fuego.eshoping.ui.widget;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.list.tools.IteratorSelector;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.constant.BusinessConst;
import cn.fuego.eshoping.constant.ErrorMessageConst;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.ui.home.GroupAdapter;
import cn.fuego.eshoping.ui.home.ProductSearchActivity;
import cn.fuego.eshoping.ui.order.ProductOrderActivity;
import cn.fuego.eshoping.ui.order.ProductOrderSuccess;
import cn.fuego.eshoping.webservice.up.model.GetCityListReq;
import cn.fuego.eshoping.webservice.up.model.GetCityListRsp;
import cn.fuego.eshoping.webservice.up.model.GetProductTypeReq;
import cn.fuego.eshoping.webservice.up.model.GetProductTypeRsp;
import cn.fuego.eshoping.webservice.up.model.SetProductOrderRsp;
import cn.fuego.eshoping.webservice.up.model.base.CityJson;
import cn.fuego.eshoping.webservice.up.model.base.ProductOrderJson;
import cn.fuego.eshoping.webservice.up.model.base.ProductTypeJson;
import cn.fuego.eshoping.webservice.up.model.base.ZoneJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.base.MispBaseActivtiy;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.RadioGroup;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.PopupWindow.OnDismissListener;

public class FilterPopupMenu implements OnDismissListener
{
	private FuegoLog log = FuegoLog.getLog(ProductSearchActivity.class);
	
	private PopupWindow popupWindow=null;
	private ProductSearchActivity context;
	private RadioGroup searchGroup;
	private View popupWindowView;
	private View bottomview;
	private ListView fatherList,childList;
    private List<String> fatherListData = new ArrayList<String>();
    private List<String> childListData = new ArrayList<String>() ; 
	private GroupAdapter fatherAdapter,childAdapter;
	private int xPos;
	
	private int currentSelect=TYPE_SELECT; //默认正在筛选类型
	public static final String ALL_TYPE = "全部分类";	//正在筛选类型
	public static final String ALL_ZONE = "全部商圈";	//正在筛选类型
	public static final int ALL_TYPE_ID = 0;	//“全部”的ID类型
	public static final int TYPE_SELECT = 0;	//正在筛选类型
	public static final int ZONE_SELECT = 1;	//正在筛选区域

	//data
	List<ProductTypeJson> allList= new ArrayList<ProductTypeJson>();
	List<ProductTypeJson> typeFatherList= new ArrayList<ProductTypeJson>();
	Map<String,List<ProductTypeJson>> typeChindrenMap= new HashMap<String,List<ProductTypeJson>>();
	List<ZoneJson> zoneList=new ArrayList<ZoneJson>();
	
	public FilterPopupMenu(ProductSearchActivity context,RadioGroup searchGroup){
		this.context=context;
		this.searchGroup=searchGroup;
		initData();
		initPopupWindow();
		initView();
		initListener();
	}
	
	
	private void initData()
	{
		//获取产品类型列表
		GetProductTypeReq typeReq = new GetProductTypeReq();
		typeReq.setToken(AppCache.getInstance().getToken());
		MispHttpHandler typeHandle = new MispHttpHandler(){
			@Override
			public void handle(MispHttpMessage message){
				if (message.isSuccess()){
					GetProductTypeRsp rsp = (GetProductTypeRsp) message.getMessage().obj;
					allList=rsp.getTypeList();
					//获取一级类型列表
					typeFatherList=IteratorSelector.selectByField(allList,ProductTypeJson.FATHER_ID, String.valueOf(BusinessConst.ALL_TYPE));
					log.info("father type list = "+ typeFatherList.toString());
					//获取子类型列表
					for(ProductTypeJson type:typeFatherList){
						List<ProductTypeJson> subList = IteratorSelector.selectByField(allList,ProductTypeJson.FATHER_ID, String.valueOf(type.getType_id()));
						typeChindrenMap.put(type.getType_name(), subList);
					}
					log.info("children type map  = "+ typeChindrenMap.toString());
				}
				else{
					context.showMessage(message);
				}
			}
		};
		WebServiceContext.getInstance().getProductManageRest(typeHandle).getProductType(typeReq);
		
		//获取区域列表
			//1.从缓存中取，如果缓存空（可能为本身无数据，可能为缓存未加载）则加载一次缓存
			GetCityListReq req = new GetCityListReq();
			req.setToken(AppCache.getInstance().getToken());
			WebServiceContext.getInstance().getUserManageRest(new MispHttpHandler(){

				@Override
				public void handle(MispHttpMessage message)
				{
					if (message.isSuccess()){
						GetCityListRsp rsp = (GetCityListRsp) message.getMessage().obj;
						List<CityJson> allCityList=rsp.getCityList();								
						CityJson city = IteratorSelector.findbyAttr(allCityList, CityJson.CITY_NAME, AppCache.getInstance().getCityInfo().getCity());
						zoneList=city.getZone_list();
						log.info("zone list = "+ zoneList.toString());
						AppCache.getInstance().setCityList(allCityList);
						AppCache.getInstance().setCityInfo(city);
					}
					else{
						context.showMessage(message);
					}
				}
				
			}).getCityList(req);

	}

	private void initPopupWindow()
	{
		LayoutInflater layoutInflater = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);  
		popupWindowView = layoutInflater.inflate(R.layout.pop_window, null); 
		popupWindow=new PopupWindow(
							popupWindowView,
							context.getWindowManager().getDefaultDisplay().getWidth(),
							context.getWindowManager().getDefaultDisplay().getHeight()
						);
        // 使其聚集  
        popupWindow.setFocusable(true);  
        // 设置允许在外点击消失  
        popupWindow.setOutsideTouchable(true);  
        //实例化一个ColorDrawable颜色为半透明 
        ColorDrawable dw = new ColorDrawable(0xb0000000);  
        popupWindow.setBackgroundDrawable(dw);
        //点击底部页面消失pop
        
        WindowManager windowManager = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);  
        // 显示的位置为:屏幕的宽度的一半-PopupWindow的高度的一半  
        xPos = windowManager.getDefaultDisplay().getWidth() / 2- popupWindow.getWidth() / 2; 
        
	}
	
	private void initView()
	{
		 fatherList = (ListView) popupWindowView.findViewById(R.id.search_father_list); 
         childList = (ListView) popupWindowView.findViewById(R.id.search_child_list); 
         bottomview = popupWindowView.findViewById(R.id.pop_window_bottom);   
         fatherListData.add(0, ALL_TYPE);
         fatherAdapter = new GroupAdapter(context, fatherListData);  
         fatherList.setAdapter(fatherAdapter);
         childAdapter = new GroupAdapter(context, childListData);  
         childList.setAdapter(childAdapter);
	}
	
	private void initListener()
	{
		 popupWindow.setOnDismissListener(this); 
		 bottomview.setOnClickListener(new OnClickListener()
	 		{	 			
	 			@Override
	 			public void onClick(View v)
	 			{
	 				popupWindow.dismiss(); 
	 			}
	 		});
		 
		 fatherList.setOnItemClickListener(new OnItemClickListener(){  
	            @Override  
	            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) { 
	            	log.info("father list item selected:id="+position+"str="+fatherListData.get(position));
	            	String selectStr=fatherListData.get(position);
	            	if(TYPE_SELECT==currentSelect){
	            		//选中父节点,展开子节点	
	            		if(selectStr.equals(ALL_TYPE)){	
	            			//选中父节点的“全部”选项->恢复列表	            	
		            		context.typeFilter(ALL_TYPE_ID,ALL_TYPE);		            		
		            		popupWindow.dismiss();
	            			childListData.clear();
	            			updatechildren(childListData); 
	            		}else{	  
	            			//选中父节点的一个内容
		            		childListData =IteratorSelector.selectColumn(
		            				typeChindrenMap.get(selectStr),
		            				ProductTypeJson.TYPE_NAME
		            				);
		            		childListData.add(0, selectStr);  		
		            		log.info("explan sub type list: "+childListData.toString());
		            		updatechildren(childListData); 
	            		}
 			
	            	}else{
	            		//选中区域列表
	            		int selectedId = IteratorSelector.findbyAttr(zoneList, ZoneJson.ZONE_NAME, selectStr).getZone_id();
	            		context.zoneFilter(selectedId,selectStr);
	            		popupWindow.dismiss();
	            	}
	            }  
	        });  
		 childList.setOnItemClickListener(new OnItemClickListener(){  
	            @Override  
	            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) { 
	            	log.info("children list item selected..."+position+"str="+childListData.get(position));
	            	String selectStr=childListData.get(position);
	            	int selectedId = IteratorSelector.findbyAttr(allList, ProductTypeJson.TYPE_NAME, selectStr).getType_id();
	            	context.typeFilter(selectedId,selectStr);
	            	popupWindow.dismiss();
	            }  
	        });  
	}


	@Override
	public void onDismiss()
	{
		searchGroup.clearCheck();			
	}
	
	/*
	 * 更新相关的私有操作
	 */
		private void update(List<String> fList,List<String > cList){
			updatefather(fList);
			updatechildren(cList);
		}	
		private void updatefather(List<String> fList){
			fatherAdapter = new GroupAdapter(context, fList);  
	        fatherList.setAdapter(fatherAdapter);
		}
		private void updatechildren(List<String> cList){
			  childAdapter = new GroupAdapter(context, cList);  
		        childList.setAdapter(childAdapter);
		}
	/*
	 * 刷新操作
	 */
		private void show(){
			popupWindow.showAsDropDown(searchGroup, xPos, 0); 
		}
		public void showTypeFilter()
		{	
			//显示父类型表
			currentSelect=this.TYPE_SELECT;
			fatherListData= IteratorSelector.selectColumn(typeFatherList, ProductTypeJson.TYPE_NAME);
			fatherListData.add(0,ALL_TYPE);
			childListData.clear();
			update(fatherListData,new ArrayList<String>());
			show();
		}
	
		public void showZoneFilter()
		{	
			//显示区域表
			currentSelect=this.ZONE_SELECT;
			fatherListData=IteratorSelector.selectColumn(zoneList, ZoneJson.ZONE_NAME);
			fatherListData.add(0,ALL_ZONE);
			childListData.clear();
			update(fatherListData,new ArrayList<String>());
			show();
		}
		

}
