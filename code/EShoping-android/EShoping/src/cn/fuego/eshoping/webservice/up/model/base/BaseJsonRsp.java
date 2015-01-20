package cn.fuego.eshoping.webservice.up.model.base;

import java.io.Serializable;


/**
 * 
* @ClassName: BaseJsonRsp 
* @Description: TODO
* @author Tang Jun
* @date 2014-10-20 上午10:57:45 
*
 */
public class BaseJsonRsp implements Serializable
{
	protected SetResultJson result = new SetResultJson();

	public SetResultJson getResult()
	{
		return result;
	}

	public void setResult(SetResultJson result)
	{
		this.result = result;
	}

	@Override
	public String toString()
	{
		return "BaseJsonRsp [result=" + result + "]";
	}
	
	
}
