<?php
// 本类由系统自动生成，仅供测试用途
class SellerAction extends Action {
    public function sellerList($typeID=0,$zoneID=0){
		$typeRoot=0;
		$this->assign('typeRoot',$typeRoot);
		$this->assign('zoneID',$zoneID);
		$this->display();
    }
	
	 public function seller(){
		$this->display();
    }
	
	public function seller_info($sellerID=0){
		$this->assign('sellerID',$sellerID);
		$this->display();
    }
	public function cancelFilter($crtCdtItm=0){
	
		if($crtCdtItm!=0){
			$typeDB=new Model('product_type');
			$typeIDCondition['type_id']=$crtCdtItm;
			$typeRoot=$typeDB->where($typeIDCondition)->getField('father_id');
			$this->assign('typeRoot',$typeRoot);
		}
		$this->display('sellerList');
	}
	
	public function typeSelect($SelectType=0){
		
		$typeRoot=$SelectType;
		$this->assign('typeRoot',$typeRoot);
		$this->display('sellerList');
	}
	
}