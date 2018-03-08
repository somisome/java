package kr.or.ddit.custom.tag;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TargetClazz {
	public static Integer plus(Integer i, Integer j){
		return i+j;
	}
	
	public static Integer multiple(String i, Integer j){
		return Integer.parseInt(i)*j;
	}
	
	public static String today(){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		return dateFormat.format(new Date());
	}
	
	//"1234556789" => 5 => 2
	public static Integer charCount(String target, String value){
		int idx = 0;
		int cnt = 0;
		idx = target.indexOf(value);
		for(;idx!=-1 ; cnt++){
			target = target.substring(target.indexOf(value)+1, target.length());
			idx = target.indexOf(value);
		}
		return cnt;
	}
	
}
