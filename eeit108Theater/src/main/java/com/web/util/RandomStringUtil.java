package com.web.util;

public class RandomStringUtil {
	
	public static String getRandomString() {
		char seeds[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'i', 'j', 'k', 'l', '0', '1', '2', '3', '4', '5', '6', '7',
				'8', '9', '0' };
		int strLen = (int) Math.round(Math.random() * 10) + 5;
		char randStr[] = new char[strLen];
		for (int i = 0; i < randStr.length; i++) {
			randStr[i] = seeds[(int) Math.round(Math.random() * (seeds.length - 1))];
		}
		String returnStr = new String(randStr);
		return returnStr;
	}

}
