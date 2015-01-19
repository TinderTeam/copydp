package cn.fuego.eshoping.webservice.up.model;
import cn.fuego.eshoping.webservice.up.model.base.BaseJsonRsp;

public class GetClientVersionRsp extends BaseJsonRsp
{
	private String downLoadAddr;

	public String getDownLoadAddr() {
		return downLoadAddr;
	}

	public void setDownLoadAddr(String downLoadAddr) {
		this.downLoadAddr = downLoadAddr;
	}

	@Override
	public String toString() {
		return "GetClientVersionRsp [downLoadAddr=" + downLoadAddr
				+ ", result=" + result + "]";
	}

}
