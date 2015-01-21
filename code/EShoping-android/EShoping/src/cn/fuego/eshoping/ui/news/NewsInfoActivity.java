package cn.fuego.eshoping.ui.news;

import android.content.Intent;
import android.os.Bundle;
import android.text.Html;
import android.text.method.ScrollingMovementMethod;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.format.DateUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.base.BaseActivtiy;
import cn.fuego.eshoping.webservice.up.model.base.NewsJson;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.model.ListViewResInfo;

import com.baidu.mapapi.SDKInitializer;

public class NewsInfoActivity extends BaseActivtiy
{
	private FuegoLog log = FuegoLog.getLog(NewsInfoActivity.class);
	
	//View成员
	private TextView titleView;
	private TextView dateView;
	private TextView contentView;
	private NewsJson news;
	
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
		dateView = (TextView) findViewById(R.id.news_info_date);
		contentView = (TextView) findViewById(R.id.news_info_content);
		
		//View赋值
		titleView.setText(news.getTitle());
		dateView.setText(DateUtil.DateToShotString(news.getDatetime()));	
		contentView.setMovementMethod(ScrollingMovementMethod.getInstance());//滚动  
		contentView.setText(Html.fromHtml(news.getContent()));
	}

	

	@Override
	public void handle(MispHttpMessage message)
	{
		// TODO Auto-generated method stub

	}



}
