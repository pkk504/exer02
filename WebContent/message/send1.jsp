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
    
   
    
    
    int n=10;
 

    
    
    %>
<%@ include file="/layout/top.jspf"%>
<p>
<% 
if(!sender.equals(receiver)){
	n= msg.addData(code, sender, receiver, content,senddate);
}else if(sender.equals(receiver)){%>
	
<%}%>
 <% if(n==1){
	 
	 session.setAttribute("qhsorl", "on");%>
	 <b>성공하셨습니다.<b/>
	 <a href="send.jsp">메시지보내기</a><br/>
 <%}else if(n!=1||sender.equals(receiver)){%>
	보내기 실패하셨습니다<br/>
	<a href="send.jsp"><button type="button">다시보내기</button></a><br/>
	 
 <%} %>
</p>

</body>
</html>