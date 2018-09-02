<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int number;
    
    do{
	number = 100 + (int)(Math.random()*900);
	} while(number/100 == number%10 || number/100 == number%100/10 || number%100/10 == number%10);
    session.setAttribute("number", number);
    
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Base Ball</title>
</head>
<body style="text-align: center">
	<h1>미니게임 - Base Ball</h2>	
	<p>
		<a href="turn.jsp"><button type="button">S T A R T</button></a>
		<%
			
			Integer v = (Integer) application.getAttribute("sd");
		session.setAttribute("count", 1);
		session.removeValue("anum");
		session.removeValue("strike");
		session.removeValue("ball");
		if(session.getAttribute("starttime")!=null){
		session.removeAttribute("starttime");
		}
		
		%>
		<%if(session.getAttribute("user")==null){
			session.setAttribute("user", "on");
		}%>
	<br/>
		최근 스코어 :<%=(v == null) ? ("기록없음") : (v + "턴")%>
		<br/>
		<%if(application.getAttribute("name")==null){ %>
		
		최근 사용자 : 없음
		<%}else{ %>
		최근 사용자 : <%=application.getAttribute("name") %>
		<%} %>
		<%-- <%
			session.setAttribute("count", 1);
		%> --%>
	</p>
	
</body>
</html>