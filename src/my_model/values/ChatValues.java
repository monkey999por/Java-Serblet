package my_model.values;

import java.util.ArrayList;

/**
 * @author nogam
 *@category test
 */
public class ChatValues {
	public ArrayList<String> my_array;
	
	public ChatValues() {
		
	}
	
	public ArrayList<String> ChatLogic(String value) {
		my_array = new ArrayList<String>();
		
		if (value == null) {
			my_array.add("" + " : result");
		} else {
			my_array.add(value + " : result");
		}
		
		System.out.println("list in the value");
		for (String temp : my_array) {
			System.out.print(temp);
		}
		
		return my_array;
	}
	
	
}
