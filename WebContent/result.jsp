<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%@page errorPage="turn.jsp" %> --%>
    <%
    int in=1;
    if(request.getParameter("num")!=null){
    in = Integer.parseInt(request.getParameter("num"));
    }
    
    
  /*   if(in/100==in%100/10||in/100==in%10||in%100/10==in%10||in==0){
    	response.sendRedirect("turn.jsp");
    } */
   
   
  
    
    %>
    	<%Set<String> set = (Set)session.getAttribute("mode"); %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과</title>
</head>
<body style="text-align: center">
 <%
  int cnt=  (Integer)session.getAttribute("count");
    session.setAttribute("anum",in);
    int target =(Integer)session.getAttribute("number");
    
    int strike;
    int ball;
    if(in!=target&&in/100!=in%100/10&&in/100!=in%10&&in%100/10!=in%10){
    cnt++;
	int c=0;
	if(in/100 == target%1000/100)
		c++;
	if(in%100/10 == target%100/10)
		c++;
	if(in%10 == target%10/1)
		c++;
	strike = c;
	session.setAttribute("strike", strike);
	
	int b=0;
	if(in%1000/100 == target%100/10 || in%1000/100 == target%10/1)
		b++;
	if(in%100/10 == target%1000/100 || in%100/10 == target%10/1)
		b++;
	if(in%10/1 == target%1000/100 || in%10/1 == target%100/10)
		b++;
	ball = b;
	session.setAttribute("ball", ball);%>
	<h1> <%=strike %>S / <%=ball %>B</h1>
	
    	<p>
    	<%String str1 = in+"="+strike+"S /"+ball+" ball"; %>
    	<%set.add(str1); %>
    	<%session.setAttribute("mode", set); %>
	<a href="turn.jsp"><button type="button">R E T R Y</button></a>
	</p>
	<%session.setAttribute("count", cnt); %>
    
   
  <%}else if (in==target||application.getAttribute("login")=="on") {
   /* application.setAttribute("sd", cnt); */%>
		<%
		set.add(in+"은 정답입니다. 다시입력해주세요.");
		
		long ltime = System.currentTimeMillis();
		session.setAttribute("lasttime",ltime ); %>
		정답입니다!! 
		
			<form action="rank.jsp">
		
		<button type="submit" style="text-aligb: center;font-size: 15pt">다음</button>
		
	</form>
	
	<%}%>
	
</body>
</html>