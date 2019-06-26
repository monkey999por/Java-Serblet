package model.values;

import java.util.ArrayList;
import java.util.List;

public class ChatUser {
	private static List<String> user_list = new ArrayList<String>();
	public static List<String> getUserList() {
		return user_list;
	}
	
	private static ChatUser chatUser = new ChatUser();
	public static ChatUser getChatUser() {
		return chatUser;
	}
	
}
