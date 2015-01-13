package cn.fuego.eshoping.service.verification;

public class VerificationService
{
	/**
	 * 产品下单校验
	 * 跟业务相关的一些逻辑，比如：只有客户可以下单，或者SVIP产品下单校验的问题
	 * 这里日后要进行一下拓展
	 * @param id
	 * @return
	 */
	public static boolean buyProductVerification(int id){
		if(id==0){
			return false;	
		}
		return true;
	}
}
