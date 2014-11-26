package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;

public class GetCityListRsp extends BaseJsonRsp
{

	List<List<String>> cityList = new ArrayList<List<String>>();
	List<String> pinyin = new ArrayList<String>();
	public List<List<String>> getCityList() {
		return cityList;
	}
	public void setCityList(List<List<String>> cityList) {
		this.cityList = cityList;
	}
	public List<String> getPinyin() {
		return pinyin;
	}
	public void setPinyin(List<String> pinyin) {
		this.pinyin = pinyin;
	}
	@Override
	public String toString() {
		return "GetCityListRsp [cityList=" + cityList + ", pinyin=" + pinyin
				+ ", result=" + result + "]";
	}
	
}
