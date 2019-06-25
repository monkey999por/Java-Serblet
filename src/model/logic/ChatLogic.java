package model.logic;

import dao.execute.ChatDAO;
import model.values.ChatValues;

/**
 * @author nogam
 *
 */
public class ChatLogic {
	
	
	public static void getLoginUser() {
		
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
	
	
}
