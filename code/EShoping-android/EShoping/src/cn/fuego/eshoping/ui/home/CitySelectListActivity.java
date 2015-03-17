package cn.fuego.eshoping.ui.home;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.content.Intent;
import android.view.View;
import android.widget.AdapterView;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.ui.MainTabbarActivity;
import cn.fuego.eshoping.ui.user.UserActivityListActivity;
import cn.fuego.eshoping.webservice.up.model.GetCityListRsp;
import cn.fuego.eshoping.webservice.up.model.base.ActivityOrderJson;
import cn.fuego.eshoping.webservice.up.model.base.CityJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.ui.list.MispListActivity;
import cn.fuego.misp.ui.model.ListViewResInfo;

public class CitySelectListActivity extends  MispListActivity<CityJson>
{
	FuegoLog log = FuegoLog.getLog(UserActivityListActivity.class);
	//默认查询已订购
	int defaltType=R.string.order_type_attend;
	List<CityJson> list;
	@Override
	public View getListItemView(View view, CityJson item)
	{
		TextView cityName = (TextView)view.findViewById(R.id.item_texttype_name);
		cityName.setText(item.getCity());
		TextView discView = (TextView)view.findViewById(R.id.item_texttype_text);
		if(item.getCity().equals(AppCache.getInstance().getPositionCityStr())){			
			discView.setText("定位城市");
		}else{
			discView.setText("");
		}
		return view;
	}

	@Override
	public void loadSendList()
	{
		if(list==null||list.isEmpty()){
			WebServiceContext.getInstance().getUserManageRest(this).getCityList(null);
		}
	}

	@Override
	public List<CityJson> loadListRecv(Object obj)
	{	
		GetCityListRsp rsp = (GetCityListRsp) obj;
		list=rsp.getCityList();
		AppCache.getInstance().setCityList(list);
		return list;
	}

	@Override
	public void initRes()
	{
		//Basic
		this.activityRes.setAvtivityView(R.layout.home_city);
		this.activityRes.setBackBtn(R.id.com_back_btn);
		this.activityRes.setTitleTextView(R.id.com_head_title);
		this.activityRes.setName(getString(R.string.page_home_city));		
		//List
		this.listViewRes.setListItemView(R.layout.list_item_texttype);
		this.listViewRes.setListView(R.id.city_list);
		list =  AppCache.getInstance().getCityList();
		if(list!=null){
			log.info("city list size is :" + list.size());
		}
		this.setDataList(list);
	}
	

	
	@Override
	public void onItemListClick(AdapterView<?> parent, View view,long id, CityJson item)
	{		
		AppCache.getInstance().setCityInfo(item);
		
		ProductCache.getInstance().clear();
		MainTabbarActivity.jump(this, HomeFragment.class, 1);
 
	}

}
