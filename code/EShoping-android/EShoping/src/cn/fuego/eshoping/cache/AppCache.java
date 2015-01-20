package cn.fuego.eshoping.cache;

import java.util.ArrayList;

import cn.fuego.eshoping.webservice.up.model.base.CityJson;
import cn.fuego.eshoping.webservice.up.model.base.CustomerJson;
import cn.fuego.eshoping.webservice.up.model.base.UserJson;
import cn.fuego.eshoping.webservice.up.model.base.ZoneJson;
import cn.fuego.misp.service.MemoryCache;

public class AppCache extends MemoryCache
{
	
	private static CityJson cityInfo;
	private static UserJson user;
	private static CustomerJson customer;


	public static CityJson getCityInfo(){
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
	
	public static UserJson getUser()
	{
		return user;
	}

	public static void setUser(UserJson user)
	{
		AppCache.user = user;
	}

	public static CustomerJson getCustomer()
	{
		return customer;
	}

	public static void setCustomer(CustomerJson customer)
	{
		AppCache.customer = customer;
	}

	public static void setCityInfo(CityJson city)
	{
		AppCache.cityInfo = city;
	}

}
