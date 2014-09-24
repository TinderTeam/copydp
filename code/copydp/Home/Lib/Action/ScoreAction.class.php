<?php
// 本类由系统自动生成，仅供测试用途
class ScoreAction extends Action {
	public function score(){
	    $this->display();
	}
	public function score_info($productID=0){
		$this->assign('productID',$productID);
	    $this->display();
	}
}
?>