package cn.fuego.eshoping.service.verification;

import cn.fuego.eshoping.cache.AppCache;
import cn.fuego.eshoping.webservice.up.model.base.ProductJson;

public class VerificationService
{
	/**
	 * 产品下单校验
	 * 跟业务相关的一些逻辑，比如：只有客户可以下单，或者SVIP产品下单校验的问题
	 * 这里日后要进行一下拓展
	 * @param product
	 * @return
	 */
	public static boolean buyProductVerification(ProductJson product){
		if(product==null){
			return false;	
		}
		if(product.getSvip_product_id()==null||product.getSvip_product_id().equals("普通")){
			return true;
		}else{
			if(AppCache.getInstance().getCustomer().getGrade()!=null && AppCache.getInstance().getCustomer().getGrade().equals("SVIP")){
				return true;
			}
			return false;	
		}
		
	}
}
