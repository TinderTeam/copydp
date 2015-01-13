package cn.fuego.misp.ui.widget.list;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.content.Context;
import android.widget.SimpleAdapter;

public class WidgetList<T>
{
	Class<?> clazz;
	List<T> dataList;
	Map<String,Integer> resIdMap= new HashMap<String,Integer>();
	Map<String,List<String>> valueMapList = new HashMap<String,List<String>>();	//这里暂时处理全部为String的
	int layout=0;
	public WidgetList(List<T> list){
		dataList=list;
		for(T t : list){
			clazz=t.getClass();
		}
	}
	
	public void setResID(String attrName,int id) throws RuntimeException
	{
		if(isAttr(attrName)){
			resIdMap.put(attrName, id);
			valueMapList.put(attrName, new ArrayList<String>());
		}else{
			throw new RuntimeException("Attrbuite is not exist in class."); 
		}
	}
	
	public SimpleAdapter getAdapter(Context context){
		
		//生成SampleAdapter需要的MapList
		List<Map<String, Object>> listems = new ArrayList<Map<String, Object>>();
		//遍历所有对象
	    try{
		    for (T t:dataList) { 
		    	//遍历所有注册了的属性
		    	Map<String, Object> listem = new HashMap<String, Object>();
		    	for(String attrName:resIdMap.keySet())
		    	{ 
					listem.put(attrName,getAttrValue(t,attrName));
				}
			    listems.add(listem);  
		    }
		}
	    catch (NoSuchMethodException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	     
		SimpleAdapter adapter = new SimpleAdapter(
				context, 
				listems, 
				layout, 
				getAttrArray(),  
				getResIDArray());
		return adapter;
	}
	
	private int[] getResIDArray()
	{
		int[] a= new int[resIdMap.values().size()];
		for(int i=0; i<resIdMap.values().size();i++){
			a[i]=(Integer) resIdMap.values().toArray()[i];
		}
		return a;
	}

	private String[] getAttrArray()
	{
		String[] attrArray= new String[resIdMap.keySet().size()];
		resIdMap.keySet().toArray(attrArray);
		return attrArray;
	}

	private boolean isAttr(String attrName){  
		for(Field f:clazz.getDeclaredFields()){
			if(f.getName().equals(attrName)){
				return true;
			}
		}
		return false;
	}
	
	private String getAttrValue(Object object,String attrName) throws NoSuchMethodException, Exception{
		
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

	public void setLayout(int id){
		layout=id;
	}
}
