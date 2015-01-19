package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;
import cn.fuego.eshoping.webservice.up.model.base.UserJson;

public class SetUserGradeReq extends BaseJsonReq
{
	private UserJson user;				//用户信息

	public UserJson getUser() {
		return user;
	}

	public void setUser(UserJson user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "SetUserGradeReq [user=" + user + ", token=" + token + "]";
	}
	
	
}
