package cn.fuego.eshoping.ui.activity;

import java.util.List;

import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import cn.fuego.common.log.FuegoLog;
import cn.fuego.common.util.format.DateUtil;
import cn.fuego.eshoping.R;
import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.ui.util.DataConvertUtil;
import cn.fuego.eshoping.webservice.up.model.GetActivityListReq;
import cn.fuego.eshoping.webservice.up.model.GetActivityListRsp;
import cn.fuego.eshoping.webservice.up.model.base.ActivityJson;
import cn.fuego.eshoping.webservice.up.rest.WebServiceContext;
import cn.fuego.misp.service.MemoryCache;
import cn.fuego.misp.ui.list.MispListFragment;
import cn.fuego.misp.ui.util.LoadImageUtil;

public class ActivityFragment extends MispListFragment<ActivityJson>
{

	private FuegoLog log = FuegoLog.getLog(getClass());


	@Override
	public void initRes()
	{ 
		this.fragmentRes.setImage(R.drawable.tabbar_activity_icon);
		this.fragmentRes.setName(R.string.tabbar_activity);
		this.fragmentRes.setFragmentView(R.layout.activity_fragment);
		
		this.listViewRes.setListView(R.id.activity_list);
		this.listViewRes.setListItemView(R.layout.activity_list_item);
		this.listViewRes.setClickActivityClass(ActivityInfoActivity.class);
		
 	}
 
	@Override
	public void loadSendList()
	{
		GetActivityListReq req = new GetActivityListReq();
		req.setCity(AppCache.getCurCity());
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
		TextView titleView = (TextView) view.findViewById(R.id.order_activity_name);
		titleView.setText(item.getTitle());
		
		TextView contentView = (TextView) view.findViewById(R.id.activity_content);
		contentView.setText(item.getDscr());
		
		TextView limitView = (TextView) view.findViewById(R.id.activity_stop_date);
		limitView.setText(item.getDatelimit());

		TextView attentView = (TextView) view.findViewById(R.id.activity_attend_num);
		attentView.setText(item.getCurrent_member()+"/"+item.getMemberlimit());
		
		ImageView imageView = (ImageView) view.findViewById(R.id.order_product_img);
		LoadImageUtil.getInstance().loadImage(imageView, DataConvertUtil.getAbsUrl(item.getImgsrc()));
		return view;
	}



}
