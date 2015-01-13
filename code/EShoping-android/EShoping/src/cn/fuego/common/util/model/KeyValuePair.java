package cn.fuego.common.util.model;

/**
 * 二元的列表项
* @ClassName: DualListItem 
* @Description: TODO
* @author Nan Bowen
* @date 2015年1月7日 下午3:23:24 
*
 */
public class KeyValuePair<T>
{
	private String key;
	private T value;
	
	public final String KEY="key";
	public final String VALUE="value";
	
	public KeyValuePair(String key,T value){
		setKey(key);
		setValue(value);
	}
	
	public String getKey()
	{
		return key;
	}
	public void setKey(String label)
	{
		this.key = label;
	}
	public T getValue()
	{
		return value;
	}
	public void setValue(T value)
	{
		this.value = value;
	}
}
