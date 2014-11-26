package cn.fuego.eshoping.webservice.up.rest;

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.DefaultHttpClient;

import cn.fuego.common.log.FuegoLog;
import cn.fuego.misp.service.http.MispProxyFactory;

public class WebServiceContext
{
	private FuegoLog log = FuegoLog.getLog(getClass());

	private static WebServiceContext instance;

	public static String hostURL = "http://"+"127.0.0.1"+":"+"7000"+"/copydp/index.php";
	
	private WebServiceContext()
	{
		log.info("the host and base url is "+hostURL);

	}

	public static synchronized WebServiceContext getInstance()
	{
		if (null == instance)
		{
			instance = new WebServiceContext();
		}
		return instance;
	}
	public ProductManageRest getSensorManageRest()
	{
		
		ProductManageRest rest = MispProxyFactory.create( hostURL,ProductManageRest.class, getHttpClient());
		
		return rest;
	}
	
	public NewsManageRest getNewsManageRest()
	{
 
		NewsManageRest rest = MispProxyFactory.create( hostURL,NewsManageRest.class, getHttpClient());

		return rest;
	}
	private HttpClient getHttpClient()
	{
		HttpClient httpClient = new DefaultHttpClient();  

		return httpClient;

	}
	public UserManageRest getUserManageRest()
	{
 
		UserManageRest rest = MispProxyFactory.create( hostURL,UserManageRest.class, getHttpClient());

		return rest;
	}	
	

}
