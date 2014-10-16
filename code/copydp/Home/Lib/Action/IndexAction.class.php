<?php
// 本类由系统自动生成，仅供测试用途


class IndexAction extends Action {
	public function passwordSetup(){
		$this->display();
	}
	public function modifyPswd(){
		$UserDB= new Model("user");
		$condition['username']=$_SESSION['login_user'];
		$condition['password']=$_POST['oldpswd'];
		$user=$UserDB->where($condition)->getField('user_id');
		if($user==''){
			$this->assign("jumpUrl","passwordSetup");
			$this->error("密码错误！");
		}else{
			$nameCondition['username']=$_SESSION['login_user'];
			$data['password']=$_POST['newpswd'];
			$UserDB->where($nameCondition)->save($data);
			$this->assign("jumpUrl","login");
			$this->error("操作成功");
		}
		
		
	}
	
	public function index(){
			
		//处理城市
		$city=$_SESSION['city'];
		if(empty($_SESSION['city'])){			
			$iplookup=$this->iplookup(); 
			if($iplookup['ip']=='127.0.0.1'){
				$city="深圳";
				
			}else{
				$city=$this->unescape($iplookup['city']);
			}					
		}
		$_SESSION['city']=$city;
		
		$this->display();
    }
	
	public function selectCity($cityName=0){	
		session_start();
		$_SESSION['city']=$cityName;
		$this->redirect('Index/index');
    }
	//退出
	public function logout(){
		session_destroy();
		$this->redirect('Index/index');
		
	}
	//登录页面
	public function login(){
		$this->display();
    }
	
	//登录校验
 	public function check(){
		session_start();
        $time=30*60; 
        setcookie(session_name(),session_id(),time()+$time,"/");
		

      
			if(!empty($_POST['name'])&&!empty($_POST['pwd'])){
				$admin= M('user');
        
				$condition['username']=$_POST['name'];
				$pwdenter=$_POST['pwd'];
				$pwdtrue = $admin->where($condition)->getField('password');
				$userID = $admin->where($condition)->getField('user_id');
				$role = $admin->where($condition)->getField('role');
				
				if($pwdtrue==$pwdenter){
					$_SESSION['login_user']= $_POST['name'];
					//处理登陆赠送积分
					if($role=='CUSTOMER'){
						$custmerDB= M('customer');
						$customerIDCondition['user_id']=$userID;
						$lastDate=$custmerDB->where($customerIDCondition)->getField('login_date');
						$score=$custmerDB->where($customerIDCondition)->getField('score');
						
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
					}
					
					$this->assign("jumpUrl","index");
					$this->success("登陆成功！");
				}else{
					//$this->redirect('Index/login','',2,'用户名或密码不正确！');
				 $this->assign("jumpUrl","login");
				$this->error("用户名或密码不正确！");
				}
			}else{
				$this->assign("jumpUrl","login");
				$this->error("用户名或密码不能为空！");
				}

	}	
	public function register(){
	
		$admin= M('user');      
		$condition['username']=$_POST['username'];
		$userID = $admin->where($condition)->getField('user_id');
		
		if($userID!=''){
			$this->assign("jumpUrl","login");
			$this->error("用户名被注册！");
		}
		
		$userData['username']=$_POST['username'];
		$userData['password']=$_POST['password'];
		$userData['role']='CUSTOMER';
		$admin->add($userData);
		
		$userID = $admin->where($condition)->getField('user_id');
		print($userID);
		$customerDB= M('customer'); 
		
		$customerData['user_id']=$userID;
		$customerData['score']=0;
		$customerData['cellphone']=$_POST['cellphone'];
		$customerData['grade']='VIP';
		$customerData['email']=$_POST['email'];
		$customerData['car_id']=$_POST['car_id'];
		$condition['username']=$_POST['recommender_name'];
		$recommender_id = $admin->where($condition)->getField('user_id');
		$customerData['recommender_id']=$recommender_id;
		
		if($_POST['code']==''){
			$customerData['status']='待审批';
		}else{
			$customerData['status']='正常';
		}
		$customerDB->add($customerData);
	
		$this->assign("jumpUrl","login");
		$this->success("注册成功！");
    }

	
	public function city(){
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
		
		$this->assign('pinyin',$pinyin);
		$this->assign('cityList',$cityList);
		$this->assign('citySelect',"未选择");
		$this->display();
    }
	//引用函数
	
	
	function unescape($str) {
	     $str = rawurldecode($str);
	     preg_match_all("/(?:%u.{4})|.{4};|&#\d+;|.+/U",$str,$r);
	     $ar = $r[0];
	     foreach($ar as $k=>$v) {
	         if(substr($v,0,2) == "%u")
	         {
	             $ar[$k] = iconv("UCS-2","utf-8//IGNORE",pack("H4",substr($v,-4)));
	         }
	         elseif(substr($v,0,3) == "")
	         {
	             $ar[$k] = iconv("UCS-2","utf-8",pack("H4",substr($v,3,-1)));
	         }
	         elseif(substr($v,0,2) == "&#")
	         {
	             echo substr($v,2,-1)."";
	             $ar[$k] = iconv("UCS-2","utf-8",pack("n",substr($v,2,-1)));
	         }
	     }
	     return join("",$ar);
	 }
	
