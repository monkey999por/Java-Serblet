<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="javax.swing.text.html.ListView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.values.*" %> 
<%@ page import="cookie.MyCookie" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="index.css">

<title>タイトルだお！</title>
</head>

<body style="background-color: #1f1300; color: white" >
<h2 style="font-weight: 700; font-style: oblique; color: green" >welcome to underground...</h2>

<div class="descreption" >
	<div style="font-weight:500; font-style: oblique; font-size: 100%; color: #d048ff">descreption</div>
	hello world and no one lives here or titan you can dispatch second where tips<br>
</div>
<br>

<% ChatValues chatValues = (ChatValues) session.getAttribute("chatValues"); %>
<%ChatUser chatUser = (ChatUser) session.getAttribute("chatUser"); %>
<div id="main" style="float: left;	 display: inline-block; vertical-align: top; ">
	
	<div id="main_message" style=" display: inline-block; vertical-align: top; color: #aee4bf;">
		<span style="color: #ffc9ff">****************Request***************</span><br>
		<form method="post"  action="<%=request.getContextPath() %>/ChatServlet">
			<span style="color: #7e6000">結果表示あり</span><input type="checkbox"  name="isDisplay" checked="checked" /> <span style="color: #7e6000">※未実装</span><br>
			
				<!-- 同一ユーザチェック -->
				<% if (ChatUser.is_exist_same_use){ %>
					<div style="color: red; font-weight: bold;">このユーザ名は使えません</div>
				<%} %>
				<span style="color: #46ffff">***************Message***************</span><br>
				<!-- ---------------------User------------------------------ -->
				User Name <span style="margin-right: 23px"></span> :
				<% String user_name = MyCookie.getCookie(request, "user_name"); %>    
				<input type="text" name="user_name"  value="<%=user_name ==null ? "" : user_name %>"/><br>

				<!-- ---------------------Message------------------------------ -->
				Add Message<span style="margin-right: 7px"></span> :
				<input type="text" name="message" value=""><br>
				<!-- ---------------------Submit------------------------------ -->
				Start Request<span style="margin-right: 4px"></span> :
				<input type="submit" value="↷ Request " id="_submit"/><br>
		</form>
	</div>
	<div id="main_search">
		<form method="post"  action="<%=request.getContextPath() %>/SearchServlet">
			<span style="color: #99f535">***************Search****************</span><br>
			User Name <span style="margin-right: 23px"></span> :    
			<input type="text" name="user_name"  value=""/><br>	
			Start Request<span style="margin-right: 4px"></span> :
			<input type="submit" value="↷ Search " id="_submit"/><br>
		</form>
	</div>
	
	<div id="other">
		<span style="color: #d1f535">***************Other*****************</span><br>
		<form method="GET" action="<%=request.getContextPath() %>/ChatServlet">
			<input type="hidden" name="Reacquire" value="true">
			<input type="hidden"  name="user_name" />
			<input type="submit" value="再取得">
		</form>
	</div>	
</div>

<div id="message_disp" style="float: left;	 display: inline-block; vertical-align: top; margin-left: 50px; ">
	<span style="color: #d1f535">//Chat Room</span><br><br>
	<%try{ %>
		<%if ( ! (chatValues == null)){ %>
			<%
				for (String entry : ChatValues.getDisPlayList()){
			%>
				<span id="message_list" ><%= entry %></span><br>
			<% } %>
		<% } %>
	<%}catch(Exception e){ %>
		<p style = "color: red">リソースがありません</p>
	<% }%>
</div>
<div id="login_user_list" style="float: right;" >
	<span style="color: #d1f535;">ログイン中のユーザー</span><br>
	<%try{ %>
		<%if ( ! (chatUser == null)){ %>
			<%for (String user : ChatUser.getUserList()) {%>
				<%= user %><br>
			<% } %>
		<% } %>
	<%}catch(Exception e){ %>
			<p style = "color: red">no one lievs here</p>
	<% }%>
	
</div>
</body>
</html>