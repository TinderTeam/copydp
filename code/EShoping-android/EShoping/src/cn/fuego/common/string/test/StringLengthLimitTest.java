package cn.fuego.common.string.test;

import org.junit.Test;

import cn.fuego.common.string.StringLengthLimit;

public class StringLengthLimitTest
{
	@Test
	public void limitStringLenTest(){
		String str="abcdefghigklmnopqrstuvwxyz";
		System.out.print(StringLengthLimit.limitStringLen(str, 4));
	}
}
