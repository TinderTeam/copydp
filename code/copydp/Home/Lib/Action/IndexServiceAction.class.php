<?php

class IndexServiceAction extends BaseAction {

    //修改密码
    public function modifyPswdService($userInfo)
    {
        
        $userDB= new Model("user");
        $condition['username']=$userInfo['username'];
        $condition['password']=$userInfo['oldPwd'];
        $user=$userDB->where($condition)->getField('user_id');
        if($user==''){
            $rsp['errorCode'] = ERROR_OLD_PASSWORD_WORD;
	        return  $rsp;
        }else{
            $nameCondition['username']=$userInfo['username'];
            $data['password']=$userInfo['pwdNew'];
            $userDB->where($condition)->save($data);
            $rsp['errorCode'] = SUCCESS;
	        return  $rsp;
        }
    }
    //登录验证
	public function loginService($user)
	{
	 
	  $condition['username']= $user['username'];
	  $userDB= M('user');
	  $getUser = $userDB->where($condition)->find();
	  $userCount = $userDB->where($condition)->count();
	  
	  $pwdenter=$user['password'];
	  $pwdtrue = $userDB->where($condition)->getField('password');
	  $userID = $userDB->where($condition)->getField('user_id');
	  $role = $userDB->where($condition)->getField('role');
	  
	  if($userCount==0)		//用户不存在
	  {
	      $rsp['errorCode'] = USERNAME_OR_PASSWORD_WRONG;
	      return  $rsp;
	  }
	  elseif($pwdtrue!=$pwdenter)		//密码不正确
	  {
	      $rsp['errorCode'] = USERNAME_OR_PASSWORD_WRONG;
	      return  $rsp;
	  }
	  else
	  {
	      	
	      //处理用户登陆
	      if($role=='CUSTOMER'){
	          $custmerDB= M('customer');
	          $customerIDCondition['user_id']=$userID;
	          $lastDate=$custmerDB->where($customerIDCondition)->getField('login_date');
	          $score=$custmerDB->where($customerIDCondition)->getField('score');
	          $status =$custmerDB->where($customerIDCondition)->getField('status');
	          if($status=='待审批'){
	              $rsp['errorCode'] = USER_UNCHECKED;
	          }
	          elseif($status=='已拒绝'){
	              $rsp['errorCode'] = USER_APPROVAL_REFUSED;
	          }
	          else{
    	          //处理用户登陆送积分
    	          $sysDB= M('sys_config');
    	          $sysCondition['key']='login_score';
    	          $scoreAdd=$sysDB->where($sysCondition)->getField('value');
    	          $nowDate = date('Y-m-d',time());
    	  
    	          if($lastDate=="" || $lastDate!=$nowDate){
    	              //赠送积分
    	              $CustomerData['score']=$score+$scoreAdd;
    	          }
    	          $CustomerData['login_date']=$nowDate;
    	          $custmerDB->where($customerIDCondition)->save($CustomerData);
    	          $getCustomer = $custmerDB->where($customerIDCondition)->find();
    	          //登录成功返回
    	          $rsp['errorCode'] = SUCCESS;
    	          $rsp['user'] = $getUser;
    	          $rsp['customer'] = $getCustomer;
    	          $this->log("the user is ".$getUser);
    	          $this->log("the customer is".$getCustomer);
    	          return  $rsp;
	          }
	      }
	      else{
	          //用户角色错误处理
	          $rsp['errorCode'] = USERNAME_OR_PASSWORD_WRONG;
	          return  $rsp;
	      }	
	  }
	  
	}
	//用户注册
	public function registerService($newUser)
	{
	    $userDB= M('user');
	    $condition['username']=$newUser['username'];
	    $userID = $userDB->where($condition)->getField('user_id');
	    
	    if($newUser['code']==''){
	    
	    }else{
	        $codeDB= M('poll_code');
	        $codecondition['code']=$newUser['code'];
	        $codestatus = $codeDB->where($codecondition)->getField('status');
	        if($codestatus=='已使用'){
	            
	            //激活码失效
	            $rsp['errorCode'] = CODE_IS_INVALID;
	            return  $rsp;
	            
	        }else if($codestatus==null){
	            //激活码失效
	            $rsp['errorCode'] = CODE_IS_INVALID;
	            return  $rsp;
	        }
	    }
	    
	    if($userID!=''){
	        //激活码失效
            $rsp['errorCode'] = USER_EXISTED;
            return  $rsp;
	    }
	    
	    $userData['username']=$newUser['username'];
	    $userData['password']=$newUser['password'];
	    $userData['role']='CUSTOMER';
	    $userDB->add($userData);
	    
	    $userID = $userDB->where($condition)->getField('user_id');
	    $customerDB= M('customer');
	    
	    $customerData['user_id']=$userID;
	    $customerData['score']=0;
	    $customerData['cellphone']=$newUser['cellphone'];
	    $customerData['grade']='VIP';
	    $customerData['email']=$newUser['email'];
	    $customerData['car_id']=$newUser['car_id'];
	    $condition['username']=$newUser['recommender_name'];
	    $recommender_id = $userDB->where($condition)->getField('user_id');
	    $customerData['recommender_id']=$recommender_id;
	    
	    if($newUser['code']==''){
	        $customerData['request']='审批';
	        $customerData['status']='待审批';
	    }else{
	        $codedata['code']=$newUser['code'];
	        $codedata['status']='已使用';
	        $codeDB->where($codecondition)->save($codedata);
	        $customerData['status']='正常';
	    }
	    $customerDB->add($customerData);
	    
	    $rsp['errorCode'] = SUCCESS;
        return  $rsp;
	}
	//获取城市列表
	public function cityService($newUser)
	{
	    //获取数据库内容
	    $db=new Model('city');
	    $select = $db->order('convert(city using gbk) asc')->select();
	    $pinyin= array();
	    $cityList= array();
	    
	    for($i=0;$i<count($select);$i++){
	        $pinyinStr =  substr($this->pinyin($select[$i]['city']),0,1);
	        $index = array_search($pinyinStr,$pinyin);
	        if($index==null){
	            array_push($pinyin,$pinyinStr);
	            $index = array_search($pinyinStr,$pinyin);
	        }
	        if($cityList[$index]==null){
	            $ciryArray=array();
	            array_push($ciryArray,$select[$i]['city']);
	            $cityList[$index]=$ciryArray;
	        }else{
	            $ciryArray=$cityList[$index];
	            array_push($ciryArray,$select[$i]['city']);
	            $cityList[$index]=$ciryArray;
	        }
	    }
	    $rep['errorCode'] = SUCCESS;
	    $rsp['pinyin'] = $pinyin;
	    $rsp['cityList'] = $cityList;
	    $this->log("the pinyin is ".$pinyin);
	    $this->log("the cityList is".$cityList);
	    return  $rsp;
	}
	
}

?>