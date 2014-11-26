package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.ButtonJson;
import cn.fuego.eshoping.webservice.up.model.base.CustomerJson;
import cn.fuego.eshoping.webservice.up.model.base.MenuJson;
import cn.fuego.eshoping.webservice.up.model.base.UserJson;



/**
 * 
* @ClassName: LoginRsp 
* @Description: TODO
* @author Tang Jun
* @date 2014-10-20 上午10:59:34 
*
 */
public class LoginRsp extends BaseJsonRsp
{
	private UserJson user;
	private CustomerJson customer;
	private String token;
	private List<MenuJson> menuList = new ArrayList<MenuJson>();
	private List<ButtonJson> buttonList = new ArrayList<ButtonJson>();
	public UserJson getUser()
	{
		return user;
	}
	public void setUser(UserJson user)
	{
		this.user = user;
	}
	public String getToken()
	{
		return token;
	}
	public void setToken(String token)
	{
		this.token = token;
	}
	public List<MenuJson> getMenuList()
	{
		return menuList;
	}
	public void setMenuList(List<MenuJson> menuList)
	{
		this.menuList = menuList;
	}
	public List<ButtonJson> getButtonList()
	{
		return buttonList;
	}
	public void setButtonList(List<ButtonJson> buttonList)
	{
		this.buttonList = buttonList;
	}
	
	public CustomerJson getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerJson customer) {
		this.customer = customer;
	}
	@Override
	public String toString() {
		return "LoginRsp [user=" + user + ", customer=" + customer + ", token="
				+ token + ", menuList=" + menuList + ", buttonList="
				+ buttonList + ", result=" + result + "]";
	}
 

}
