<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="beans.*" %>
    <%@page import="java.sql.Date" %>
    <%@page import="java.util.*" %>
    <%@ page import="java.text.*" %>

<%@ include file="/layout/top.jspf"%>

<%
UUID uuid= UUID.randomUUID();
SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
String id=(String)session.getAttribute("loginid");
Message msg =new Message();
List<Map<String, Object>> datas = msg.receive(id);
msg.addreceivedate(id); 



if(datas !=null ) {
	for(int i=0; i<datas.size(); i++) {
		Map<String,Object> each = datas.get(i);%>
	<%if(each.get("receivedate")==null){ %>
	 <%msg.addreceivedate((String)each.get("sender")); %> 
			<%} %>
			
			
	보낸사람 : <%=each.get("sender") %>/   받은내용 <%=each.get("content") %>   /   보낸시간 : <%=sdf.format(each.get("senddate")) %>  /  
	 읽은 시간 : <%=each.get("receivedate") %> 
		<br/> <br/> 
		<%System.out.println(each.get("code")); %>
			
			
	
	<%}
}
		
%>










<%@ include file="/layout/bottom.jspf"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="beans.*" %>
    <%@page import="java.sql.Date" %>
    <%@page import="java.util.*" %>
    <%@ page import="java.text.*" %>

<%@ include file="/layout/top.jspf"%>


<% 
String id=(String)session.getAttribute("loginid");

Message msg =new Message();
msg.addreceivedate(id);

%>  

<%
UUID uuid= UUID.randomUUID();
SimpleDateFormat sdf = new SimpleDateFormat("HH:mm MM.dd.YYYY");
List<Map<String, Object>> datas = msg.receive(id);



if(datas !=null ) {
	for(int i=0; i<datas.size(); i++) {
		Map<String,Object> each = datas.get(i);%>
	
			
			
	보낸사람 : <%=each.get("sender") %> <br/> 받은내용 : <%=each.get("content") %>   <br/> 받은시간 : <%=sdf.format(each.get("senddate")) %>    
	 
	<br/> 읽은 시간 : <%=sdf.format(each.get("receivedate")) %> 
	
		<br/> <br/> 
	--------------------------------------------------------------------------------------------------------------------
		<br/> <br/> <br/> 
			
			
	
	<%}
}
		
%>










<%@ include file="/layout/bottom.jspf"%>