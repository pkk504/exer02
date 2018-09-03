<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "beans.Message" %>
    <%@page import="java.util.UUID" %>
      <%@page import="java.sql.Date" %>
    <%
    Message msg =new Message();
    UUID uuid = UUID.randomUUID();
	String code = uuid.toString().split("-")[0];
    String sender= (String)session.getAttribute("loginid");
    String receiver = (String)request.getParameter("receiver");
    String content = (String)request.getParameter("content");
    Date senddate = new Date(System.currentTimeMillis());
    
   
    
    
 int n= msg.addData(code, sender, receiver, content,senddate);
 

    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
 <% if(n==1){
	 response.sendRedirect("send.jsp");
 }else{%>
	보내기 실패하셨습니다<br/>
	<a href="send.jsp"><button type="button">다시보내기</button></a>
	 
 <%} %>
</p>

</body>
</html>