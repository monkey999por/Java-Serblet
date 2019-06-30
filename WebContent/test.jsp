<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="test.CookieTest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
        //Cookieから"test_cookie_name"というKeyで登録された値(文字列)を取り出す
        String value = CookieTest.getCookie(request, "test_cookie_name");

        //valueがnullの場合のみCookieをセットする(期限は5分)
        if (value == null) {
                CookieTest.setCookie(request, response, "/", "test_cookie_name", "test_cookie_value", 5 * 60);
        }
	%>
        取得した値="<%= value%>"<br>
</body>
</html>