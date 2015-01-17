package cn.fuego.eshoping.webservice.up.model.base;

public class ProductEvalJson
{
	private int product_eva_id;
	private int product_id;
	private int customer_id;
	private int order_id;
	private String user_name;
	private int score_product;
	private String eva_content;
	private String datetime;
	public int getProduct_eva_id() {
		return product_eva_id;
	}
	public void setProduct_eva_id(int product_eva_id) {
		this.product_eva_id = product_eva_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getScore_product() {
		return score_product;
	}
	public void setScore_product(int score_product) {
		this.score_product = score_product;
	}
	public String getEva_content() {
		return eva_content;
	}
	public void setEva_content(String eva_content) {
		this.eva_content = eva_content;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	@Override
	public String toString() {
		return "ProductEvalJson [product_eva_id=" + product_eva_id
				+ ", product_id=" + product_id + ", customer_id=" + customer_id
				+ ", order_id=" + order_id + ", user_name=" + user_name
				+ ", score_product=" + score_product + ", eva_content="
				+ eva_content + ", datetime=" + datetime + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
 
}
