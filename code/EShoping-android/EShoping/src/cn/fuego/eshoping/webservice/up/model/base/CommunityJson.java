/**   
* @Title: UserJson.java 
* @Package cn.fuego.smart.home.webservice.from.client.model.base 
* @Description: TODO
* @author Tang Jun   
* @date 2014-11-1 下午12:13:54 
* @version V1.0   
*/ 
package cn.fuego.eshoping.webservice.up.model.base;

 /** 
 * @ClassName: CommunityJson 
 * @Description: TODO
 * @author Tang Jun
 * @date 2014-11-1 下午12:13:54 
 *  
 */
public class CommunityJson
{
	private int community_id;
	private String title;
	private String community_type;
	private String context;
	private String datetime;
	private int customer_id;
	private long customer_number;
	private String username;
	public int getCommunity_id() {
		return community_id;
	}
	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCommunity_type() {
		return community_type;
	}
	public void setCommunity_type(String community_type) {
		this.community_type = community_type;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public long getCustomer_number() {
		return customer_number;
	}
	public void setCustomer_number(long customer_number) {
		this.customer_number = customer_number;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "CommunityJson [community_id=" + community_id + ", title="
				+ title + ", community_type=" + community_type + ", context="
				+ context + ", datetime=" + datetime + ", customer_id="
				+ customer_id + ", customer_number=" + customer_number
				+ ", username=" + username + "]";
	}
	
	
	
}
