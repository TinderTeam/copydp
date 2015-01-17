package cn.fuego.eshoping.cache;

import java.util.ArrayList;
import java.util.List;

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
		cityInfo = new CityJson();
		cityInfo.setCity("广州");
		cityInfo.setCity_id(3);
		List<ZoneJson> zone_list = new ArrayList<ZoneJson>();
		ZoneJson zone = new ZoneJson();
		zone.setZone_name("荔湾区");
		ZoneJson zone2 = new ZoneJson();
		zone2.setZone_name("花都区");
		zone_list.add(zone);
		zone_list.add(zone2);
		cityInfo.setZone_list(zone_list);
		return cityInfo;
	}
	
	public static UserJson getUser()
	{
		UserJson user=new UserJson();
		user.setUser_id(85);
		user.setUsername("test");
		return user;
	}

	public static void setUser(UserJson user)
	{
		AppCache.user = user;
	}

	public static CustomerJson getCustomer()
	{
		CustomerJson customer = new CustomerJson();
		customer.setScore(1234);
		customer.setCellphone("13456789784");
		customer.setEmail("fuego@fuego.cn");
		return customer;
	}

	public static void setCustomer(CustomerJson customer)
	{
		AppCache.customer = customer;
	}

}
