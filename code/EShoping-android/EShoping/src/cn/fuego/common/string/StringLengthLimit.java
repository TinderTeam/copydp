package cn.fuego.common.string;

public class StringLengthLimit
{
	public static String limitStringLen(String str,int l){
		
		if(str.length()>l){
			String newStr;
			newStr=str.substring(0, l)+"...";
			return newStr;
		}else{
			return str;
		}
		
	}
}
