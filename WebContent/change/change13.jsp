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
<%@ include file="/layout/top.jspf"%>
<br/>
<%
Account acc = new Account();
String id=(String)session.getAttribute("iddd");
String pass=(String)request.getParameter("pass1");

if(request.getParameter("pass1").equals(request.getParameter("pass2"))){%>
	<h2>변경 완료되었습니다.</h2><br/>
	<% acc.addupData(pass,id); %>
	
	
<%}else if(!request.getParameter("pass1").equals(request.getParameter("pass2"))||request.getParameter("pass1").length()<=4||request.getParameter("pass2").length()<=4){%>
	<H2>서로다른 password 입니다.</H2><br/>
	 <form action="change.jsp">
	존재하지 않거나 틀린 정보입니다.<br/><br/>
		돌아가기<button type="submit" style="text-aligb: center;font-size: 13pt">돌아가기</button>
	</form>
	
<%}%> 

</body>
</html>