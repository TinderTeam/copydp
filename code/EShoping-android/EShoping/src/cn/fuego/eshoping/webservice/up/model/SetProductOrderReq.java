package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;
public class SetProductOrderReq extends BaseJsonReq
{
	private int userID;			//下单用户ID
	private int productID;			//下单产品ID
	private int quantity;			//下单数量
	private String orderID;        //订单号删除订单，取消订单接口使用
	private int seller_id;			//扫码下单需要填写改字段
	private String order_type;		//订单类型，APP下单时使用，分为“普通下单”和“扫码下单”
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getOrderID() {
		return orderID;
	}
	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	
	public int getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}
	public String getOrder_type() {
		return order_type;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	@Override
	public String toString() {
		return "SetProductOrderReq [userID=" + userID + ", productID="
				+ productID + ", quantity=" + quantity + ", orderID=" + orderID
				+ ", seller_id=" + seller_id + ", order_type=" + order_type
				+ ", token=" + token + "]";
	}

}
