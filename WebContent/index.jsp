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
<h1 style="font-weight: 700; font-style: oblique; color: green" >ヘッダーを追加するお!(^ω^)</h1>

<div class="descreption" >
<div style="font-weight: 700; font-style: oblique; font-size: 150%; color: #d048ff">descreption</div>
	--Web アプリケーションマッピングに関連付けられたパス接頭辞を指定します。<br>
	--Web サーバの URL ネーム空間のルートディレクトリにあるデフォルトのアプリケーションの場合、<br>
	--コンテキストパスは空の文字列になります。デフォルト以外のアプリケーションの場合、コンテキス<br>
	--トパスは、スラッシュ (/) で始まりますが、スラッシュで終了しません。たとえば、/techniques は<br>
	--/techniques を含んでいるリクエストを techniques アプリケーションへマッピングします。<br>
	--request.getContextPath メソッドは、コンテキストパスを示す文字列を返します。<br>
</div>
<br>

<% ChatValues chatValues = (ChatValues) session.getAttribute("chatValues"); %>
<%ChatUser chatUser = (ChatUser) session.getAttribute("chatUser"); %>
<div id="main">
<div id="main_input" style=" display: inline-block; vertical-align: top;">
	<form method="post"  action="<%=request.getContextPath() %>/ChatServlet">
		<span style="color: #7e6000">結果表示あり</span><input type="checkbox"  name="isDisplay" checked="checked" /> <span style="color: #7e6000">※未実装</span>
		<br>
			<!-- 同一ユーザチェック -->
			<% if (ChatUser.is_exist_same_use){ %>
				<div style="color: red; font-weight: bold;">このユーザ名は使えません</div>
			<%} %>		
			<!-- ---------------------User------------------------------ -->
			User Name <span style="margin-right: 23px"></span> :    
			<input type="text" name="user_name"  value=""/><br>
			<!-- ---------------------Message------------------------------ -->
			Add Message<span style="margin-right: 7px"></span> :
			<input type="text" name="message" value=""><br>
			<!-- ---------------------Submit------------------------------ -->
			Start Request<span style="margin-right: 1px"></span> :
			<input type="submit" value="↷ Request " id="_submit"/>
</form>
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