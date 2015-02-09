<?php
import("@.Action.BaseAction");
header("Content-Type:text/html;charset=utf-8");

class SvipProductService extends BaseService{
	public function getList($filter){
		$this->debug('get svip order list by filter: '. $filter);	

		$orderDB = M('view_order');
		$svipProductConditionEmpty['svip_product_id']=array('neq',"");
		$svipProductConditionNormal['svip_product_id']=array('neq',"普通");
		$svipProductConditionNormal['_complex'] = $svipProductConditionEmpty;
		$orderList = $orderDB->where($svipProductConditionNormal)->select();
		$this->debug("select all svip products' order. counts: ". count($orderList));
		return $orderList;
	}
}
?>