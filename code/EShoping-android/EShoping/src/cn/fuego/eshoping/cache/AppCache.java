package cn.fuego.eshoping.cache;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.webservice.up.model.base.CityJson;
import cn.fuego.eshoping.webservice.up.model.base.CustomerJson;
import cn.fuego.eshoping.webservice.up.model.base.UserJson;
import cn.fuego.eshoping.webservice.up.model.base.ZoneJson;
import cn.fuego.misp.dao.SharedPreUtil;
import cn.fuego.misp.service.MemoryCache;

public class AppCache extends MemoryCache
{
	private FuegoLog log = FuegoLog.getLog(getClass());
	
	private static AppCache instance;
	
	private  CityJson cityInfo;
	private String positionCityStr;
	private  UserJson user;
	private  CustomerJson customer;
	
	private List<CityJson> cityList;
	
	
	public static final String USER_CACHE="user";
	public static final String CUSTOMER_CACHE="customer";
	public static final String TOKEN_CACHE="token";
	
	

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
	
	public void clear()
	{
		MemoryCache.setToken(null);
		user = null;
		customer = null;
		SharedPreUtil.getInstance().delete(USER_CACHE);
		SharedPreUtil.getInstance().delete(CUSTOMER_CACHE);
		SharedPreUtil.getInstance().delete(TOKEN_CACHE);
				
	}
	
	public void update(CustomerJson customer)
	{
		this.customer = customer;
		SharedPreUtil.getInstance().put(CUSTOMER_CACHE, customer);
		load();

	}
	public void update(String token,UserJson user,CustomerJson customer)
	{
 
		SharedPreUtil.getInstance().put(USER_CACHE, user);
		SharedPreUtil.getInstance().put(CUSTOMER_CACHE, customer);
		SharedPreUtil.getInstance().put(TOKEN_CACHE,token );
		load();

	}
	public void load()
	{
		this.user =  (UserJson) SharedPreUtil.getInstance().get(USER_CACHE);
		this.customer = (CustomerJson) SharedPreUtil.getInstance().get(CUSTOMER_CACHE);
		MemoryCache.setToken((String) SharedPreUtil.getInstance().get(TOKEN_CACHE));
 
	}
 
	public  UserJson getUser()
	{
		return user;
	}
 
	public  CustomerJson getCustomer()
	{
		return customer;
	}
 

	public  void setCityInfo(CityJson city)
	{
		this.cityInfo = city;
	}

	/**
	 * @return the cityList
	 */
	public List<CityJson> getCityList()
	{
		return cityList;
	}

	/**
	 * @param cityList the cityList to set
	 */
	public void setCityList(List<CityJson> cityList)
	{
		this.cityList = cityList;
	}

	public String getPositionCityStr()
	{
		return positionCityStr;
	}

	public void setPositionCityStr(String positionCityStr)
	{
		this.positionCityStr = positionCityStr;
	}

	 

}
