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
boolean ok=false;
for(int cnt =0; cnt<datas.size();cnt++){
	Map<String,Object> each = datas.get(cnt);
	if(each.get("id").equals(id)){
		accid=true;
	
		}
	/* if(each.get("pass").equals(pass)){
		accpass=true;login2.jsp
	}else{
		accpass =false;
	} */
	}

for(int cnt =0; cnt<datas.size();cnt++){
	Map<String,Object> each = datas.get(cnt);
	
	 if(each.get("pass").equals(pass)){
		accpass=true;
	}
	




}

if(accid==true&&accpass==true){
	ok=true;
	session.setAttribute("login", "on");
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
		if(ok==true){%>
			로그인처리 = <%=ok %><br/>
			<a href="start.jsp"><button type="button">게임 시작하기</button></a>
		<% }else{%>
		로그인처리 = <%=ok %><br/>
		
		실패하였습니다.
		<a href="log.jsp"><button type="button">재로그인</button></a>
		
		<%}%>
		
	</p>

</body>
</html>