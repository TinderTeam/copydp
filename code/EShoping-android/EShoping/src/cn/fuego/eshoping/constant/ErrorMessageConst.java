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
	public static final int GET_PRODUCT_ORDER_FAILED = 10006 ; // 获取产品订单失败
	public static final int GET_ACTIVITY_ORDER_FAILED = 10007 ; // 获取产品订单失败
	public static final int OPREATE_DEVICE_FAILED= 10008 ; // 操作设备失败  
}
