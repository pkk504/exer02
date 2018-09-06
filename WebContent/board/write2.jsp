<%@page import="beans.BatisDao"%>
<%@page import="java.util.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.Part"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>

<%Map map = new HashMap(); %>
	<%MultipartParser parser = new MultipartParser(request, 1024*1024*100, true, true, "UTF-8");
	
			BatisDao dao= new BatisDao();
			String writer = (String)session.getAttribute("loginid");
%>
<%while(true) {
		Part part = parser.readNextPart();
		/* out.println(part+"<br/>"); */
		if(part == null) {
			break;
		}else {
			String name = part.getName();
			/* boolean b1 = part.isFile();
			boolean b2 = part.isParam();
			out.println(name+".."+b1+"/"+b2+"<br/>"); */
			if(part.isFile()) {
				FilePart fp = (FilePart)part;
				String fn = fp.getFileName();
				String fpt = fp.getFilePath();	// 기본 temp저장경로를 설정안하면, 파일명 똑같이 나옴.
				
				/* 	File ori = new File(fpt);
				
				
				out.println(ori.length());
				String fct = fp.getContentType();
				out.println("<h3>"+fn+".."+fpt+".."+fct+"</h3>"); */
				// 업로드를 진행해야된다면..
				// 직접 IO 작업을 하거나 writeTo,
				// fp.getInputStream();
				/* String sav = application.getRealPath("/storage");
				File saveDir = new File(sav);
				
				fp.writeTo(saveDir);//경로저장 */
				  long time = System.currentTimeMillis();
			      File saveDir = new File(application.getRealPath("/storage"), String.valueOf(time) );
			        saveDir.mkdirs();
			       fp.writeTo(saveDir);
				%>
				<%-- 실제업로드한 경로 : <%=saveDir%> <br/>				
				당신이 접근할수 있게 설정된 uri : 
					<%=request.getContextPath() %>/storage/<%=fn %><br/> --%>
					<%out.println("파일이름 =" + fn); %>
				<%if(fn!=null){ %>
		<% 	map.put("attach","/storage/"+time+"/"+fn);%>
				<%-- <a download href="<%=application.getContextPath()%>/storage/<%=time %>/<%=fn%>">다운</a> --%>
				<%}else if(fn==null){ %>
				<% map.put("attach","open");%>
				<%} %>
				<%
			}else if(part.isParam()) {
				ParamPart param = (ParamPart)part;
				
				/* 
				 out.println("<h3>"+ param.getName()+"= " + param.getStringValue() +"</h3>");  */
			map.put(param.getName(), param.getStringValue());
			}
		}
	}
	long rr =1+(long)(Math.random()*10000);
	long rrr =2+(long)(Math.random()*10000);
		String no = dao.getNodata();
			map.put("writer", writer); 
			map.put("no", no);
			map.put("good", (Number)rrr);
			%>
		
		<% int r=	dao.addboard(map);
		if(r==1){%>
			등록에 성공.
			<br/>
			<a  href="write.jsp">돌아가기</a>
		<% }else{%>
			등록에 실패.
			<br/>
			<a  href="write.jsp">돌아가기</a>
		<%}%>
	

</body>
</html>