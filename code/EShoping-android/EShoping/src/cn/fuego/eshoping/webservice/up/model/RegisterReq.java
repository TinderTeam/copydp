package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;
import cn.fuego.eshoping.webservice.up.model.base.CustomerJson;
import cn.fuego.eshoping.webservice.up.model.base.UserJson;

public class RegisterReq extends BaseJsonReq
{
	private UserJson user;
	private CustomerJson customer;
	private String code;

}
