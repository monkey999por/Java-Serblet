<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="my_model.values.ChatValues" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	--request.getContextPath メソッドは、コンテキストパスを示す文字列を返します。<br>test
</div>
<br>

<form method="post"  action="./ChatServlet">
	<span style="color: #7e6000">結果表示あり</span><input type="checkbox"  name="isDisplay" checked="checked" /> <span style="color: #7e6000">※未実装</span>
	<br>
		User Name <span style="margin-right: 23px"></span> :    
		<input type="text" name="user_name" value=""/><br>
		
		Add Message<span style="margin-right: 7px"></span> :
		<input type="text" name="message" value=""/><br>
		Start Request<span style="margin-right: 1px"></span> :
		<input type="submit" value="↷ Request " id="_submit"
					style="display: inline-block;
							  text-decoration: none;
							  border-radius: 3px;
							  font-weight: bold;
							  background-image: linear-gradient(45deg, #709dff 0%, #b0c9ff 100%);
							  border-radius: 25px;
							  width: 175px;
							  transition: .4s;"/>
</form>

<p style="font-weight: 700; font-style: oblique; font-size: 150%; color: #65edc4">chat room</p>
<p>-------------------------------------------------------------</p>
<% ChatValues testModel = (ChatValues) session.getAttribute("ChatModel"); %>
<%try{ %>
<%= testModel.my_array.get(0) %>
<%= testModel.my_array.get(1) %>
<% }catch (ArrayIndexOutOfBoundsException e){%>
	<p style = "color: red">重大なエラーが発生しました</p>
<%}catch(Exception e){ %>
	<p style = "color: red">リソースがありません</p>
<% }%>

<!-- script -->
<script type="text/javascript">
	function test_script(){
		window.alert('hello');
	}
</script>
</body>
</html>