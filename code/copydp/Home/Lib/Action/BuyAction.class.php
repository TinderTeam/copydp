<?php
// 本类由系统自动生成，仅供测试用途
class BuyAction extends Action {
    public function order(){
		$this->display();
    }
	
	public function product_info($productID=0){
		//最近浏览记录里增加相关内容
		session_start();
		
		$historyList=$_SESSION['history'];

		$inSession = false;
		for($i=0;$i<count($historyList);$i++){
			if($historyList[$i]==$productID){
				$inSession=true;
				break;
			}
		}
		if(!$inSession){
			$historyList[count($historyList)]=$productID;
			$_SESSION['history']=$historyList;
		}
		$this->assign('productID',$productID);
		$this->display();
    }
	
	public function product_list(){
		$typeRoot=0;
		$this->assign('typeRoot',$typeRoot);
		$this->display();
    }
	
	public function recommend_product_info($id=0){
		$this->display();
    }
	
	public function cancelFilter($crtCdtItm=0){
	
		if($crtCdtItm!=0){
			$typeDB=new Model('product_type');
			$typeIDCondition['type_id']=$crtCdtItm;
			$typeRoot=$typeDB->where($typeIDCondition)->getField('father_id');
			$this->assign('typeRoot',$typeRoot);
		}
		$this->display('product_list');
	}
	
	public function typeSelect($SelectType=0){
		
		$typeRoot=$SelectType;
		$this->assign('typeRoot',$typeRoot);
		$this->display('product_list');
	}
}