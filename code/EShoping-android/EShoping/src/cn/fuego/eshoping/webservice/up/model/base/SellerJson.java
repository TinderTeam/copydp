package cn.fuego.eshoping.webservice.up.model.base;

import java.io.Serializable;

public class SellerJson implements Serializable
{
	private int user_id;
	private String seller_name;
	private String city_id;
	private String qr_code;
	private String status;
	private String zone_id;
	private int type_id;
	private String dscr;
	private String position;
	private String img;
	private String info;
	private String type_name;
	private int father_id;
	private String city;
	private String zone_name;
	private String password;
	private String username;
	private String role;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public String getSeller_name() {
		return seller_name;
	}
	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	public String getCity_id() {
		return city_id;
	}
	public void setCity_id(String city_id) {
		this.city_id = city_id;
	}
	
	public String getQr_code() {
		return qr_code;
	}
	public void setQr_code(String qr_code) {
		this.qr_code = qr_code;
	}
	public String getZone_id() {
		return zone_id;
	}
	public void setZone_id(String zone_id) {
		this.zone_id = zone_id;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getDscr() {
		return dscr;
	}
	public void setDscr(String dscr) {
		this.dscr = dscr;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public int getFather_id() {
		return father_id;
	}
	public void setFather_id(int father_id) {
		this.father_id = father_id;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getZone_name() {
		return zone_name;
	}
	public void setZone_name(String zone_name) {
		this.zone_name = zone_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "SellerJson [user_id=" + user_id + ", seller_name="
				+ seller_name + ", city_id=" + city_id + ", qr_code=" + qr_code
				+ ", status=" + status + ", zone_id=" + zone_id + ", type_id="
				+ type_id + ", dscr=" + dscr + ", position=" + position
				+ ", img=" + img + ", info=" + info + ", type_name="
				+ type_name + ", father_id=" + father_id + ", city=" + city
				+ ", zone_name=" + zone_name + ", password=" + password
				+ ", username=" + username + ", role=" + role + "]";
	}
	
 
}
