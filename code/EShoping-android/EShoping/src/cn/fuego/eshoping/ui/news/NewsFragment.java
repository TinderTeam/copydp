package cn.fuego.eshoping.ui.news;

import java.util.List;

import android.view.View;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.FragmentResInfo;
import cn.fuego.eshoping.webservice.up.model.GetActivityListReq;
import cn.fuego.eshoping.webservice.up.model.GetActivityListRsp;
import cn.fuego.eshoping.webservice.up.model.GetNewsListReq;
import cn.fuego.eshoping.webservice.up.model.GetNewsListRsp;
import cn.fuego.eshoping.webservice.up.model.base.ActivityJson;
import cn.fuego.eshoping.webservice.up.model.base.NewsJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.list.MispListFragment;

public class NewsFragment extends MispListFragment<NewsJson>
{
	
	private FuegoLog log = FuegoLog.getLog(getClass());

	@Override
	public FragmentResInfo getResource()
	{
		FragmentResInfo resource = new FragmentResInfo();

		resource.setImage(R.drawable.tabbar_news_icon);
		resource.setName(R.string.tabbar_news);
		
		resource.setFragmentView(R.layout.news_fragment);
		resource.setListView(R.id.news_list);
		resource.setListItemView(R.layout.news_list_item);
		resource.setClickActivityClass(NewsInfoActivity.class);
		
		return resource;
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
		TextView titleView = (TextView) view.findViewById(R.id.news_list_item_title);
		titleView.setText(item.getTitle());
		return view;
	}
 
}
