package cn.fuego.eshoping.ui;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.list.tools.IteratorSelector;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.webservice.up.model.GetCityListRsp;
import cn.fuego.eshoping.webservice.up.model.SetActivityOrderRsp;
import cn.fuego.eshoping.webservice.up.model.base.CityJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.http.MispHttpHandler;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.tool.MispLocation;
import cn.fuego.misp.tool.MispLocationListener;
import cn.fuego.misp.tool.MispLocationService;

import com.baidu.mapapi.SDKInitializer;

public class MainActivity extends BaseActivtiy 
{
	private FuegoLog log = FuegoLog.getLog(MainActivity.class);
	
	public static boolean isForeground = false;
	
	
    private String currentCity;
	private List<CityJson> cityList= new ArrayList<CityJson>();
	
	private void initApplication()
	{
		//获取城市列表
		WebServiceContext.getInstance().getUserManageRest(new MispHttpHandler(){
			@Override
			public void handle(MispHttpMessage message)
			{
				if (message.isSuccess()){
					GetCityListRsp rsp = (GetCityListRsp) message.getMessage().obj;
					cityList=rsp.getCityList();
					setCurrentCity();
				}
				else{
					showMessage(message);
				}
			}
		}).getCityList(null);
		
		//获取当前城市
		
		MispLocationService.getInstance().registerOne(this.getApplicationContext(),new  MispLocationListener(){
			@Override
			public void receiveLocation(MispLocation location)
			{
				currentCity=location.getCity();
				setCurrentCity();
			}
		}
			);
		//MispLocationService.getInstance().requestLocation();
		}
	
	protected void setCurrentCity()
	{
		if(currentCity==null && !cityList.isEmpty()){
			CityJson city =IteratorSelector.findbyAttr(cityList, CityJson.CITY_ID, currentCity);
			AppCache.getInstance().setCityInfo(city);
		}
	}  
	
	
	
	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.main_welcome);
		
	}
	@Override
	public void onCreate(Bundle savedInstanceState) {

		super.onCreate(savedInstanceState);
		//setContentView(R.layout.main);		
		//init baidu map
		//SDKInitializer.initialize(getApplicationContext()); 
		initApplication();
		Intent intent = new Intent();
		//SharedPreferences userInfo = getSharedPreferences(SharedPreferenceConst.UESR_INFO, 0);		 
        intent.setClass(MainActivity.this, MainTabbarActivity.class);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP );
        startActivity(intent);

	}
		  
	@Override
	public void handle(MispHttpMessage message)
	{	

	}


	
 

		
}
