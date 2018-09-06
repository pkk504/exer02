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
		System.out.println(t);
		%>
		
		no.<%=no %> <br/>작성자 : <%=title %><br/>				
		   작성시간 : <%=leftdate %><br/><br/>
		   		<b>작성내용</b>
		   		<br/>
		   <%=one.get("CONTENT") %>
		   <br/><br/>
		   
		  첨부 파일 : 
		  		 <%if(one.get("ATTACH").equals("open")){ %>
				없음
				<%}else{ %>
				<a download href="<%=application.getContextPath()%><%=attach%>">다운</a>
				<%} %><br/><br/>
		<%-- 		<form action="<%=application.getContextPath()%>/board/good.jsp?gooded=<%=t%>">
	
		<button type="submit" style="text-aligb: center;font-size: 8pt">추천업!</button>
		
	</form>
			 --%>	
			 <a   href="<%=application.getContextPath()%>/board/good.jsp?no=<%=no%>">추천업</a>
-------------------------------------------------------------------------------------------------------

</body>
</html>