<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	session.removeAttribute("iddd");	
    
    session.removeAttribute("pass1");
    		%>
    		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>【Unknown】</title>
<style type="text/css">
	a{
		text-decoration: none;
	}
</style>
</head>
<body style="text-align: center;">
<form action="log12.jsp">
	ID :  <input type="text" placeholder="id" style = "width :220px; padding: 5px;" name="id"/><br/><br/>
	PASSWORD :	<input type="password" placeholder="password" style = "width :220px; padding: 5px;" name="pass"/><br/><br/>
		<button type="submit" style="text-aligb: center;font-size: 15pt">로그인</button>
		
	</form>
	<br/>
	<form action="join.jsp">
	
		<button type="submit" style="text-aligb: center;font-size: 8pt">회원가입  </button>
		
	</form>
	<br/>
	<form action="change.jsp">
	
		<button type="submit" style="text-aligb: center;font-size: 8pt">비밀번호변경</button>
		
	</form>
	<%System.out.println(request.getContextPath()); 
	String uri = request.getRequestURI();
	String query= request.getQueryString();
	System.out.println("[REQUEST] at "+uri+(query!=null? "?"+query:""));%>

</body>
</html>
</body>
</html>