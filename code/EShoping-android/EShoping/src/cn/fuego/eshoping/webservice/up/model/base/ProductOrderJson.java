package cn.fuego.eshoping.webservice.up.model.base;

/**
 * 
* @ClassName: OrderJson 
* @Description: TODO
* @author Tang Jun
* @date 2014-11-21 下午5:34:03 
*
 */
public class ProductOrderJson
{
	private String order_id;
	private String order_name;
	private int customer_id;
	private int product_id;
	private String product_name;
	private String product_description;
	private int seller_id;
	private String order_time;
	private int quantity;
	private float order_price;
	private float order_original_price;
	private String order_status;
	private String note;
	private String imgsrc;
	private String username;
	private String end_date_time;
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public int getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getOrder_price() {
		return order_price;
	}
	public void setOrder_price(float order_price) {
		this.order_price = order_price;
	}
	public float getOrder_original_price() {
		return order_original_price;
	}
	public void setOrder_original_price(float order_original_price) {
		this.order_original_price = order_original_price;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEnd_date_time() {
		return end_date_time;
	}
	public void setEnd_date_time(String end_date_time) {
		this.end_date_time = end_date_time;
	}
	@Override
	public String toString() {
		return "ProductOrderJson [order_id=" + order_id + ", order_name="
				+ order_name + ", customer_id=" + customer_id + ", product_id="
				+ product_id + ", product_name=" + product_name
				+ ", product_description=" + product_description
				+ ", seller_id=" + seller_id + ", order_time=" + order_time
				+ ", quantity=" + quantity + ", order_price=" + order_price
				+ ", order_original_price=" + order_original_price
				+ ", order_status=" + order_status + ", note=" + note
				+ ", imgsrc=" + imgsrc + ", username=" + username
				+ ", end_date_time=" + end_date_time + "]";
	}
	
}
