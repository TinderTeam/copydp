package cn.fuego.eshoping.webservice.up.rest;


import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import cn.fuego.eshoping.webservice.up.model.GetCityListReq;
import cn.fuego.eshoping.webservice.up.model.GetCityListRsp;
import cn.fuego.eshoping.webservice.up.model.LoginReq;
import cn.fuego.eshoping.webservice.up.model.LoginRsp;
import cn.fuego.eshoping.webservice.up.model.ModifyPwdReq;
import cn.fuego.eshoping.webservice.up.model.ModifyPwdRsp;
import cn.fuego.eshoping.webservice.up.model.RegisterReq;
import cn.fuego.eshoping.webservice.up.model.RegisterRsp;


/**
 * 
* @ClassName: UserManageService 
* @Description: TODO
* @author Tang Jun
* @date 2014-10-20 上午10:53:45 
*
 */

@Path("/Index")
@Produces("application/json")  
@Consumes("application/json")  
public interface UserManageRest
{
	@POST
	@Path("/login_rest")
	LoginRsp login(LoginReq req);
	
	@POST
	@Path("/logout_rest")
	LoginRsp logout(LoginReq req);
	
	
	@POST
	@Path("/modifyPswd_rest")
    ModifyPwdRsp modifyPassword(ModifyPwdReq req);
	
	@POST
	@Path("/register_rest")
	RegisterRsp registerMemeber(RegisterReq req);
	
	@POST
	@Path("/city_rest")
	GetCityListRsp getCityList(GetCityListReq req);
 
 
}
