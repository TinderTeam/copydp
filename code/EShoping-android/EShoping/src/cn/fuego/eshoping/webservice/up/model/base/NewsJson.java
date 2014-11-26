package cn.fuego.eshoping.webservice.up.model.base;

import java.util.Date;

public class NewsJson
{
	private int news_id;
	private String title;
	private Date datetime;
	private String content;
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "NewsJson [news_id=" + news_id + ", title=" + title
				+ ", datetime=" + datetime + ", content=" + content + "]";
	}
	
}
