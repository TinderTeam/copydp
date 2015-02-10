/**   
* @Title: ModifyPwdReq.java 
* @Package cn.fuego.smart.home.webservice.from.client.model 
* @Description: TODO
* @author Tang Jun   
* @date 2014-11-4 下午11:07:00 
* @version V1.0   
*/ 
package cn.fuego.eshoping.webservice.up.model;

import android.renderscript.Type.CubemapFace;
import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;
import cn.fuego.eshoping.webservice.up.model.base.CustomerJson;
import cn.fuego.eshoping.webservice.up.model.base.UserJson;

 /** 
 * @ClassName: ModifyPwdReq 
 * @Description: TODO
 * @author Tang Jun
 * @date 2014-11-4 下午11:07:00 
 *  
 */
public class ModifyCustomerReq extends BaseJsonReq
{
	 
	private CustomerJson customer;

	public CustomerJson getCustomer()
	{
		return customer;
	}

	public void setCustomer(CustomerJson customer)
	{
		this.customer = customer;
	}
	 
	
 
	

}
