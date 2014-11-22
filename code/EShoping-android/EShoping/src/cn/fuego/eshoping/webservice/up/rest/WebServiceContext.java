package cn.fuego.eshoping.webservice.up.rest;

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.DefaultHttpClient;

import android.os.Handler;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.misp.service.http.MispProxyFactory;

public class WebServiceContext
{
	private FuegoLog log = FuegoLog.getLog(getClass());

	private static WebServiceContext instance;

	public static String hostURL = "http://192.168.1.103:8080/SmartHome/rest";
	
	private WebServiceContext()
	{

	}

	public static synchronized WebServiceContext getInstance()
	{
		if (null == instance)
		{
			instance = new WebServiceContext();
		}
		return instance;
	}
	public ProductManageRest getSensorManageRest(Handler handler)
	{
		
		ProductManageRest rest = MispProxyFactory.create( hostURL,ProductManageRest.class, getHttpClient(),handler);
		
		return rest;
	}
	
	public NewsManageRest getNewsManageRest(Handler handler)
	{
 
		NewsManageRest rest = MispProxyFactory.create( hostURL,NewsManageRest.class, getHttpClient(),handler);

		return rest;
	}
	private HttpClient getHttpClient()
	{
		HttpClient httpClient = new DefaultHttpClient();  

		return httpClient;

	}
	public UserManageRest getUserManageRest(Handler handler)
	{
 
		UserManageRest rest = MispProxyFactory.create( hostURL,UserManageRest.class, getHttpClient(),handler);

		return rest;
	}	
	

}
