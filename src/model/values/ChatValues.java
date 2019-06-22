package model.values;

import model.MyCommon;

public class ChatValues {
	private String user_name = "";
	private String message = "";
	private String createAt;

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
