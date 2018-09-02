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
<%! %>


<%
Account acc = new Account();
List<Map<String, Object>> datas = acc.getAllDatas();
String id = request.getParameter("id");
String pass = request.getParameter("pass");
boolean accid=false;
boolean accpass=false;
String id1=null;
String pass2=null;
boolean ok=false;
Map<String,Object> each=null;
for(int cnt =0; cnt<datas.size();cnt++){
	each = datas.get(cnt);
	/* if(each.get("pass").equals(pass)){
		accpass=true;login2.jsp
	}else{
		accpass =false;
	} */
	if(each.get("id").equals(id)&&each.get("pass").equals(pass)){
		id1=(String)each.get("id");
		pass2 =(String)each.get("pass");
		}
	}





%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body style="text-align: center;">
	<p>
		
		<%
		if(id1!=null&&pass2!=null){%>
			로그인에 성공하였습니다.
			<%session.setAttribute("loginid", id1); %>
			<a href="index.jsp"><button type="button">게임 시작하기</button></a>
			
		<% }else{%>
		
		
		실패하였습니다.
		<a href="log.jsp"><button type="button">재로그인</button></a>
		
		<%}%>
		
	</p>

</body>
</html>