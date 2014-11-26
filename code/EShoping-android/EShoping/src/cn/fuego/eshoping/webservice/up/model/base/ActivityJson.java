package cn.fuego.eshoping.webservice.up.model.base;

import java.util.Date;

public class ActivityJson
{
	private int activity_id;
	private String title;
	private Date datetime;
	private String dscr;
	private String address;
	private String info;
	private String note;
	private String status;
	private String city_id;
	private String datelimit;
	private String memberlimit;
	private String imgsrc;
	private String point;
	public int getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
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
	public String getDscr() {
		return dscr;
	}
	public void setDscr(String dscr) {
		this.dscr = dscr;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCity_id() {
		return city_id;
	}
	public void setCity_id(String city_id) {
		this.city_id = city_id;
	}
	public String getDatelimit() {
		return datelimit;
	}
	public void setDatelimit(String datelimit) {
		this.datelimit = datelimit;
	}
	public String getMemberlimit() {
		return memberlimit;
	}
	public void setMemberlimit(String memberlimit) {
		this.memberlimit = memberlimit;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "ActivityJson [activity_id=" + activity_id + ", title=" + title
				+ ", datetime=" + datetime + ", dscr=" + dscr + ", address="
				+ address + ", info=" + info + ", note=" + note + ", status="
				+ status + ", city_id=" + city_id + ", datelimit=" + datelimit
				+ ", memberlimit=" + memberlimit + ", imgsrc=" + imgsrc
				+ ", point=" + point + "]";
	}
	
 
}
