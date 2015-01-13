package cn.fuego.eshoping.ui.news;

import java.util.List;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.format.DateUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.webservice.up.model.GetNewsListReq;
import cn.fuego.eshoping.webservice.up.model.GetNewsListRsp;
import cn.fuego.eshoping.webservice.up.model.base.NewsJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.ui.list.MispListAdapter;
import cn.fuego.misp.ui.list.MispListFragment;

public class NewsFragment extends MispListFragment<NewsJson>
{
	
	private FuegoLog log = FuegoLog.getLog(getClass());

	@Override
	public void initRes()
	{ 
		this.fragmentRes.setImage(R.drawable.tabbar_news_icon);
		this.fragmentRes.setName(R.string.tabbar_news);
		this.fragmentRes.setFragmentView(R.layout.news_fragment);		
		this.listViewRes.setListView(R.id.news_list);
		this.listViewRes.setListItemView(R.layout.news_list_item);
		this.listViewRes.setClickActivityClass(NewsInfoActivity.class);		
		this.fragmentRes.setTitleView(R.id.com_head_title);
 	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState)
	{
		View rootView=super.onCreateView(inflater, container, savedInstanceState);			
		return rootView;
	}
	
	@Override
	public void loadSendList()
	{
		GetNewsListReq req = new GetNewsListReq();
 		WebServiceContext.getInstance().getNewsManageRest(this).getNewsList(req);
	}
 
	@Override
	public List<NewsJson> loadListRecv(Object obj)
	{
		GetNewsListRsp rsp = (GetNewsListRsp) obj;
		 return rsp.getNewsList();
	}
 

	@Override
	public View getListItemView(View view, NewsJson item)
	{
		/*
		 * View获取
		 */
		log.info("News Item:"+item.toString());	
		TextView listTitleView = (TextView) view.findViewById(R.id.news_list_item_title);
		TextView listDateView = (TextView) view.findViewById(R.id.news_list_item_date);
		/*
		 * View赋值
		 */
		listTitleView.setText(item.getTitle());
		listDateView.setText(DateUtil.DateToShotString(item.getDatetime()));
		return view;
	}

 
}
