package cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyCookie {
	public static String getCookie(HttpServletRequest request, String name) {
		 Cookie[] cookies = request.getCookies();
		 
		 if ( ! (cookies == null)) {
			for (Cookie cookie : cookies) {
					if (name.equals(cookie.getName())) {
						return cookie.getValue();
					}
			}
		}
		 return null;
		 
	}
	
	public static void setCookie(HttpServletResponse response, String name, String value) {
		if( ! ((name ==null) || (value == null)) ){
			Cookie cookie = new Cookie(name, value);
			response.addCookie(cookie);
		}
		
	}
}
