package cn.fuego.eshoping.ui;

import cn.fuego.eshoping.R;



public class FragmentResInfo
{
	private int image = R.drawable.tabbar_defualt_icon;
	private int name = R.string.tabbar_default;
	
	private int fragmentView;
	private int listView;
	private int listItemView;
	private Class clickActivityClass;
 
	public int getImage()
	{
		return image;
	}
	public void setImage(int image)
	{
		this.image = image;
	}
	public int getName()
	{
		return name;
	}
	public void setName(int name)
	{
		this.name = name;
	}
	public int getListView()
	{
		return listView;
	}
	public void setListView(int listView)
	{
		this.listView = listView;
	}
	public int getListItemView()
	{
		return listItemView;
	}
	public void setListItemView(int listItemView)
	{
		this.listItemView = listItemView;
	}
	public Class getClickActivityClass()
	{
		return clickActivityClass;
	}
	public void setClickActivityClass(Class clickActivityClass)
	{
		this.clickActivityClass = clickActivityClass;
	}
	public int getFragmentView()
	{
		return fragmentView;
	}
	public void setFragmentView(int fragmentView)
	{
		this.fragmentView = fragmentView;
	}
 
 }
	
 