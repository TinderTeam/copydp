<?php
// 本类由系统自动生成，仅供测试用途
class SellerAction extends Action {
    public function seller(){
		$this->display();
    }
	
	public function seller_info($sellerID=0){
		$this->assign('sellerID',$sellerID);
		$this->display();
    }
	
}