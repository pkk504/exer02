<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="beans.BatisDao"%>
<%@page import="java.util.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.Part"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ include file="/layout/top.jspf"%>

		<h3><b>게시판</b></h3>
		<%
		BatisDao dao = new BatisDao();
		List<Map> li = dao.getAllresult();
		if(li==null||li.size()==0){
		%>
		게시한 글이 없습니다.
		<%}else{ %>
		<%for(int i=0; i<li.size();i++){ 
		Map map= new HashMap();
				map =li.get(i);
		Number no =(Number)map.get("NO");
		String writer=(String)map.get("WRITER");
		String title=(String)map.get("TITLE");
		Date leftdate =(Date)map.get("LEFTDATE");
		String content =(String)map.get("CONTENT");
		String attach =(String)map.get("ATTACH");
		Number good =(Number)map.get("GOOD");
		%>
		
		no.<%=no %>/ 제목 : <a   href="<%=application.getContextPath()%>/board/writeview.jsp?no=<%=no%>"><%=title %></a><br/>				
		   작성시간 : <%=leftdate %> / 추천수 : <%=good %><br/>
		 <%--   파일 : 
		  		 <%if(map.get("ATTACH").equals("open")){ %>
				없음.
				<%}else{ %>
				<a  download href="<%=attach%>">다운</a>
				<%} %> --%><br/><br/>
-------------------------------------------------------------------------------------------------------
<br/><br/>
		
		
		<%}
		}%>
			<br/>
			<br/>
		<a href="write1.jsp">게시글 쓰기</a>
		


</body>
</html>