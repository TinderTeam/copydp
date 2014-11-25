<?php
// 本类由系统自动生成，仅供测试用途
require 'ErrorCode.class.php';
class ResultJson
{
     protected $errorCode = 0;
	 protected $errorMsg;
	 protected $obj;
	 public function __construct($errorCode,$errorMsg) {
 
        $this->errorCode = $errorMsg;
 
    }

}

class BaseAction extends Action 
{
     protected $errorCode = 0;
	 protected $errorMsg;
	 
	 public function log($log)
	 {
	   Log::write($log);
	 }
	
	 public function getReqJson()
	 {
	   $req = file_get_contents("php://input");
	   $this->log('request is '.$req);

	   return $req;
	 }
	 
	 public function getReqObj()
	 {
	   
	   $json = $this->getReqJson();
	   $obj = json_decode($json);
 
	   return $obj;
	 }
	 
	 
	 public function doAuth()
	 {
	  
	 }
	 
	 public function returnJson($data)
	 {
	    	   
		$returnArray = $data;
		$returnArray[result]=new ResultJson($errorCode,$errorMsg);
 
 
	    $json = json_encode($returnArray);
	    $this->log('response is '.$json);
	    echo $json;
		
		exit;
	 }
	 
   function uuid($prefix = '')  
   {  
    $chars = md5(uniqid(mt_rand(), true));  
    $uuid  = substr($chars,0,8) . '-';  
    $uuid .= substr($chars,8,4) . '-';  
    $uuid .= substr($chars,12,4) . '-';  
    $uuid .= substr($chars,16,4) . '-';  
    $uuid .= substr($chars,20,12);  
    return $prefix . $uuid;  
  }  


	
}