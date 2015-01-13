package cn.fuego.common.util.list.tools;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class IteratorSelector
{
	/**
	 * 迭代选择器
	 * 从list对象中选择fieldName为Value的元素，并组成一个新List
	 * @param list
	 * @param filedName
	 * @param Value
	 * @return
	 */
	public static <T> List<T> selectByField(List<T> list,String filedName, String value){
		Class<?> clazz;
		List<T> result = new ArrayList<T>();
		//empty check
		if(list==null||list.isEmpty()){
			return result;
		}
		//getClass
		clazz=list.get(0).getClass();
		//getAttr

		try
		{
			for(T t : list){
				String attrValue=getAttrValue(t,filedName);
				if(attrValue!=null && attrValue.equals(value)){
					result.add(t);
				}
			}
		} catch (NoSuchMethodException e)
		{
			//没有该属性
			return list;
		} catch (Exception e)
		{
			//没有该属性
			return list;
		}
		return result;

	}
	
	public static <T> List<T> deleteByField(List<T> list, String filedName,String value){
		Class<?> clazz;
		List<T> result = new ArrayList<T>();
		//empty check
		if(list==null||list.isEmpty()){
			return result;
		}
		//getClass
		clazz=list.get(0).getClass();
		//getAttr

		try
		{
			for(T t : list){
				String attrValue=getAttrValue(t,filedName);
				if(!attrValue.equals(value)){
					result.add(t);
				}
			}
		} catch (NoSuchMethodException e)
		{
			//没有该属性
			return list;
		} catch (Exception e)
		{
			//没有该属性
			return list;
		}
		return result;
	}
	
	private static String getAttrValue(Object object,String attrName) throws NoSuchMethodException, Exception{
		
		Method m = (Method) object.getClass().getMethod("get" + getMethodName(attrName));  
        String val = (String) m.invoke(object);// 调用getter方法获取属性值  
        if (val != null) {  
       	 return val; 
        }
        return null;  
	}
	
	private static String getMethodName(String fildeName) throws Exception{  
        byte[] items = fildeName.getBytes();  
        items[0] = (byte) ((char) items[0] - 'a' + 'A');  
        return new String(items);  
    }  
}
