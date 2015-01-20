package cn.fuego.eshoping.webservice.up.model.base;

import java.io.Serializable;
import java.util.List;

public class CityJson  implements Serializable
{
	public static final String CITY_ID="city_id";
	
	private int city_id;
	private String city;
	private String x;
	private String y;
	private List<ZoneJson> zone_list;
	public int getCity_id() {
		return city_id;
	}
	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public List<ZoneJson> getZone_list() {
		return zone_list;
	}
	public void setZone_list(List<ZoneJson> zone_list) {
		this.zone_list = zone_list;
	}
	@Override
	public String toString() {
		return "CityJson [city_id=" + city_id + ", city=" + city + ", x=" + x
				+ ", y=" + y + ", zone_list=" + zone_list + "]";
	}
	

}
