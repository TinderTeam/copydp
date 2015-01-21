package cn.fuego.misp.service;



public class MemoryCache
{
	private static String token="12345";
	private static String version = "0.1";
	private static String serverIp = "120.24.217.173";
	private static String serverPort = "80";
	private static float density = 1;
 

	public static float getDensity()
	{
		return density;
	}

	public static void setDensity(float density)
	{
		MemoryCache.density = density;
	}
	public static String getToken()
	{
		return token;
	}

	public static void setToken(String token)
	{
		MemoryCache.token = token;
	}

	public static String getVersion()
	{
		return version;
	}

	public static String getServerIp()
	{
		return serverIp;
	}

	public static String getServerPort()
	{
		return serverPort;
	}
	
	public static String getHostUrl()
	{
		return "http://"+MemoryCache.getServerIp()+":"+MemoryCache.getServerPort();
	}
	
	public static void cleanToken(){
		token=null;
	}
	public static String getWebContextUrl()
	{
		return getHostUrl()+"/Laundry";
	}
	public static String getImageUrl()
	{
		return MemoryCache.getHostUrl() + "/copydp/Public/uploads/img/";
	}
 }
