<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int count = 0;
    if((Integer)(session.getAttribute("count"))!=null){
 	   count=(Integer)(session.getAttribute("count"));
    }
    System.out.println(session.getAttribute("number"));
    
    Set str = (Set)session.getAttribute("mode");
   
    long stime =System.currentTimeMillis();
    if(session.getAttribute("starttime")==null){
    session.setAttribute("starttime", stime);
    }
   
    %>
    <%
    
    %>
  <%  
    Iterator<Set> itr = str.iterator();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Base Ball</title>
</head>
<body style="text-align: center">
<h2>미니게임 - Base Ball</h2>	
<h3>100부터 999 사이의 숫자를 입력해주세요!</h3>
<br/>
	<%if(session.getAttribute("strike")==null ){%>
	<h1>**???**</h1>
	<%}else if(session.getAttribute("strike")!=null ){ %>
	
		<%if(session.getAttribute("log")==null){ %>
	<h1>숫자  <%=session.getAttribute("anum") %></h1>  
	<h2><%=session.getAttribute("strike")%> S / <%=session.getAttribute("ball")%> B</h2>
	<%}else{ %>
	 <h2>다시입력해주세요.</h2>
	<%}
	%>
	<p><%=count++ %> 번째 시도</p>
	<% if(str!=null){ 
	while(itr.hasNext()){%>
	<%Object ii=itr.next();%>
	
	<b><%=ii %></b><br/>	
	
	
	
	
	
	<%}}}%>
	<%
	if(count==1){
		str.clear();
	}
	%>


	<br/>
	<br/>
	<br/>
	
	<form action="result.jsp">
		<input type="number" min="100" max="999" name="num" style="text-aligb: center;font-size: 15pt"/>
		<button type="submit" style="text-aligb: center;font-size: 15pt">CHECK</button>
		
	</form>

</body>
</html>