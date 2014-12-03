package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;
import cn.fuego.eshoping.webservice.up.model.base.CustomerJson;
import cn.fuego.eshoping.webservice.up.model.base.UserJson;

public class RegisterReq extends BaseJsonReq
{
	private UserJson user;				//用户信息
	private CustomerJson customer;		//消费者信息
	private String code;				//注册码
	
	public UserJson getUser() {
		return user;
	}
	public void setUser(UserJson user) {
		this.user = user;
	}
	public CustomerJson getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerJson customer) {
		this.customer = customer;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "RegisterReq [user=" + user + ", customer=" + customer
				+ ", code=" + code + "]";
	}
	
}
