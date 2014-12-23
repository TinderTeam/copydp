<?php
class WebUtilService {
 	public function getSessionCityName(){
		$cityID=$_SESSION['cityID'];
		$cityDB= M('city');
		$cityIDCondition['city_id']=$cityID;
		$city=$cityDB->where($cityIDCondition)->getField('city');
		return $city;
	}
	public function setSessionCityName($cityName){
		$cityDB= M('city');
		$cityCondition['city']=$cityName;
		$cityID=$cityDB->where($cityCondition)->getField('city_id');
		$_SESSION['cityID']=$cityID;	
		return $city;
	}
}