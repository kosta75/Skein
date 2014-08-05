package kr.co.skein.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class CustomFormChecker {

	public void check(int year, int month, int date){
		Calendar cal = Calendar.getInstance();
		cal.set(year, month-1, date);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(sdf.format(cal.getTime()));
	}
	
}
