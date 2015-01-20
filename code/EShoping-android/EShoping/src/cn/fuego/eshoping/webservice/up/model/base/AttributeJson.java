package cn.fuego.eshoping.webservice.up.model.base;

import java.io.Serializable;

/**
 * 
* @ClassName: AttributeJson 
* @Description: TODO
* @author Tang Jun
* @date 2014-10-20 上午10:57:36 
*
 */
public class AttributeJson implements Serializable
{

	private String attrName;
	private String attrValue;
	public String getAttrName()
	{
		return attrName;
	}
	public void setAttrName(String attrName)
	{
		this.attrName = attrName;
	}
	public String getAttrValue()
	{
		return attrValue;
	}
	public void setAttrValue(String attrValue)
	{
		this.attrValue = attrValue;
	}
	@Override
	public String toString()
	{
		return "AttributeJson [attrName=" + attrName + ", attrValue="
				+ attrValue + "]";
	}
	
	
}
