package cn.fuego.common.util.list.tools;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public class IteratorSelectorTest
{

	class myTest{
		private String key;
		private int value;
		
		myTest(String k,int v){
			setKey(k);
			setValue(v);
		}

		public String getKey()
		{
			return key;
		}

		public void setKey(String key)
		{
			this.key = key;
		}

		public int getValue()
		{
			return value;
		}

		public void setValue(int value)
		{
			this.value = value;
		}
	}
	private List<myTest> getTestList(){
		List<myTest> list = new  ArrayList<myTest>();
		list.add(new myTest("a",1));
		list.add(new myTest("b",1));
		list.add(new myTest("a",2));
		list.add(new myTest("b",2));
		return list;		
	}
	
	//@Test
	public void deleteByFieldTest(){
		List<myTest> list = getTestList();
		List<myTest> newlist=IteratorSelector.deleteByField(list, "value", "2");
		System.out.print("ok");
	}
	//@Test
	public void selectByField(){
		List<myTest> list = getTestList();
		List<myTest> newlist=IteratorSelector.selectByField(list, "value", "2");
		System.out.print("ok");
	}
	//@Test
	public void selectColumn(){
		List<myTest> list = getTestList();
		List<Integer> newlist=IteratorSelector.selectColumn(list, "value");
		System.out.print("ok");
	}
	//@Test
	public void findbyAttr() throws Exception{
		List<myTest> list = getTestList();
		myTest t=IteratorSelector.findbyAttr(list, "value",2);
		myTest t1=IteratorSelector.findbyAttr(list, "key","a");
		System.out.print("ok");
	}
	
}
