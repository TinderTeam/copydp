package cn.fuego.eshoping.webservice.up.model.base;

import java.io.Serializable;

public class QrcodeJson implements Serializable 
{
	//{"type":"sellerID","value":"91"}
	private String type;
	private int value;
	
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public int getValue()
	{
		return value;
	}
	public void setValue(int value)
	{
		this.value = value;
	}
	
}
