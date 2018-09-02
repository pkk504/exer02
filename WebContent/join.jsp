<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body style="text-align: center;">
<form action="join2.jsp">
	
	ID :<input type="text" name="id" style="text-aligb: center;font-size: 15pt"/><br/>
	PASSWORD :<input type="text" name="pass" style="text-aligb: center;font-size: 15pt"/><br/>
	NAME :<input type="text" name="name" style="text-aligb: center;font-size: 15pt"/><br/>
	GENDER :<input type ="radio" name="gender" value="남"/> 남
		<input type ="radio" name="gender" value="여"/> 여
		<button type="submit" style="text-aligb: center;font-size: 15pt">CHECK</button>
		
	</form>
	<h3><b>ID,PASSWORD,NAME 3글자이상.</b></h3>

</body>
</html>