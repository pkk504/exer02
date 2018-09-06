<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="beans.BatisDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%int no=Integer.parseInt(request.getParameter("no")); %> --%>
    <%int no=Integer.parseInt(request.getParameter("no")); %>
    
    <%BatisDao dao =new BatisDao();
    String id =(String)session.getAttribute("loginid");   
    Map one = dao.getondata(no);
    Number noo = (Number)one.get("NO");
   /* int r= dao.goodUp(no); */
  /*  System.out.println(r); */
   
   Map map=new HashMap();
   map.put("actor", id);
   map.put("no", no);
   
  
  
   /* int target =dao.uplogby(id);  */
    	
			%>
			<%int a = dao.addgoodlog(map); %>
    
    
    
    
   
<%@ include file="/layout/top.jspf"%>
	<%-- <%
	if(r==1&&a==1){%>
<a  href="<%=application.getContextPath()%>/board/write.jsp">뒤로가기</a>
	성공
	<%}else if(r!=1){%>
	 
	실패하셨습니다.
	<a  href="<%=application.getContextPath()%>/board/write.jsp">뒤로가기</a>
	<%}else if(a!=1){ %>
	추천을 한번 찍으셔서 실패하셨습니다.
	<%} %> --%>
	<%if(a==1){ %>
	dao.goodUp(no);
	성공<br/>
	<a   href="<%=application.getContextPath()%>/board/writeview.jsp?no=<%=no%>">뒤로가기</a>
	<%}else{ %>
	실패<br/>
		<a   href="<%=application.getContextPath()%>/board/writeview.jsp?no=<%=no%>">뒤로가기</a>
	<%} %>
	
	
</body>
</html>