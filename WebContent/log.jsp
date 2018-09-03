<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	session.removeAttribute("iddd");	
    
    session.removeAttribute("pass1");
    		%>
    		

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body style="text-align: center;">
<form action="log12.jsp">
	ID :  <input type="text" name="id" style="font-size: 16px; padding: 5px" : center;font-size: 15pt"/><br/>
	PASSWORD :	<input type="password" name="pass" style="font-size: 16px; padding: 5px" : center;font-size: 15pt"/>
		<button type="submit" style="text-aligb: center;font-size: 15pt">확인</button>
		
	</form>
	<br/>
	<form action="join.jsp">
	
		<button type="submit" style="text-aligb: center;font-size: 10pt">회원가입    </button>
		
	</form>
	<br/>
	<form action="change.jsp">
	
		<button type="submit" style="text-aligb: center;font-size: 10pt">비밀번호변경</button>
		
	</form>

</body>
</html>
</body>
</html>