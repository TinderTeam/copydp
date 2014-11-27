package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;
public class SetProductOrderReq extends BaseJsonReq
{
	private int userID;
	private int productID;
	private int quantity;
	private String orderID;
	
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
	@Override
	public String toString() {
		return "SetProductOrderReq [userID=" + userID + ", productID="
				+ productID + ", quantity=" + quantity + ", orderID=" + orderID
				+ ", token=" + token + "]";
	}
	
	

}
