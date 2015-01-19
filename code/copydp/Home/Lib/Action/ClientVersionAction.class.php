<?php
// 本类由系统自动生成，仅供测试用途

class ClientVersionAction extends BaseAction 
{
	/*
	 * APP获取版本信息
	 */
	public function GetLatestVersion_rest()
	{
		$rsp['downLoadAddr'] = "/Public/App/Android/Laundry.apk";
		$errorCode = SUCCESS;
        $this->returnJson($errorCode,$rsp);
	} 
}