<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>

<form action="send1.jsp" method="post">
<%if(session.getAttribute("qhsorl")==null){ %>
	<b><H2>전송할 아이디와 내용을 입력하시오.</H2></b>
<%}else{%>
	<b><H2>!보내기에 성공!</H2></b>
<%} %>
	<p>
		받을사람(*)<br/>
		<input type="text" placeholder="receiver's id" style = "width :220px; padding: 5px;" name="receiver"/><br/>
	</p>
	<p>
		보낼내용(*)<br/>
		<textarea name="content"  style="height : 300px; width : 220px; adding : 5px; rexise:none; font-family : inherit;" placeholder="write a message"></textarea>	
	</p>
	<button type="submit">메세지전송</button>
	</form>
	
<%@ include file="/layout/bottom.jspf"%>
