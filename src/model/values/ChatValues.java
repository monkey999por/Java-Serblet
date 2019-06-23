package model.values;

import java.util.Map;

import model.MyCommon;

public class ChatValues {
	private String user_name = "";
	private String message = "";
	private String createAt;
	
	private Map<String, String> message_list;

	public Map<String, String> getMessage_list() {
		return message_list;
	}
	public void setMessage_list(Map<String, String> message_list) {
		this.message_list = message_list;
	}
	public void setCreateAt(String createAt) {
		this.createAt = createAt;
	}
	public ChatValues() {}
	/**
	 * @param user_name
	 * @param message
	 */
	public ChatValues(String user_name, String message) {
		setUser_name(user_name);
		setMessage(message);
		setCreateAt();
	}
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = (user_name == null)  ? "unknown" : user_name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = (message == null)  ? "\"\"" : message;
	}
	public String getCreateAt() {
		return createAt;
	}
	public void setCreateAt() {
		MyCommon.getToday();
	}
	
	
}
