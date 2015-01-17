package cn.fuego.eshoping.ui.home;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.constant.SharedPreferenceConst;
import cn.fuego.eshoping.ui.util.DataConvertUtil;
import cn.fuego.eshoping.ui.widget.FilterPopupMenu;
import cn.fuego.eshoping.webservice.up.model.GetProductListReq;
import cn.fuego.eshoping.webservice.up.model.GetProductListRsp;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.ui.list.MispListActivity;
import cn.fuego.misp.ui.util.LoadImageUtil;

public class ProductSearchActivity extends  MispListActivity<ProductJson>
{
	
	private FuegoLog log = FuegoLog.getLog(ProductSearchActivity.class);
	//页面组件
    private RadioGroup searchGroup;
    private FilterPopupMenu popupMenu;
    private int selectType=0;
    private int selectZone=0;
    

	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.product_search);
		this.activityRes.setBackBtn(R.id.com_back_btn);
		
		//List
		this.listViewRes.setListItemView(R.layout.home_list_item);
		this.listViewRes.setListView(R.id.product_search_list);	
		this.listViewRes.setClickActivityClass(HomeProductActivity.class);
	} 
	
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		InitializationData();
		
		super.onCreate(savedInstanceState);
		//初始化数据

		//初始化组件
		InitializationView();
		//初始化监听器
		InitializationListener();
	}
	
	private void InitializationData()
	{
		Intent intent = this.getIntent();
		selectType = (Integer) intent.getSerializableExtra(SharedPreferenceConst.SELECT_TYPE_ID);
		log.info("default select type is = "+ selectType );
	}	
	
	private void InitializationView()
	{
		searchGroup = (RadioGroup) findViewById(R.id.product_serch_radio_group);   
		popupMenu=new FilterPopupMenu(this,searchGroup);			
	}
	
	private void InitializationListener()
	{
		//按钮组监听器
		searchGroup.setOnCheckedChangeListener(new OnCheckedChangeListener(){
			@Override
			public void onCheckedChanged(RadioGroup group, int checkedId)
			{
				int radioButtonId = group.getCheckedRadioButtonId();
				if (radioButtonId == R.id.product_serch_radio_type)
				{   
					log.info("type filter clicked...");
					popupMenu.showTypeFilter();
					group.clearCheck();
				}else if(radioButtonId == R.id.product_serch_radio_area)
				{
					log.info("zone filter clicked...");
					popupMenu.showZoneFilter();
					group.clearCheck();
				}
			}	
		});		
	}
	


	public void zoneFilter(int selectedId)
	{
		log.info("select by  zoneFilter: "+selectedId);
		selectZone=selectedId;
		selectType=0;
		super.refreshList(new ArrayList<ProductJson>());
		loadSendList();
	}

	public void tpyeFilter(int selectedId)
	{
		log.info("select by  tpyeFilter: "+selectedId);	
		selectType=selectedId;
		selectZone=0;
		super.refreshList(new ArrayList<ProductJson>());
		loadSendList();
	}

	@Override
	public void loadSendList()
	{
		log.info("load list : type="+selectType+"zoen="+selectZone);
		GetProductListReq req = new GetProductListReq();
		req.setToken(AppCache.getToken());
		req.setCity(AppCache.getCityInfo().getCity());
		req.setTypeRoot(selectType);
		req.setZone_id(selectZone);
		req.setSearch(false);
		WebServiceContext.getInstance().getProductManageRest(this).getAllProductList(req);
	}

	@Override
	public List<ProductJson> loadListRecv(Object obj)
	{
		GetProductListRsp rsp = (GetProductListRsp)obj;
		List<ProductJson> data = rsp.getProductList();
		if(data==null){
			data = new ArrayList<ProductJson>();
		}
		log.info("product list num = "+data.size());
		this.repaint();	
		return data;
	}
	
	@Override
	public View getListItemView(View view, ProductJson item)
	{
		TextView nameView= (TextView) view.findViewById(R.id.home_list_item_title);
		nameView.setText(item.getName());	
		TextView oldPriceView= (TextView) view.findViewById(R.id.home_list_item_oldPrice);
		oldPriceView.setText(String.valueOf(item.getOriginal_price()));
		TextView curPriceView= (TextView) view.findViewById(R.id.home_list_item_curPrice);
		curPriceView.setText(String.valueOf(item.getPrice()));
		TextView despView= (TextView) view.findViewById(R.id.home_list_item_desp);
		despView.setText(item.getDscr());
		ImageView imageView = (ImageView)view.findViewById(R.id.home_list_item_img);
		LoadImageUtil.getInstance().loadImage(imageView, DataConvertUtil.getAbsUrl(item.getImgsrc()));
		return view;
	}
	

}
