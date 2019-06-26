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
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ChatValues chatValues;
	String user_name, message;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		user_name = request.getParameter("user_name");
		
//			検索結果を表示する
		chatValues = ChatValues.getChatValues(user_name);
		chatValues = ChatLogic.getChatForUser(chatValues);
		
//		ユーザーリストの表示
		ChatUser chatUser = ChatUser.getChatUser();
		ChatLogic.getUserAll(chatUser);

		HttpSession mySession = request.getSession();
		mySession.setAttribute("chatValues", chatValues);
		mySession.setAttribute("chatUser", chatUser);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);	
	}

}
