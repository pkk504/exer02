<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%	session.removeAttribute("pass1");  %>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body style="text-align: center;">
<form action="join12.jsp">
	
	ID :<input type="text" name="id" style="text-aligb: center;font-size: 15pt"/><br/>
	PASSWORD :<input type="password" name="pass" style="text-aligb: center;font-size: 15pt"/><br/>
	NAME :<input type="text" name="name" style="text-aligb: center;font-size: 15pt"/><br/>
	GENDER :<input type ="radio" name="gender" value="남"/> 남
		<input type ="radio" name="gender" value="여"/> 여<br/>
		<button type="submit" style="text-aligb: center;font-size: 15pt">회원가입</button>
		
	<h3><b>ID,PASSWORD,NAME 3글자이상.</b></h3>
	</form>
	
	
	<br/>

	
	<form action="log.jsp">
	
		<b><small>로그인 하러가기</small></b>  <button type="submit" style="text-aligb: center;font-size: 15pt"><b>로그인</b></button>
		
	</form>

</body>
</html>