package cn.fuego.misp.ui.list;

import cn.fuego.misp.ui.base.ActivityResInfo;
import cn.fuego.misp.ui.base.MispHttpActivtiy;

public abstract class MispBaseListActivity<E> extends MispHttpActivtiy
{
 
	public ActivityResInfo activityRes = new ActivityResInfo();

	public abstract void initRes();
}
