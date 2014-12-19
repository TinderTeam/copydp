package cn.fuego.eshoping.ui.util;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.widget.ImageView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.misp.service.MemoryCache;

public class LoadImageUtil
{
	private FuegoLog log = FuegoLog.getLog(getClass());
	private final Map<String, Drawable> cache = new HashMap<String, Drawable>();
 
	
	public void loadImage(final ImageView imageView, final String urlString,
			boolean useCache)
	{
		if (useCache && cache.containsKey(urlString))
		{
			imageView.setImageDrawable(cache.get(urlString));
		}

		// Show a "Loading" image here
		imageView.setImageResource(R.drawable.loading_image);

		log.info("Image url:" + urlString);

		final Handler handler = new Handler()
		{
			@Override
			public void handleMessage(Message message)
			{
				imageView.setImageDrawable((Drawable) message.obj);
			}
		};

		Runnable runnable = new Runnable()
		{
			public void run()
			{
				Drawable drawable = null;
				try
				{
					InputStream is = download(urlString);
					drawable = Drawable.createFromStream(is, "src");

					if (drawable != null)
					{
						cache.put(urlString, drawable);
					}
				} catch (Exception e)
				{
					Log.e(this.getClass().getSimpleName(),
							"Image download failed", e);
					// Show a "download fail" image
					drawable = imageView.getResources().getDrawable(
							R.drawable.load_image_failed);
				}

				// Notify UI thread to show this image using Handler
				Message msg = handler.obtainMessage(1, drawable);
				handler.sendMessage(msg);
			}
		};
		new Thread(runnable).start();
	}

	private InputStream download(String urlString)
			throws MalformedURLException, IOException
	{
		InputStream inputStream = (InputStream) new URL(urlString).getContent();
		return inputStream;
	}
}
