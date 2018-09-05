<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.sql.*" %>
    <%@page import ="java.sql.DriverManager" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.util.UUID" %>
    <%@page import="java.util.HashSet" %>
    <%@page import="java.util.Set" %>
    <%@page import = "beans.Account" %>
    <%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body style="text-align: center;">


<%
String reg1 = "[A-Za-z\\d]{4,12}";
String reg2 = "[가-힇]{2,}";
boolean rst=false;
boolean rrst=false;
Account acc = new Account();
List<Map<String, Object>> datas = acc.getAllDatas();
int n=0 ;
		String id =request.getParameter("id");
		String pass =request.getParameter("pass");
		String name =  request.getParameter("name");
		String gender = request.getParameter("gender");


if(!id.matches("\\w{4,12}") || !name.matches("[가-힇]{2,}")){
	response.sendRedirect("join.jsp");
		
	}else{
		n=acc.addData(id, pass, name, gender);
	
}
			
		
	

	

	




	
	










%>

<%if(n==1){%>





<h2>회원가입에 성공하셨습니다.</h2>
<form action="log.jsp">
	
	
		<button type="submit" style="text-aligb: center;font-size: 15pt">로그인</button>
</form>
			
<%}else{%>
	<h2>이미 가입된 아이디나 닉네임 입니다.</h2>
	<form action="join.jsp">
	
	
		<button type="submit" style="text-aligb: center;font-size: 15pt">회원가입</button>
</form>
</body>
</html>
<%}
%>