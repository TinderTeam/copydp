package cn.fuego.eshoping.ui;

import android.app.Fragment;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentTabHost;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.TabHost.TabSpec;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.activity.ActivityFragment;
import cn.fuego.eshoping.ui.base.BaseFragment;
import cn.fuego.eshoping.ui.base.ExitApplication;
import cn.fuego.eshoping.ui.home.HomeFragment;
import cn.fuego.eshoping.ui.news.NewsFrament;
import cn.fuego.eshoping.ui.user.UserFragment;

/** 
* @ClassName: MainTabbarActivity 
* @Description: TODO
* @author Aether from Seven
* @date 2014-11-17 上午10:50:15 
*  
*/
public class MainTabbarActivity extends FragmentActivity
{
	FuegoLog log = FuegoLog.getLog(MainTabbarActivity.class);

    //定义FragmentTabHost对象  
    private FragmentTabHost mTabHost;  
          
    //定义一个布局  
    private LayoutInflater layoutInflater;  
              
    //定义数组来存放Fragment界面  
    private Class fragmentArray[] = {HomeFragment.class,ActivityFragment.class,NewsFrament.class,UserFragment.class};  
          
 
          
    public void onCreate(Bundle savedInstanceState) {  
        super.onCreate(savedInstanceState);  
        setContentView(R.layout.activity_main_tabbar);  
        ExitApplication.getInstance().addActivity(this);

        initView();  
    }  
           
    /** 
     * 初始化组件 
     */
    private void initView(){  
        //实例化布局对象  
        layoutInflater = LayoutInflater.from(this);  
                      
        //实例化TabHost对象，得到TabHost  
        mTabHost = (FragmentTabHost)findViewById(android.R.id.tabhost);  
        mTabHost.setup(this, getSupportFragmentManager(), R.id.realtabcontent);   
       mTabHost.setBackgroundColor(getResources().getColor(R.color.tabbarback)); 
        //mTabHost.setBackgroundColor(R.drawable.tabbar_background);
        //得到fragment的个数  
 
                      
        for(int i = 0; i < fragmentArray.length; i++)
        {    
        	FragmentResInfo resource = getResource( fragmentArray[i]);
        	
            //为每一个Tab按钮设置图标、文字和内容  
        	String str = getString(resource.getName());
            TabSpec tabSpec = mTabHost.newTabSpec(str).setIndicator(getTabItemView(resource));  
            //将Tab按钮添加进Tab选项卡中  
            mTabHost.addTab(tabSpec, fragmentArray[i], null);  
            //设置Tab按钮的背景 
            mTabHost.getTabWidget().getChildAt(i).setBackgroundResource(R.drawable.tabbar_background); 
        }  
    }  
    
    public FragmentResInfo getResource(Class clazz)
    {
    	BaseFragment fragment = null;
		try
		{
			fragment = (BaseFragment) clazz.newInstance();
		} catch (Exception e)
		{
			
			log.info("instance failed",e);
			return null;
			 
		}
    	return fragment.getResource();
    }
                      
    /** 
     * 给Tab按钮设置图标和文字 
     */
    private View getTabItemView(FragmentResInfo resource){  
        View view = layoutInflater.inflate(R.layout.tabbar_item_view, null);  
        view.setPadding(0, 0, 0, 10);  
        ImageView imageView = (ImageView) view.findViewById(R.id.imageview);  
        imageView.setImageResource(resource.getImage());  
              
        TextView textView = (TextView) view.findViewById(R.id.textview);          
        textView.setText(resource.getName());  
          
        return view;  
    } 
}
