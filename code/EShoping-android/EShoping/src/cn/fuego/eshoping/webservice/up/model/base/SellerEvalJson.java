package cn.fuego.eshoping.webservice.up.model.base;

public class SellerEvalJson
{
	private int seller_eva_id;
	private int customer_id;
	private String datetime;
	private int score_environment;
	private int score_service;
	private String eva_content;
	private int seller_id;
	private int order_id;
	public int getSeller_eva_id() {
		return seller_eva_id;
	}
	public void setSeller_eva_id(int seller_eva_id) {
		this.seller_eva_id = seller_eva_id;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public int getScore_environment() {
		return score_environment;
	}
	public void setScore_environment(int score_environment) {
		this.score_environment = score_environment;
	}
	public int getScore_service() {
		return score_service;
	}
	public void setScore_service(int score_service) {
		this.score_service = score_service;
	}
	public String getEva_content() {
		return eva_content;
	}
	public void setEva_content(String eva_content) {
		this.eva_content = eva_content;
	}
	public int getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	@Override
	public String toString() {
		return "SellerEvalJson [seller_eva_id=" + seller_eva_id
				+ ", customer_id=" + customer_id + ", datetime=" + datetime
				+ ", score_environment=" + score_environment
				+ ", score_service=" + score_service + ", eva_content="
				+ eva_content + ", seller_id=" + seller_id + ", order_id="
				+ order_id + "]";
	}
 
}
