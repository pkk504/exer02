<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
    <%@page import="java.sql.*" %>
    <%@page import ="java.sql.DriverManager" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%
    int number;
    if(session.getAttribute("loginid")==null){
    	response.sendRedirect("log.jsp");
    }
    
    do{
	number = 100 + (int)(Math.random()*900);
	} while(number/100 == number%10 || number/100 == number%100/10 || number%100/10 == number%10);
    session.setAttribute("number", number);
    
    session.setAttribute("mode", new LinkedHashSet());
    session.removeAttribute("log");
    %>
    
    <%
		String url="jdbc:oracle:thin:@park.mockingu.com:1521:xe";
		
		String user="dev";
		String password="alcls504"; 
	Connection conn= 	DriverManager.getConnection(url, user, password);
	
	
	String sql =  "select*from baseresult order by tried asc,elapsed asc" ;
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ResultSet rs=  ps.executeQuery(); 

    %>
 <%--    <%=number %> --%>
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
		<h3>
		명예의 전당<br/> <span style="font-size: x-small;"><a href="all.jsp"
			style="text-decoration: none;">+ 전체 랭킹 , </a></span>
	</h3>
	<h3>
		 <span style="font-size: x-small;"><a href="mon.jsp"
			style="text-decoration: none;">+ 월간 랭킹  , </a></span>
	</h3>
	<h3>
		 <span style="font-size: x-small;"><a href="week.jsp"
			style="text-decoration: none;">+ 주간 랭킹  , </a></span>
	</h3>
	<h3>
		 <span style="font-size: x-small;"><a href="day.jsp"
			style="text-decoration: none;">+ 일간 랭킹  , </a></span>
	</h3>
		 <%
		if(rs.next()) {
			String p1 =	rs.getString("player");
			int n1 = rs.getInt("tried");
			Double e1 = rs.getDouble("elapsed");
			Date d1 = rs.getDate("logdate");%>
			<br/>최고 경신기록자 : <%=p1%><br/>
			기록 : <%=n1 %>회  / 걸린시간 : <%=e1%> / 날짜 : <%=d1 %>  
			
		<%}%>
		<%conn.close(); %>
		<%-- <%if(session.getAttribute("user")==null){
			session.setAttribute("user", "on");
		}%>
	<br/>
		최근 스코어 :<%=(v == null) ? ("기록없음") : (v + "턴")%>
		<br/>
		<%if(application.getAttribute("name")==null){ %>
		
		최근 사용자 : 없음
		<%}else{ %>
		최근 사용자 : <%=application.getAttribute("name") %>
		<%} %> --%>
		<%-- <%
			session.setAttribute("count", 1);
		%> --%>
	</p>
	
</body>
</html>