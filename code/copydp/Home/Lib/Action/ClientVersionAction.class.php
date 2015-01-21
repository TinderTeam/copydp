<?php
// 本类由系统自动生成，仅供测试用途

class ClientVersionAction extends BaseAction 
{
	/*
	 * APP获取版本信息
	 */
	public function GetLatestVersion_rest()
	{
		$data['version_id']=0;
		$data['company_id']=0;
		$data['app_name']="笑谣林";
		$data['apk_name']="Eshoping.apk";
		$data['version_name']="v1.1";
		$data['version_code']=2;
		$data['client_type']="ANDROID";
		$data['apk_url'] = "/Public/App/Android/Eshoping.apk";
		$data['qr_code']="";
		$data['version_status']="";
		$rsp['obj']=$data;
		$errorCode = SUCCESS;
        $this->returnJson($errorCode,$rsp);
	} 
}