/**   
* @Title: ButtonJson.java 
* @Package cn.fuego.smart.home.webservice.from.client.model.base 
* @Description: TODO
* @author Tang Jun   
* @date 2014-11-1 下午5:46:35 
* @version V1.0   
*/ 
package cn.fuego.eshoping.webservice.up.model.base;

import java.io.Serializable;

 /** 
 * @ClassName: ButtonJson 
 * @Description: TODO
 * @author Tang Jun
 * @date 2014-11-1 下午5:46:35 
 *  
 */
public class ButtonJson implements Serializable
{
	private int id;
	private String name;
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	

}
