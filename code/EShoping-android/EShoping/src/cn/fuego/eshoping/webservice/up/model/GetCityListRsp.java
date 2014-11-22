package cn.fuego.eshoping.webservice.up.model;

import java.util.ArrayList;
import java.util.List;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;

public class GetCityListRsp extends BaseJsonRsp
{

	List<List<String>> cityList = new ArrayList<List<String>>();
	List<String> pinyin = new ArrayList<String>();
}
