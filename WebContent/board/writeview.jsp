<%--특정 키에 해당하는 데이터 출력--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="beans.BatisDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int no = Integer.parseInt(request.getParameter("no"));
    BatisDao dao = new BatisDao();
    Map one = dao.getondata(no);
    
    %>
<%@ include file="/layout/top.jspf"%>
<%
String writer=(String)one.get("WRITER");
		String title=(String)one.get("TITLE");
		Date leftdate =(Date)one.get("LEFTDATE");
		String content =(String)one.get("CONTENT");
		String attach =(String)one.get("ATTACH");
		Number good =(Number)one.get("GOOD");
		int t =good.intValue();
		System.out.println(good);
		%>
		
		no.<%=no %> <br/>작성자 : <%=title %><br/>				
		   작성시간 : <%=leftdate %><br/><br/>
		   		<b>작성내용</b>
		   		<br/>
		   <%=one.get("CONTENT") %>
		   <br/><br/>
		   
		  첨부 파일 : 
		  		 <%if(one.get("ATTACH").equals(session.getAttribute("king"))){ %>
				없음
				<%}else{ %>
				<a href="<%=application.getContextPath()%><%=attach%>" download>다운</a>
				<%} %><br/><br/>
		<%-- 		<form action="<%=application.getContextPath()%>/board/good.jsp?gooded=<%=t%>">
	
		<button type="submit" style="text-aligb: center;font-size: 8pt">추천업!</button>
		
	</form>
			 --%>	
			 <%-- <a   href="<%=application.getContextPath()%>/board/good.jsp?no=<%=no%>">추천업</a> --%>
			 <a href="<%=application.getContextPath()%>/board/good.jsp?no=<%=no%>"><samll><b>추천
				<img src="http://<%=request.getServerName() %>:<%=request.getServerPort() %>/<%=request.getContextPath() %>/image/엄지척.png"style="width: 50px; border-radius: 50px;" /></b></samll></a>
				<br/><br/>
-------------------------------------------------------------------------------------------------------

</body>
</html>