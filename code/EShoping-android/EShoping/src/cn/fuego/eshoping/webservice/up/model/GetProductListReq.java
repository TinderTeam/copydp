package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class GetProductListReq extends BaseJsonReq
{
	private String city;
	private int typeRoot;		//typeRoot=0 ��ʾɸѡȫ��������Ʒ
	private String keyWord;		//�ؼ���ģ������
	private boolean search;		//���ؼ���Ϊ�յ�ʱ����Ҫ��search����Ϊfalse
	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getTypeRoot() {
		return typeRoot;
	}

	public void setTypeRoot(int typeRoot) {
		this.typeRoot = typeRoot;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public boolean isSearch() {
		return search;
	}

	public void setSearch(boolean search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "GetProductListReq [city=" + city + ", typeRoot=" + typeRoot
				+ ", keyWord=" + keyWord + ", search=" + search + ", token="
				+ token + "]";
	}
	

}
