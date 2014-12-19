package cn.fuego.eshoping.ui.news;

import android.view.View;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.FragmentResInfo;
import cn.fuego.eshoping.ui.base.MispListFragment;
import cn.fuego.eshoping.webservice.up.model.GetNewsListReq;
import cn.fuego.eshoping.webservice.up.model.GetNewsListRsp;
import cn.fuego.eshoping.webservice.up.model.base.NewsJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.http.MispHttpMessage;

public class NewsFragment extends MispListFragment<NewsJson>
{
	
	private FuegoLog log = FuegoLog.getLog(getClass());

	@Override
	public FragmentResInfo getResource()
	{
		resource.setImage(R.drawable.tabbar_news_icon);
		resource.setName(R.string.tabbar_news);
		resource.setListView(R.layout.news_fragment);
		//resource.setListItemView(listItemView);
		resource.setClickActivityClass(NewsInfoActivity.class);
		
		return resource;
	}

	@Override
	public void loadList()
	{
		GetNewsListReq req = new GetNewsListReq();
		
 		WebServiceContext.getInstance().getNewsManageRest(this).getNewsList(req);
	}
	@Override
	public void handle(MispHttpMessage message)
	{
		if (message.isSuccess())
		{
			 this.dataList.clear();

			 GetNewsListRsp rsp = (GetNewsListRsp) message.getMessage().obj;
					if(!ValidatorUtil.isEmpty(rsp.getNewsList()))
					{
						this.adapter.addAll(rsp.getNewsList());
					}

					this.adapter.notifyDataSetChanged();
 

		}
		else
		{
			log.error("query product failed");
			this.showMessage(message);
		}
	}


	@Override
	public View getListItemView(View view, NewsJson item)
	{
		// TODO Auto-generated method stub
		return null;
	}
 
}
