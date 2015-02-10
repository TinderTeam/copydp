/**   
* @Title: ErrorMessageConst.java 
* @Package cn.fuego.smart.home.constant 
* @Description: TODO
* @author Tang Jun   
* @date 2014-10-24 下午10:42:34 
* @version V1.0   
*/ 
package cn.fuego.eshoping.constant;

import cn.fuego.misp.constant.MISPErrorMessageConst;

 /** 
 * @ClassName: ErrorMessageConst 
 * @Description: TODO
 * @author Tang Jun
 * @date 2014-10-24 下午10:42:34 
 *  
 */
public class ErrorMessageConst extends MISPErrorMessageConst
{
 
	
	public static final int USER_UNCHECKED= 10000 ;//用户未审核
	public static final int USER_APPROVAL_REFUSED = 10001 ;  //用户审核未通过
	public static final int CODE_IS_INVALID = 10002 ;  //激活码已失效
	public static final int ACTIVITY_ORDER_DUPLICATE= 10003 ; //活动重复参与
	public static final int ACTIVITY_ORDER_MAXIMUM = 10004 ;  //活动订单已达上限
	public static final int BUY_TIMES_OVER= 10005 ; // 购买次数超过限制
	public static final int PRODUCT_NOT_EXIST = 10006 ; //产品不存在

	public static final int SELLER_NOT_EXIST = 10007 ; //商家不存在
	public static final int ORDER_TYPE_WRONG = 10008 ; //订单类型错误
}
