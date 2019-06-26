package setvlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.logic.ChatLogic;
import model.values.ChatUser;
import model.values.ChatValues;

/**
 * Servlet implementation class ChatServlet
 */
@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ChatValues chatValues;
	String user_name, message;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//再取得の時はユーザ名をresetしない　未実装
		if (Boolean.parseBoolean(request.getParameter("Reacquire"))) {
			user_name = request.getParameter("user_name");
			chatValues = ChatValues.getChatValues(user_name);
		} else {
			chatValues = ChatValues.getChatValues("");	
		}
		
//	　ユーザーリストの表示
		ChatUser chatUserList = ChatUser.getChatUser();
		ChatLogic.setUserAll(chatUserList);		
		
//		チャットを表示する
		chatValues = ChatLogic.displyChatAll(chatValues);
		
		HttpSession mySession = request.getSession();
		mySession.setAttribute("chatValues", chatValues);
		mySession.setAttribute("chatUserList", chatUserList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		user_name = request.getParameter("user_name");
		message = request.getParameter("message");
		
		chatValues = ChatValues.getChatValues(user_name);
		chatValues.setMessage(message);
		
//		チャットを表示する
		ChatLogic.createChat(chatValues);
		chatValues = ChatLogic.displyChatAll(chatValues);
		
//		ユーザーリストの表示
		ChatUser chatUserList = ChatUser.getChatUser();
		ChatLogic.setUserAll(chatUserList);		

		HttpSession mySession = request.getSession();
		mySession.setAttribute("chatValues", chatValues);
		mySession.setAttribute("chatUserList", chatUserList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
}
