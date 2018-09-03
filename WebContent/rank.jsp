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
    <%@page import = "beans.BaseResultDAO" %>
    <%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
    <%
    BaseResultDAO dao = new BaseResultDAO();
    String idd=(String)session.getAttribute("loginid");
    %>
    <%
    long ltime = (long)session.getAttribute("lasttime");
    long stime = (long)session.getAttribute("starttime");
    long lasttime=(ltime-stime)/1000;
    Date d2 = new Date(System.currentTimeMillis());
	UUID uuid = UUID.randomUUID();
	String serial = uuid.toString().split("-")[0];
	
	/* String player = request.getParameter("sd1"); */
	int cnt = (Integer) session.getAttribute("count");
	
	java.sql.Date now = new java.sql.Date(System.currentTimeMillis()); // java.sql.Date
	
  /*  String str= request.getParameter("sd1");
	if(str.isEmpty()||str.length()<1){
		
		response.sendRedirect("result.jsp");
		application.setAttribute("login", "on");
	} */
	
	dao.addData(serial, idd, cnt, lasttime, now);
	List<Map<String, Object>> datas = dao.getAllDatas();
	
	
	
	
	SimpleDateFormat fmt1 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
	String strr= fmt1.format(d2);
    
    
    
String url="jdbc:oracle:thin:@54.180.8.152:1521:xe";
	
	String user="dev";
	String password="alcls504"; 
  /*   if(request.getParameter("sd1")==null){
    	response.sendRedirect("result.jsp");
    } */
 
    
 /*    
    application.setAttribute("sd", cnt);
  application.setAttribute("name", str); */
    
	
	
	try {
		Connection conn=DriverManager.getConnection(url, user, password);
	/* conn.setAutoCommit(false); */
	
/* 	String sql= "insert into baseresult values('"+serial+"','"+str+"',"+cnt+","+lasttime+",to_date('"+strr+"','YYYY-MM-DD HH24:MI:SS'))"; 
	
	
			
	PreparedStatement ps =conn.prepareStatement(sql);
	int n = ps.executeUpdate();
	conn.close(); */
	
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
		if(datas !=null ) {
			for(int i=0; i<datas.size(); i++) {
				Map<String,Object> each = datas.get(i);
				if(each.get("serial").equals(serial)) {				
				%>
					<b style="color: red"> RANk# <%=i+1%>. <%=each.get("player")%> <small>시도횟수
				: <%=each.get("tried")%> / <%=each.get("elapsed")%> sec / <%=each.get("logdate")%></small>
					</b>
					<br/>
				<%
				}else {
				%>
				RANk# <%=i+1%>. <%=each.get("player")%> <small>시도횟수
				: <%=each.get("tried")%> / <%=each.get("elapsed")%> sec / <%=each.get("logdate")%></small>
				<br/>
				<%	
				}
			}
		}
		%>

</p>

</body>
</html>