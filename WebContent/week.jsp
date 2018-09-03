<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@
    page import="java.sql.Connection"
import="java.util.Date"

import="java.sql.DriverManager"
import="java.sql.PreparedStatement"
import="java.sql.ResultSet"
import ="java.text.SimpleDateFormat"
     %>
     <%
     java.sql.Date dd = new java.sql.Date(System.currentTimeMillis());
     long d = System.currentTimeMillis();
		Date c = new Date(d);
		SimpleDateFormat fmt = new SimpleDateFormat("MM/dd/yyyy"); 
		Date t = new Date(fmt.format(c));
		long tt=t.getTime();
		System.out.println(t);
		
     long b =dd.getDay();
     System.out.println("요일"+b);
     
		long bb=(b-1)*1000*60*60*24;
		java.sql.Date start = new java.sql.Date(tt);
		System.out.println(start);
		java.sql.Date end = new java.sql.Date((tt)+(1000L*60*60*24*7));
		System.out.println("마지막 = "+ end );
		
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명예의전당</title>
</head>
<body style="text-align: center">
<p>
<a href="index.jsp"><button type="button">되돌아가기</button></a><br/>
<b><H2> !!주간 랭킹!! </H2></b><br/>
<%
try {
	// step1 . connect
	String url="jdbc:oracle:thin:@park.mockingu.com:1521:xe";
	
	String user="dev";
	String password="alcls504"; 
Connection conn= 	DriverManager.getConnection(url, user, password);
System.out.println("[JDBC] Connected");
//step2. request send / response receive
// 2-1 . ready sql statement
String sql =  "select*from baseresult where logdate between to_date('"+start+" 00:00:01','YYYY-MM-DD HH24:MI:SS') and to_date('"+end+" 23:59:59','YYYY-MM-DD HH24:MI:SS') order by tried asc,elapsed asc" ;
PreparedStatement ps = conn.prepareStatement(sql);
// 2-2 data binding 

// 2-3 send ..receive
 // c,u,d 같이 테이블에 변화를 주는 sql은 executeUpdate(); 반환값이 처리된 개수
// r 작업은 ResultSet executeQuery(); 메서드로 요청처리를 해야함. 반환값이 컬렉션 객체
ResultSet rs=  ps.executeQuery(); 
System.out.println("[JDBC] sql execute");
//ResultSet 객체는 Iterator 객체 사용법과 유사
//hasNext()...next() 가 따로 구현되있지 않다.

/*
 * 데이터가 있는지 없는지 혹은 몇개가 있는지 모르면..
 * 
 * 
 */
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
<b><%=rank %> 등 : <%=p1 %> / 횟수: <%=n1 %> / 걸린시간: <%=e1 %> / 갱신 날짜: <%=d1 %></b><br/><br/>
<%rank ++; %>
<%	}while(rs.next());

}else {
	//데이터가 존재 하지 않는다.
}
conn.close();



}catch(Exception e) {
	e.printStackTrace();
}
%>


</p>
</body>
</html>