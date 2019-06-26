<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="javax.swing.text.html.ListView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.values.*" %> 

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
	--ほらあ<br>
	--test<br>
	
</div>
<br>

<% ChatValues chatValues = (ChatValues) session.getAttribute("chatValues"); %>
<%ChatUser chatUser = (ChatUser) session.getAttribute("chatUser"); %>
<div id="main">
<div id="main_message" style=" display: inline-block; vertical-align: top;">
	<form method="post"  action="<%=request.getContextPath() %>/ChatServlet">
		<span style="color: #7e6000">結果表示あり</span><input type="checkbox"  name="isDisplay" checked="checked" /> <span style="color: #7e6000">※未実装</span>
		<br>
			<!-- 同一ユーザチェック -->
			<% if (ChatUser.is_exist_same_use){ %>
				<div style="color: red; font-weight: bold;">このユーザ名は使えません</div>
			<%} %>		
			<span style="color: #46ffff">***************Message***************</span><br>
			<!-- ---------------------User------------------------------ -->
			User Name <span style="margin-right: 23px"></span> :    
			<input type="text" name="user_name"  value=""/><br>
			<!-- ---------------------Message------------------------------ -->
			Add Message<span style="margin-right: 7px"></span> :
			<input type="text" name="message" value=""><br>
			<!-- ---------------------Submit------------------------------ -->
			Start Request<span style="margin-right: 4px"></span> :
			<input type="submit" value="↷ Request " id="_submit"/><br>
	</form>
</div>
<div id="main_search"></div>
	<form method="post"  action="<%=request.getContextPath() %>/SearchServlet">
		<span style="color: #99f535">***************Search****************</span><br>
		User Name <span style="margin-right: 23px"></span> :    
		<input type="text" name="user_name"  value=""/><br>	
		Start Request<span style="margin-right: 4px"></span> :
		<input type="submit" value="↷ Search " id="_submit"/><br>
	</form>	
</div>
<div id="main_search"></div>
	<span style="color: #d1f535">***************Other*****************</span><br>
</div>

<div id="login_user_list" style="float: right; display: inline-block; vertical-align: top;"">
	ログイン中のユーザー<br>
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
</div>

<!-- ごみ -->
<form method="GET" action="<%=request.getContextPath() %>/ChatServlet">
	<input type="hidden" name="Reacquire" value="true">
	<input type="hidden"  name="user_name" />
	<input type="submit" value="再取得">
</form>
<p style="font-weight: 700; font-style: oblique; font-size: 150%; color: #65edc4">chat room</p>
<p>-------------------------------------------------------------</p>
<div >
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

</body>
</html>