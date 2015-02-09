package cn.fuego.eshoping.ui.user;

import java.util.ArrayList;
import java.util.List;

import android.content.Intent;
import android.view.View;
import android.widget.AdapterView;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.ui.MainTabbarActivity;
import cn.fuego.eshoping.webservice.up.model.base.CustomerJson;
import cn.fuego.eshoping.webservice.up.model.base.UserJson;
import cn.fuego.misp.constant.MispCommonIDName;
import cn.fuego.misp.ui.info.MispInfoListActivity;
import cn.fuego.misp.ui.model.CommonItemMeta;

public class UserInfoActivity extends MispInfoListActivity  
{

	private static String MODIFY_INFO = "修改信息";
	private static String MODIFY_PASSWORD = "修改密码";

	@Override
	public void initRes()
	{
		super.initRes();
		this.activityRes.setAvtivityView(R.layout.user_info_display);
		this.listViewRes.setListView(MispCommonIDName.misp_info_list);
		this.activityRes.setName("我的资料");
 		this.getDataList().clear();
		this.getDataList().addAll(getBtnData());

	}
	
 
	private List<CommonItemMeta> getBtnData()
	{
		CustomerJson customer = AppCache.getInstance().getCustomer();
		List<CommonItemMeta> list = new ArrayList<CommonItemMeta>();
		UserJson user = AppCache.getInstance().getUser();

		if(null != user && null != customer)
		{
			list.add(new CommonItemMeta(CommonItemMeta.DIVIDER_ITEM, null, null));

			
			list.add(new CommonItemMeta(CommonItemMeta.BUTTON_TO_EDIT_ITEM, "用户名", user.getUsername()));
 			list.add(new CommonItemMeta(CommonItemMeta.BUTTON_TO_EDIT_ITEM, "积分", customer.getScore()));
			
			list.add(new CommonItemMeta(CommonItemMeta.DIVIDER_ITEM, null, null));

    		list.add(new CommonItemMeta(CommonItemMeta.BUTTON_TO_EDIT_ITEM, "手机号码", customer.getCellphone()));
			list.add(new CommonItemMeta(CommonItemMeta.BUTTON_TO_EDIT_ITEM, "邮箱", customer.getEmail()));

 			
			
 			list.add(new CommonItemMeta(CommonItemMeta.BUTTON_TO_EDIT_ITEM, MODIFY_PASSWORD, ""));


		}
	 
		
		return list;
	}

 

	
 	@Override
	public void onItemListClick(AdapterView<?> parent, View view, long id,
			CommonItemMeta item)
	{
		if(CommonItemMeta.BUTTON_TO_EDIT_ITEM == item.getLayoutType())
		{
			String title =   item.getTitle();
  
			if(MODIFY_PASSWORD.equals(title))
			{
				 toResetPwd();
			}
 		}
	}

 
	protected void toResetPwd()
	{
 		//转至主页面
		Intent intent = new Intent();
		intent.setClass(this,ResetPwdActivity.class);
		startActivity(intent);
	}
	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data)
	{
		// TODO Auto-generated method stub
		super.onActivityResult(requestCode, resultCode, data);
		this.refreshList(this.getBtnData());
		 
	}
	
	public void logoutBtnEvent(View v)
	{
 		AppCache.getInstance().cleanToken();
		AppCache.getInstance().cleanUser();
		//转至主页面
		Intent intent = new Intent();
		intent.setClass(this,MainTabbarActivity.class);
		startActivity(intent);
	}
	 
 


}
