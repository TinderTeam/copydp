package cn.fuego.eshoping.ui.news;

import java.util.List;

import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.webservice.up.model.GetActivityListReq;
import cn.fuego.eshoping.webservice.up.model.GetActivityListRsp;
import cn.fuego.eshoping.webservice.up.model.GetNewsListReq;
import cn.fuego.eshoping.webservice.up.model.GetNewsListRsp;
import cn.fuego.eshoping.webservice.up.model.base.ActivityJson;
import cn.fuego.eshoping.webservice.up.model.base.NewsJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.base.FragmentResInfo;
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
