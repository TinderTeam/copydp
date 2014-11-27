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
public class CommunityDiscussSum
{
	private int community_id;
	private String title;
	private int discuss_num;
	
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
	public int getDiscuss_num() {
		return discuss_num;
	}
	public void setDiscuss_num(int discuss_num) {
		this.discuss_num = discuss_num;
	}
	@Override
	public String toString() {
		return "CommunityDiscussSum [community_id=" + community_id + ", title="
				+ title + ", discuss_num=" + discuss_num + "]";
	}
	
	
}
