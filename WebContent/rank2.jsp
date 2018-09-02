<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%--   <%@page errorPage="result.jsp" %> --%>
    <%@page import="java.sql.*" %>
    <%@page import ="java.sql.DriverManager" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.util.UUID" %>
    <%@page import="java.util.HashSet" %>
    <%@page import="java.util.Set" %>
    
    <%
	UUID uuid = UUID.randomUUID();
	String serial = uuid.toString().split("-")[0];
   String str= request.getParameter("sd1");
	if(str.isEmpty()||str.length()<1){
		
		response.sendRedirect("result.jsp");
		application.setAttribute("login", "on");
	}
	
	
    
    
String url="jdbc:oracle:thin:@54.180.8.152:1521:xe";
	
	String user="dev";
	String password="alcls504"; 
    if(request.getParameter("sd1")==null){
    	response.sendRedirect("result.jsp");
    }
   int cnt=(Integer)session.getAttribute("count");
    
    
    application.setAttribute("sd", cnt);
  application.setAttribute("name", str);
    long ltime = (long)session.getAttribute("lasttime");
    long stime = (long)session.getAttribute("starttime");
    long lasttime=(ltime-stime)/1000;
    Date d2 = new Date(System.currentTimeMillis());
	
	SimpleDateFormat fmt1 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
	String strr= fmt1.format(d2);
    
    
	
	
	try {
		Connection conn=DriverManager.getConnection(url, user, password);
	/* conn.setAutoCommit(false); */
	
	String sql= "insert into baseresult values('"+serial+"','"+str+"',"+cnt+","+lasttime+",to_date('"+strr+"','YYYY-MM-DD HH24:MI:SS'))"; 
	
	
			
	PreparedStatement ps =conn.prepareStatement(sql);
	int n = ps.executeUpdate();
	conn.close();
	
	}catch(Exception e) {
		System.out.println("[JDBC]ERROR - "+e);
		e.printStackTrace();
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최고기록경신 처리</title>
</head>
<body style="text-align: center">
<h1>#완료되었습니다.#</h1>
<a href="index.jsp"><button type="button">되돌아가기</button></a>
<p>
 <%
		
	Connection conn= 	DriverManager.getConnection(url, user, password);
	
	
	String sql =  "select*from baseresult order by tried asc,elapsed asc" ;
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ResultSet rs=  ps.executeQuery(); 

    %>
    <%
    Set s =new HashSet<>();
	
	
	
    %>
    <%
		if(rs.next()) {
			int rank = 1;
			do{
				String s1 = rs.getString("serial");
			String p1 =	rs.getString("player");
			int n1 = rs.getInt("tried");
			Double e1 = rs.getDouble("elapsed");
			Date d1 = rs.getDate("logdate");%>
			<%if(s1.equals(str)){ %>
			 
			<small><%=rank %>등 : <%=s1 %> / <%=p1 %> : <%=n1 %>회  날짜 : <%=d1 %></small> <br/>  
			<%}else{ %>
			
			
			
			<%=rank %>등 :<%=s1 %> / <%=p1 %> /  <%=n1 %>회  / 날짜 : <%=d1 %> <br/>  
			<%}
			rank++;} while(rs.next());%>
			
		<%}%>
		<%conn.close(); %>


</p>

</body>
</html>