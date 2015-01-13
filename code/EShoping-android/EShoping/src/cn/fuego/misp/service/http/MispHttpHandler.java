package cn.fuego.misp.service.http;

import android.os.Handler;
import android.os.Message;

public abstract class MispHttpHandler implements HttpListener
{
	private Handler handler = new Handler()
	{
		@Override
  		public void handleMessage(Message msg) 
		{
			 super.handleMessage(msg);
			 MispHttpMessage mispMessage = new MispHttpMessage();
			 mispMessage.setMessage(msg);
			 handle(mispMessage);
		}
	
	};


	@Override
	public void sendMessage(MispHttpMessage message)
	{
		handler.sendMessage(message.getMessage());
		
	}


	/**
	 * @return the handler
	 */
	public Handler getHandler()
	{
		return handler;
	}


	/**
	 * @param handler the handler to set
	 */
	public void setHandler(Handler handler)
	{
		this.handler = handler;
	}
 

}
