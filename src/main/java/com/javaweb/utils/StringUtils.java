package com.javaweb.utils;

public final class StringUtils {
	public static boolean check(Object data) {
		if(data != null && !data.equals(""))return true;
		else return false;
	}
}
