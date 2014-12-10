package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;
import cn.fuego.eshoping.webservice.up.model.base.CityJson;

public class GetCityListRsp extends BaseJsonRsp
{

	
	List<CityJson> cityList = new ArrayList<CityJson>();
	List<String> pinyin = new ArrayList<String>();
	
	public List<CityJson> getCityList() {
		return cityList;
	}
	public void setCityList(List<CityJson> cityList) {
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
