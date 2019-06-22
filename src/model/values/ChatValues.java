package model.values;

import model.MyCommon;

public class ChatValues {
	private String user_name = "";
	private String message = "";
	private String createAt;
	public  String disply_str = "";
	
//	コンストラクタ
	public ChatValues() {}
	public ChatValues(String user_name, String message) {
		this.user_name = user_name;
		this.message = message;
		this.createAt = MyCommon.getToday();
		disply_str = user_name + ":"+ message + " :: "  +createAt ;
	}
	
}
