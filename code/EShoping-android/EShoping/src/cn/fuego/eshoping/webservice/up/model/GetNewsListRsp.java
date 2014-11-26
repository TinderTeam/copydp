package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.NewsJson;

public class GetNewsListRsp extends BaseJsonRsp
{
	private List<NewsJson> newsList = new ArrayList<NewsJson>();

	public List<NewsJson> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<NewsJson> newsList) {
		this.newsList = newsList;
	}

	@Override
	public String toString() {
		return "GetNewsListRsp [newsList=" + newsList + "]";
	}
	
}
