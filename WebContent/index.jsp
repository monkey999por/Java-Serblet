<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>タイトルだお！</title>
</head>
<body>
<h1>ヘッダーを追加するお!</h1>
<p>	フォームのテスト</p>
<form method="post"  action="/Java_Servlet/TestServlet">
	<input type="text" name="test_value" value="送るお！"/>
	<input type="submit" value="Go!"/>
	<div></div>
	<input type="button" name="hello" value="おしてみ"  onclick="test_script()">
	<br>
	<br>
	<p>表示領域</p>
	<p>-------------------------------------------------------------</p>
	
	
	
</form>

<script type="text/javascript">
	function test_script(){
		window.alert('hello');
	}
</script>
</body>
</html>