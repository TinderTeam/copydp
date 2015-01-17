package cn.fuego.eshoping.webservice.up.model.base;

public class ZoneJson
{
	public static final String ZONE_NAME = "zone_name";
	
	private int zone_id;
	private String zone_name;
	private int city_id;
	public int getZone_id() {
		return zone_id;
	}
	public void setZone_id(int zone_id) {
		this.zone_id = zone_id;
	}
	public String getZone_name() {
		return zone_name;
	}
	public void setZone_name(String zone_name) {
		this.zone_name = zone_name;
	}
	public int getCity_id() {
		return city_id;
	}
	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}
	@Override
	public String toString() {
		return "ZoneJson [zone_id=" + zone_id + ", zone_name=" + zone_name
				+ ", city_id=" + city_id + "]";
	}

}
