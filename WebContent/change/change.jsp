<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%session.removeAttribute("iddd");	 %>

<%@ include file="/layout/top.jspf"%>
<H2>비밀번호 변경을 위해 ID 와 PASSWORD 를 입력해주세요.</H2>
<form action="change12.jsp">
	ID :  <input type="text" placeholder="id" style = "width :220px; padding: 5px;" name="id"/><br/><br/>
	PASSWORD :	<input type="text" placeholder="password" style = "width :220px; padding: 5px;" name="pass"/><br/><br/>
		<button type="submit" style="text-aligb: center;font-size: 15pt">CHECK</button>
		
	</form>
	<br/>
	<br/>
	

</body>
</html>