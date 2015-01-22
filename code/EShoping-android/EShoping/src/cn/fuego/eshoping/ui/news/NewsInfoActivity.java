package cn.fuego.eshoping.ui.news;

import android.content.Intent;
import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.webservice.up.model.base.NewsJson;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.model.ListViewResInfo;

public class NewsInfoActivity extends BaseActivtiy
{
	private FuegoLog log = FuegoLog.getLog(NewsInfoActivity.class);
	
	//View成员
	private TextView titleView;
 
	private NewsJson news;
	private WebView descriptionView;
	
	@Override
	public void initRes()
	{
		this.activityRes.setAvtivityView(R.layout.news_info);
		this.activityRes.setBackBtn(R.id.com_back_btn);
		this.activityRes.setTitleTextView(R.id.com_head_title);
	}

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		
		//获取数据
		Intent intent = this.getIntent();	
		news=(NewsJson) intent.getSerializableExtra(ListViewResInfo.SELECT_ITEM);
		
		//View
		titleView = (TextView) findViewById(R.id.news_info_title);
 
		
		//View赋值
		titleView.setText(news.getTitle());
 
		descriptionView = (WebView) findViewById(R.id.newsDescription);

		descriptionView.getSettings().setTextSize(WebSettings.TextSize.LARGER);
		
		descriptionView.loadData(news.getContent(), "text/html; charset=UTF-8", null);
		
		
		
	}

	

	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub

	}



}