	function iplookup($ip=1){
			if($ip){ //客户端
				$userip=$this->egetip_joy(); //客户端IP
			}else{ //服务端
				$domain=$_SERVER['HTTP_HOST'];
				$userip=gethostbyname($domain);
			}
			 //返回Sina地理位置信息
			 $json=@file_get_contents('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip='.$userip);
			 $patterns = array();
			 $patterns[0] = '/var remote_ip_info = /';
			 $patterns[1] = '/;/';
			 $patterns[2] = '/\Wu/';
			 $find = array();
			 $find[0] = "";
			 $find[1] = "";
			 $find[2] = "%u";
			 $json = preg_replace($patterns, $find, $json); //过滤多余字符
			 $json_arr=json_decode($json,true);
			 return $json_arr;
	}
	
	
		function egetip_joy(){
		     if(getenv('HTTP_CLIENT_IP')&&strcasecmp(getenv('HTTP_CLIENT_IP'),'unknown'))
		     {
		         $ip=getenv('HTTP_CLIENT_IP');
		     }
		     elseif(getenv('HTTP_X_FORWARDED_FOR')&&strcasecmp(getenv('HTTP_X_FORWARDED_FOR'),'unknown'))
		     {
		         $ip=getenv('HTTP_X_FORWARDED_FOR');
		     }
		     elseif(getenv('REMOTE_ADDR')&&strcasecmp(getenv('REMOTE_ADDR'),'unknown'))
		     {
		         $ip=getenv('REMOTE_ADDR');
		     }
		     elseif(isset($_SERVER['REMOTE_ADDR'])&&$_SERVER['REMOTE_ADDR']&&strcasecmp($_SERVER['REMOTE_ADDR'],'unknown'))
		     {
		         $ip=$_SERVER['REMOTE_ADDR'];
		     }
		     $ip=preg_replace("/^([d.]+).*/","1",$ip);
		     return $ip;
		 }
	
	
	public  function getfirstchar($s0){   
			$fchar = ord($s0{0});
			if($fchar >= ord("A") and $fchar <= ord("z") )return strtoupper($s0{0});
			$s1 = iconv("UTF-8","gb2312", $s0);
			$s2 = iconv("gb2312","UTF-8", $s1);
			if($s2 == $s0){$s = $s1;}else{$s = $s0;}
			$asc = ord($s{0}) * 256 + ord($s{1}) - 65536;
			if($asc >= -20319 and $asc <= -20284) return "A";
			if($asc >= -20283 and $asc <= -19776) return "B";
			if($asc >= -19775 and $asc <= -19219) return "C";
			if($asc >= -19218 and $asc <= -18711) return "D";
			if($asc >= -18710 and $asc <= -18527) return "E";
			if($asc >= -18526 and $asc <= -18240) return "F";
			if($asc >= -18239 and $asc <= -17923) return "G";
			if($asc >= -17922 and $asc <= -17418) return "I";
			if($asc >= -17417 and $asc <= -16475) return "J";
			if($asc >= -16474 and $asc <= -16213) return "K";
			if($asc >= -16212 and $asc <= -15641) return "L";
			if($asc >= -15640 and $asc <= -15166) return "M";
			if($asc >= -15165 and $asc <= -14923) return "N";
			if($asc >= -14922 and $asc <= -14915) return "O";
			if($asc >= -14914 and $asc <= -14631) return "P";
			if($asc >= -14630 and $asc <= -14150) return "Q";
			if($asc >= -14149 and $asc <= -14091) return "R";
			if($asc >= -14090 and $asc <= -13319) return "S";
			if($asc >= -13318 and $asc <= -12839) return "T";
			if($asc >= -12838 and $asc <= -12557) return "W";
			if($asc >= -12556 and $asc <= -11848) return "X";
			if($asc >= -11847 and $asc <= -11056) return "Y";
			if($asc >= -11055 and $asc <= -10247) return "Z";
			return null;
		}	 
		public function pinyin($zh){
			$ret = "";
			$s1 = iconv("UTF-8","gb2312", $zh);
			$s2 = iconv("gb2312","UTF-8", $s1);
			if($s2 == $zh){$zh = $s1;}
			for($i = 0; $i < strlen($zh); $i++){
				$s1 = substr($zh,$i,1);
				$p = ord($s1);
				if($p > 160){
					$s2 = substr($zh,$i++,2);
					$ret .= $this->getfirstchar($s2);
				}else{
					$ret .= $s1;
				}
			}
			return $ret;
		}
	
	
}