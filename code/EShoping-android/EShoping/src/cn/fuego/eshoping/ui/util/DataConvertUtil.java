package cn.fuego.eshoping.ui.util;

import cn.fuego.eshoping.cache.MemoryCache;

public class DataConvertUtil
{
	public static String getAbsUrl(String url)
	{
		return  MemoryCache.getHostUrl() + "/copydp/Public/uploads/img/" +url;
	}
}
