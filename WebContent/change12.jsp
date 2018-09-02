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
<%!%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호변경</title>
</head>
<body style="text-align: center;">
<%
Account acc = new Account();
List<Map<String, Object>> datas = acc.getAllDatas();
boolean rst;



for(int cnt =0; cnt<datas.size();cnt++){
	Map<String,Object> 	each = datas.get(cnt);
	if(each.get("id").equals(request.getParameter("id"))&&each.get("pass").equals(request.getParameter("pass"))){%>
	<%
	session.setAttribute("iddd",request.getParameter("id"));
	
	
	%>
<% 
%> 
	
	<%
}}%>


<%if(session.getAttribute("iddd")!=null){%>
	<form action="change13.jsp">
	변경할 PASSWORD  :  <input type="text" name="pass1" style="text-aligb: center;font-size: 15pt"/><br/>
	재확인 PASSWORD :	<input type="text" name="pass2" style="text-aligb: center;font-size: 15pt"/><br/>
		<button type="submit" style="text-aligb: center;font-size: 13pt">비밀번호변경</button>
		
	</form>
	<%} else {%>
	
<form action="change.jsp">
	존재하지 않거나 틀린 정보입니다.<br/>
		<button type="submit" style="text-aligb: center;font-size: 13pt">다시입력하기</button>
	<% }%>



	
	


	
		

</body>
</html>

