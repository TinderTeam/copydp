package cn.fuego.misp.ui.list;

import android.view.View;
import cn.fuego.misp.ui.base.MispHttpFragment;

public abstract class MispBaseListFragment<E> extends MispHttpFragment
{
	public abstract View getListItemView(View view, E item);
}
