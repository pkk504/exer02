<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.sql.*" %>
    <%@page import ="java.sql.DriverManager" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.util.UUID" %>
    <%@page import="java.util.HashSet" %>
    <%@page import="java.util.Set" %>
    <%@page import = "beans.Account" %>
    <%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="beans.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<%! %>



<%
Account acc = new Account();
List<Map<String, Object>> datas = acc.getAllDatas();
String id = request.getParameter("id");
String pass = request.getParameter("pass");
boolean accid=false;
boolean accpass=false;
String id1=null;
String pass2=null;
boolean ok=false;
Map<String,Object> each=null;
int n=0;
for(int cnt =0; cnt<datas.size();cnt++){
	each = datas.get(cnt);
	/* if(each.get("pass").equals(pass)){
		accpass=true;login2.jsp
	}else{
		accpass =false;
	} */
	if(each.get("id").equals(id)&&each.get("pass").equals(pass)){
		n=1;
		id1=(String)each.get("id"); 
		}else if(each.get("id").equals(id)&&each.get("pass").equals(pass)||application.getAttribute("set")!=null){
			n=0;
		}
	}


Set<String> set =(Set)application.getAttribute("users");


%>
	<p>
		<form action ="game/index.jsp">
		<%
		if(n==1&&!set.contains(id)){%>
		<%@ include file="/layout/top.jspf"%>
			로그인에 성공하였습니다.
			<%session.setAttribute("loginid", id); %>
			<%session.setAttribute("password", pass); %>
			<%set.add(id); %>
			<%application.setAttribute("users", set); %>
			<%session.setAttribute("latest", new Date(System.currentTimeMillis())); %>
			<button type ="submit">게임방 들어가기</button>
			</form>
			<br/>
			
			
		<% }else if(set.contains(id)||n==0){%>
		<%@ include file="/layout/logtop.jspf"%>
		
		실패하였습니다.
		
		
		<%}%>
		
	</p>

</body>
</html>