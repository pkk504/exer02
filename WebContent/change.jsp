<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%session.removeAttribute("iddd");	 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body style="text-align: center;">
<H2>비밀번호 변경을 위해 ID 와 PASSWORD 를 입력해주세요.</H2>
<form action="change12.jsp">
	ID :  <input type="text" name="id" style="text-aligb: center;font-size: 15pt"/><br/>
	PASSWORD :	<input type="text" name="pass" style="text-aligb: center;font-size: 15pt"/>
		<button type="submit" style="text-aligb: center;font-size: 15pt">CHECK</button>
		
	</form>
	<br/>
	<br/>
	<form action="log.jsp">
	
		<b><small>로그인 하러가기</small></b>  <button type="submit" style="text-aligb: center;font-size: 10pt"><b>로그인</b></button>
		
	</form>

</body>
</html>