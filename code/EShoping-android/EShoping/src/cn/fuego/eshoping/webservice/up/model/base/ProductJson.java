package cn.fuego.eshoping.webservice.up.model.base;

public class ProductJson
{
	private int product_id;
	private String name;
	private int type_id;
	private int seller_id;
	private String update_date;
	private String end_date_time;
	private float price;
	private float original_price;
	private String dscr;
	private String basic_infor;
	private String svip_privilege;
	private String imgsrc;
	private String imglist;
	private String product_status;
	private int city_id;
	private String city;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public int getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}
	
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getEnd_date_time() {
		return end_date_time;
	}
	public void setEnd_date_time(String end_date_time) {
		this.end_date_time = end_date_time;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getOriginal_price() {
		return original_price;
	}
	public void setOriginal_price(float original_price) {
		this.original_price = original_price;
	}
	public String getDscr() {
		return dscr;
	}
	public void setDscr(String dscr) {
		this.dscr = dscr;
	}
	public String getBasic_infor() {
		return basic_infor;
	}
	public void setBasic_infor(String basic_infor) {
		this.basic_infor = basic_infor;
	}
	public String getSvip_privilege() {
		return svip_privilege;
	}
	public void setSvip_privilege(String svip_privilege) {
		this.svip_privilege = svip_privilege;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	public String getImglist() {
		return imglist;
	}
	public void setImglist(String imglist) {
		this.imglist = imglist;
	}
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
	public int getCity_id() {
		return city_id;
	}
	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Override
	public String toString() {
		return "ProductJson [product_id=" + product_id + ", name=" + name
				+ ", type_id=" + type_id + ", seller_id=" + seller_id
				+ ", update_date=" + update_date + ", end_date_time="
				+ end_date_time + ", price=" + price + ", original_price="
				+ original_price + ", dscr=" + dscr + ", basic_infor="
				+ basic_infor + ", svip_privilege=" + svip_privilege
				+ ", imgsrc=" + imgsrc + ", imglist=" + imglist
				+ ", product_status=" + product_status + ", city_id=" + city_id
				+ ", city=" + city + "]";
	}
	

}
