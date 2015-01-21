package cn.fuego.misp.service.http;

import android.os.Message;
import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.misp.constant.MISPErrorMessageConst;

public class MispHttpMessage 
{
	private Message message = new Message();

	public Message getMessage()
	{
		return message;
	}

	public void setMessage(Message message)
	{
		this.message = message;
	}
	
	public boolean isSuccess()
	{
		if(MISPErrorMessageConst.SUCCESS != message.what)
		{
			return false;
		}
		if(MISPErrorMessageConst.SUCCESS != getErrorCode())
		{
			return false;
		}
		return true;
		 
	}
	
	public boolean isNetSuccess()
	{
		if(MISPErrorMessageConst.SUCCESS != message.what)
		{
			return false;
		}
		return true;
	}

	public int getErrorCode()
	{
		BaseJsonRsp rsp = (BaseJsonRsp) message.obj;
		if(null != rsp)
		{
			if(null != rsp.getResult())
			{
 				return rsp.getResult().getErrorCode();
			}
		}
		return MISPErrorMessageConst.ERROR_NET_FAIL;
	}
	

}
