package model.values;

import java.util.ArrayList;
import java.util.List;

/**
 * @author nogam
 *Singleton pattern
 */
public class ChatValues {
	private String user_name = "";
	private String message = "";
	
	private static List<String> display_list = new ArrayList<String>();
	public static List<String> getDisPlayList() {
		return display_list;
	}
	
	private static List<String> all_user = new ArrayList<String>();
	public static List<String> getAllUser() {
		return all_user;
	}
	
	public static ChatValues getChatValues(String user_name) {
		ChatValues chatValues = new ChatValues();
		chatValues.setUser_name(user_name);
		return chatValues;
	}

	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = (user_name == null ||user_name.equals(""))  ? "unknown" : user_name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = (message == null )  ? "\"\"" : message;
	}

}
