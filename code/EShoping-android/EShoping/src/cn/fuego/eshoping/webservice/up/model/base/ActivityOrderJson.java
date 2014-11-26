package cn.fuego.eshoping.webservice.up.model.base;

import java.util.Date;

public class ActivityOrderJson
{
	private String activity_order_id;
	private int activity_id;
	private int customer_id;
	private String activity_title;
	private String activity_disc;
	private String imgsrc;
	private int memberlimit;
	private Date datetime;
	private Date datelimit;
	private String status;
	private String activity_status;
	private String username;
	private String grade;
	private String cellphone;
	private String email;
	
	
	public String getActivity_order_id() {
		return activity_order_id;
	}
	public void setActivity_order_id(String activity_order_id) {
		this.activity_order_id = activity_order_id;
	}
	public int getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getActivity_title() {
		return activity_title;
	}
	public void setActivity_title(String activity_title) {
		this.activity_title = activity_title;
	}
	
	public String getActivity_disc() {
		return activity_disc;
	}
	public void setActivity_disc(String activity_disc) {
		this.activity_disc = activity_disc;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	public int getMemberlimit() {
		return memberlimit;
	}
	public void setMemberlimit(int memberlimit) {
		this.memberlimit = memberlimit;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public Date getDatelimit() {
		return datelimit;
	}
	public void setDatelimit(Date datelimit) {
		this.datelimit = datelimit;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getActivity_status() {
		return activity_status;
	}
	public void setActivity_status(String activity_status) {
		this.activity_status = activity_status;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "ActivityOrderJson [activity_order_id=" + activity_order_id
				+ ", activity_id=" + activity_id + ", customer_id="
				+ customer_id + ", activity_title=" + activity_title
				+ ", activity_disc=" + activity_disc + ", imgsrc=" + imgsrc
				+ ", memberlimit=" + memberlimit + ", datetime=" + datetime
				+ ", datelimit=" + datelimit + ", status=" + status
				+ ", activity_status=" + activity_status + ", username="
				+ username + ", grade=" + grade + ", cellphone=" + cellphone
				+ ", email=" + email + "]";
	}
	
	
 
}
