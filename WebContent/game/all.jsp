<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@
    page import="java.sql.Connection"
import="java.sql.Date"
import="java.sql.DriverManager"
import="java.sql.PreparedStatement"
import="java.sql.ResultSet"
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명예의전당</title>
</head>
<body style="text-align: center">
<p>
<a href="starter.jsp"><button type="button">되돌아가기</button></a><br/>
<b><H2> !!전체 랭킹!! </H2></b><br/>

<%
String url="jdbc:oracle:thin:@park.mockingu.com:1521:xe";

String user="dev";
String password="alcls504"; 
Connection conn= 	DriverManager.getConnection(url, user, password);
System.out.println("[JDBC] Connected");

String sql = "select * from baseresult order by tried asc, elapsed asc";
PreparedStatement ps = conn.prepareStatement(sql);

ResultSet rs=  ps.executeQuery(); 
System.out.println("[JDBC] sql execute");
%>
<%

if(rs.next()) {
	int rank = 1;
	do {
String p1 =	rs.getString("player");
String p2 = rs.getString(2);//위에거랑 같음.
int n1 = rs.getInt("tried");
int n2 = rs.getInt(3);
Double e1 = rs.getDouble("elapsed");
Date d1 = rs.getDate("logdate");
Date d2 = rs.getDate(5);%>
<%if(rank<=10){ %>
<b style = "color: red"><%=rank %> 등 : <%=p1 %> / 횟수: <%=n1 %> / 걸린시간: <%=e1 %> / 갱신 날짜: <%=d1 %></b><br/><br/>
<%}else{%>
<b ><%=rank %> 등 : <%=p1 %> / 횟수: <%=n1 %> / 걸린시간: <%=e1 %> / 갱신 날짜: <%=d1 %></b><br/><br/>
<%} %>
<%rank ++; %>
<%	}while(rs.next());

}else {
	//데이터가 존재 하지 않는다.
}
conn.close();
%>



</p>
</body>
</html>