package com.bky.util;

import java.util.HashSet;

public class QSUtil {
	public static boolean isNumeric(String str){
		   for (int i = str.length();--i>=0;){  
		       if (!Character.isDigit(str.charAt(i))){
		           return false;
		       }
		   }
		   return true;
		}
	
	 /*
     * 判断数组中是否有重复的值
     */
    public static boolean cheakIsRepeat(int[] array) {
        HashSet<Integer> hashSet = new HashSet<Integer>();
        for (int i = 0; i < array.length; i++) {
            hashSet.add(array[i]);
        }
        if (hashSet.size() == array.length) {
            return true;
        } else {
            return false;
        }
    }
}
