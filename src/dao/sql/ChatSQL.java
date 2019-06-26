package dao.sql;

public class ChatSQL {
	
//	SELECT
	public final static String get_all_user = "SELECT distinct user_name FROM my_chat.user";
	public final static String get_all = "SELECT user_name, message FROM my_chat.message";
	public final static String get_message_for_user =
			"SELECT * FROM my_chat.message "
					+ "INNER JOIN my_chat.user"
					+ "ON my_chat.message.user_id = my_chat.user.id";
	
//	INSERT
	public final static String set_message = 
			"insert into my_chat.message (user_name, message)\r\n" + 
			"values (?, ?)";
//	UPDATE
//	DELETE
}
