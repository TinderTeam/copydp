package cn.fuego.eshoping.ui.base;

import java.io.Serializable;

public class CommonItemMeta implements Serializable
{
	private String title;
	private String type;
	private Integer titleIamge = null; //if no title image the value is empty
	private Object content;
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public Integer getTitleIamge()
	{
		return titleIamge;
	}
	public void setTitleIamge(Integer titleIamge)
	{
		this.titleIamge = titleIamge;
	}
	public Object getContent()
	{
		return content;
	}
	public void setContent(Object content)
	{
		this.content = content;
	}
	
	

}
