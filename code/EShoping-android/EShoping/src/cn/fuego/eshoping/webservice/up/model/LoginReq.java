package cn.fuego.eshoping.webservice.up.model;


/**
 * 
* @ClassName: LoginReq 
* @Description: TODO
* @author Tang Jun
* @date 2014-10-20 上午10:59:19 
*
 */
public class LoginReq
{
	private String username;
	private String password;
	private String clientType;
	private String clientVersion;
	private String devToken;
 
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getClientType()
	{
		return clientType;
	}
	public void setClientType(String clientType)
	{
		this.clientType = clientType;
	}
	public String getClientVersion()
	{
		return clientVersion;
	}
	public void setClientVersion(String clientVersion)
	{
		this.clientVersion = clientVersion;
	}
	public String getDevToken()
	{
		return devToken;
	}
	public void setDevToken(String devToken)
	{
		this.devToken = devToken;
	}
	@Override
	public String toString() {
		return "LoginReq [username=" + username + ", password=" + password
				+ ", clientType=" + clientType + ", clientVersion="
				+ clientVersion + ", devToken=" + devToken + "]";
	}
 
	

}
