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
<%@ include file="/layout/top.jspf"%>
<%String path =request.getRealPath("change12.jsp");
System.out.print("change12 의 리얼경로"+path);
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
<% session.setAttribute("iddd",request.getParameter("id"));%>
<br/>
	<form action="change13.jsp">
	변경할 PASSWORD  :  <input type="text" placeholder="password" style = "width :220px; padding: 5px;" name="pass1"/><br/><br/>
	재확인 PASSWORD :	<input type="text" placeholder="password" style = "width :220px; padding: 5px;" name="pass2"/><br/><br/>
		<button type="submit" style="text-aligb: center;font-size: 13pt">비밀번호변경</button>
		
	</form>
	<%} else {%>
	
<form action="change.jsp">
	존재하지 않거나 틀린 정보입니다.<br/>
		<button type="submit" style="text-aligb: center;font-size: 13pt">다시입력하기</button>
	<% }%>



	


	
		

</body>
</html>

