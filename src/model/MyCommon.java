package model;

import java.util.Date;

public  class MyCommon {
	public static Date _today;

	/**
	 * @return 今日の日付 yyyy/mm/dd hh:mm:ss 
	 */
	public static String getToday() {
		_today = new Date();
		return _today.toString();
	}
}
