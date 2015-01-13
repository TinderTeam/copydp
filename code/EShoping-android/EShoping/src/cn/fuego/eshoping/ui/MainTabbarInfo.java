package cn.fuego.eshoping.ui;

import cn.fuego.eshoping.ui.activity.ActivityFragment;
import cn.fuego.eshoping.ui.home.HomeFragment;
import cn.fuego.eshoping.ui.news.NewsFragment;
import cn.fuego.eshoping.ui.user.UserFragment;

public class MainTabbarInfo
{
	private static Class fragments[] = {HomeFragment.class,ActivityFragment.class,NewsFragment.class,UserFragment.class};  
      
    public static int getIndexByClass(Class clazz)
    {
    	for(int i=0;i<fragments.length;i++)
    	{
    		if(clazz == fragments[i])
    		{
    			return i;
    		}
    	}
    	return 0;
    }

	public static Class[] getFragments()
	{
		return fragments;
	}
	
}
