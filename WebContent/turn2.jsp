<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int count = 0;
    if((Integer)(session.getAttribute("count"))!=null){
 	   count=(Integer)(session.getAttribute("count"));
    }
    System.out.println(session.getAttribute("number"));
    Object str = session.getAttribute("mode");
    long stime =System.currentTimeMillis();
    if(session.getAttribute("starttime")==null){
    session.setAttribute("starttime", stime);
    }
    if(session.getAttribute("user")==null){
    	response.sendRedirect("in.jsp");
    	
    }
    %>
    <%! 
    Set<Object> set = new LinkedHashSet();
    %>
  <%  set.add(str);
    Iterator<Object> itr = set.iterator();%>
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
	

	<h1>숫자  <%=session.getAttribute("anum") %></h1>  
	<h2><%=session.getAttribute("strike")%> S / <%=session.getAttribute("ball")%> B</h2>
	<p><%=count++ %> 번째 시도</p>
	<% if(set!=null){ 
	while(itr.hasNext()){%>
	<%Object ii=itr.next();%>
	
	<b><%=ii %></b><br/>	
	
	
	
	
	
	<%}}}%>
	<%
	if(count==1){
		set.clear();
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