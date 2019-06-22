package model.logic;

import java.util.ArrayList;
import java.util.List;

import model.values.ChatValues;

/**
 * @author nogam
 *
 */
public class ChatLogic {
	//ChatValuesの値を整形した文字列
	public static List<String>  disply_list;
	
	/**
	 * @param chatValues
	 * @return 連番：ユーザ：つぶやき
	 */
	public static List<String> createChat(ChatValues chatValues) {
		if (disply_list ==null) {
			disply_list= new ArrayList<String>();
		}
		String disply_str = ( disply_list.size() +1 )+ ":" + chatValues.getUser_name() + ":"  + chatValues.getMessage() ;
		disply_list.add(disply_str);
		
		return disply_list;
		
	}
}
