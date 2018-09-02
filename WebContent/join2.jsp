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
Account acc = new Account();
List<Map<String, Object>> datas = acc.getAllDatas();

Map<String,Object> each = null;
for(int cnt =0; cnt<datas.size();cnt++){
	each = datas.get(cnt);

}
if(request.getParameter("id").length()<=2||request.getParameter("pass").length()<=1
||request.getParameter("name").length()<=2||request.getParameter("gender")==null||request.getParameter("gender")==null
||each.get("id").equals(request.getAttribute("id"))||each.get("name").equals(request.getAttribute("name"))){
	response.sendRedirect("join.jsp");
}else{
	
	String id =request.getParameter("id");
	String pass =request.getParameter("pass");
	String name =  request.getParameter("name");
	String gender = request.getParameter("gender");
	acc.addData(id, pass, name, gender);

}









%>
<h2>회원가입에 성공하셨습니다.</h2>
<form action="log.jsp">
	
	
		<button type="submit" style="text-aligb: center;font-size: 15pt">로그인</button>

</body>
</html>