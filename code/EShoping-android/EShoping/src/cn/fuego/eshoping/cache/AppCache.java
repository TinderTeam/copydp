package cn.fuego.eshoping.cache;

import cn.fuego.eshoping.webservice.up.model.base.CustomerJson;
import cn.fuego.eshoping.webservice.up.model.base.UserJson;
import cn.fuego.misp.service.MemoryCache;

public class AppCache extends MemoryCache
{
	private static String curCity = "广州";
	private static UserJson user;
	private static CustomerJson customer;
	public static String getCurCity()
	{
		return curCity;
	}

	public static void setCurCity(String curCity)
	{
		AppCache.curCity = curCity;
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
