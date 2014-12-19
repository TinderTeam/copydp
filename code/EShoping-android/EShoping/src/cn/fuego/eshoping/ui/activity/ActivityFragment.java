package cn.fuego.eshoping.ui.activity;

import java.util.List;

import android.view.View;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.validate.ValidatorUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.ui.FragmentResInfo;
import cn.fuego.eshoping.webservice.up.model.GetActivityListReq;
import cn.fuego.eshoping.webservice.up.model.GetActivityListRsp;
import cn.fuego.eshoping.webservice.up.model.base.ActivityJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.service.http.MispHttpMessage;
import cn.fuego.misp.ui.list.MispListFragment;

public class ActivityFragment extends MispListFragment<ActivityJson>
{

	private FuegoLog log = FuegoLog.getLog(getClass());

	@Override
	public FragmentResInfo getResource()
	{
		FragmentResInfo resource = new FragmentResInfo();
		resource.setImage(R.drawable.tabbar_activity_icon);
		resource.setName(R.string.tabbar_activity);
		
		resource.setFragmentView(R.layout.activity_fragment);
		resource.setListView(R.id.activity_list);
		resource.setListItemView(R.layout.news_list_item);
		resource.setClickActivityClass(ActivityInfoActivity.class);
		
		return resource;
	}

	@Override
	public void loadSendList()
	{
		GetActivityListReq req = new GetActivityListReq();
		req.setCity(MemoryCache.getCurCity());
 		WebServiceContext.getInstance().getActivityManageRest(this).getActivityList(req);
	}
	@Override
	public List<ActivityJson> loadListRecv(Object obj)
	{
		 GetActivityListRsp rsp = (GetActivityListRsp) obj;
		 return rsp.getActivityList();
	}
 
	@Override
	public View getListItemView(View view, ActivityJson item)
	{
		TextView titleView = (TextView) view.findViewById(R.id.news_list_item_title);
		titleView.setText(item.getTitle());
		return view;
	}



}
