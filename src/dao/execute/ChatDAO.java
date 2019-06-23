package dao.execute;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.ConnectionDB;
import dao.sql.ChatSQL;
import model.values.ChatValues;

/**
 * @author nogam
 *@see dao.sql.*.javaからsqlを取得して、バインド変数を指定して結果を返すクラス
 */
public class ChatDAO {
	public static Connection connection = null;
	/**
	 * @param vind_str
	 * @return user_name
	 */
	public static String setUser(String vind_str) {
		try {
			
			PreparedStatement preparedStatement = ConnectionDB.connectDB_mysql().prepareStatement(ChatSQL.get_user);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionDB.disconnectDB();
			}
				return "";
	}
	
	/**
	 * @param chatValues
	 * メッセージを登録。ユーザ名もそのまま登録。ここではユーザは誰とか関係ない。5ch的なものとして
	 * 
	 */
	public static void setMessage(ChatValues chatValues) {
		try {
			connection = ConnectionDB.connectDB_mysql();
			PreparedStatement preparedStatement = connection.prepareStatement(ChatSQL.set_message);
			
			preparedStatement.setString(1,chatValues.getUser_name());
			preparedStatement.setString(2,chatValues.getMessage());
			
			connection.setAutoCommit(false);
			preparedStatement.executeUpdate();
			connection.commit();
			
			} catch (Exception e) {
				try {
					connection.rollback();
				} catch (Exception e2) {
					
				}
				e.printStackTrace();
			}finally {
				ConnectionDB.disconnectDB();
			}		
	}
	public static void test() {
		try {
			PreparedStatement preparedStatement=ConnectionDB.connectDB_mysql().prepareStatement(ChatSQL.set_message);
			ResultSet result = preparedStatement.executeQuery();
			String message = result.getString("message");
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionDB.disconnectDB();
			}		
	}
}
