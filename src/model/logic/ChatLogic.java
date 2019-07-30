package model.logic;

import dao.execute.ChatDAO;
import model.values.ChatUser;
import model.values.ChatValues;

/**
 * @author nogam
 *
 */
public class ChatLogic {
	
	/**
	 * @param user_name
	 * @return boolean
	 * 同じユーザが存在する ture
	 *  同じユーザが存在しない false
	 */
	public static boolean isExistSameUser(String user_name)	{
//		ユーザー名はかぶらせない
		for (String user : ChatUser.getUserList()) {
			if (user.equals(user_name)) {
				return true;
			}
		}
		return false;
	}
	
	public static void registrationUser (String user_name) throws Exception{
		if (! isExistSameUser(user_name)){
			ChatDAO.registerUser(user_name);
		}else
			throw new Exception()	;
	}
	
	
	public static void getUserAll(ChatUser chatUserList) {
		ChatDAO.getAllUser(chatUserList);
	}

	/**
	 * @param chatValues
	 * DBにメッセージをセットする、ユーザはなければ作る
	 */
	public static void createChat(ChatValues chatValues) {
		ChatDAO.setMessage(chatValues);
	}
	
	/**
	 * @param chatValues
	 * @return ChatValues
	 */
	public static ChatValues displyChatAll(ChatValues chatValues) {
//		全部読んでリストに追加
		 ChatDAO.getAll(chatValues);
		return chatValues;
	}
	
	public static ChatValues getChatForUser(ChatValues chatValues) {
//		全部読んでリストに追加
		 ChatDAO.getChatForUserRetrive(chatValues);
		return chatValues;
	}
	
	
}
