package cn.fuego.eshoping.cache;

import java.util.ArrayList;

import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.webservice.up.model.base.CityJson;
import cn.fuego.eshoping.webservice.up.model.base.CustomerJson;
import cn.fuego.eshoping.webservice.up.model.base.UserJson;
import cn.fuego.eshoping.webservice.up.model.base.ZoneJson;
import cn.fuego.misp.service.MemoryCache;

public class AppCache extends MemoryCache
{
	private FuegoLog log = FuegoLog.getLog(getClass());
	
	private  CityJson cityInfo;
	private  UserJson user;
	private  CustomerJson customer;
	private static AppCache instance;


	public boolean isLogined()
	{
		if(ValidatorUtil.isEmpty(MemoryCache.getToken()))
		{
			return false;
		}
		return true;
	}
 
	public  CityJson getCityInfo(){
		if(cityInfo==null){
			CityJson defaltCity = new CityJson();
			defaltCity.setCity("温州");
			defaltCity.setCity_id(1);
			defaltCity.setZone_list(new ArrayList<ZoneJson>());
			cityInfo=defaltCity;
			return defaltCity;
		}else{
			return cityInfo;
		}
	}
	public synchronized static AppCache getInstance()
	{
		if(null == instance)
		{
			instance = new AppCache();
		}
		return instance;
		
	}
	
	public  UserJson getUser()
	{
		return user;
	}

	public  void setUser(UserJson user)
	{
		this.user = user;
	}

	public  CustomerJson getCustomer()
	{
		return customer;
	}

	public  void setCustomer(CustomerJson customer)
	{
		this.customer = customer;
	}

	public  void setCityInfo(CityJson city)
	{
		this.cityInfo = city;
	}

}
