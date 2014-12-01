package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;
public class SetProductOrderReq extends BaseJsonReq
{
	private int userID;			//下单用户ID
	private int productID;			//下单产品ID
	private int quantity;			//下单数量
	
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
	@Override
	public String toString() {
		return "SetProductOrderReq [userID=" + userID + ", productID="
				+ productID + ", quantity=" + quantity + ", token=" + token
				+ "]";
	}

	
	

}
