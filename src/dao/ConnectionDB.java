package dao;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionDB {
	private static InitialContext init_connection = null;
	private static DataSource ds  = null;
	private static Connection my_connection = null;
	public static Connection connectDB_mysql() {
		if (my_connection == null) {
			try {
				 init_connection = new InitialContext();
				 ds = (DataSource) init_connection.lookup("java:comp/env/jdbc/my_chat");
				 my_connection = ds.getConnection();
				 return my_connection;
			}catch (Exception e) {
				e.printStackTrace();
				return null;
			} 
		} else {
			return null;
		}
	}
	/**
	 * DB切断
	 */
	public static void disconnectDB() {
		try {
			if (my_connection!=null) {
				my_connection.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
}
