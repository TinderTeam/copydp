package cn.fuego.eshoping.webservice.up.model;

import cn.fuego.eshoping.webservice.up.model.base.BaseJsonReq;

public class GetProductTypeReq extends BaseJsonReq
{
	private int typeRoot;		//typeRoot=0 ��ʾȫ�����࣬����1-42��Ӧ���ݿ���type_id��Ӧ�Ĳ�Ʒ����

	public int getTypeRoot() {
		return typeRoot;
	}

	public void setTypeRoot(int typeRoot) {
		this.typeRoot = typeRoot;
	}

	@Override
	public String toString() {
		return "GetProductTypeReq [typeRoot=" + typeRoot + ", token=" + token
				+ "]";
	}

	

}
