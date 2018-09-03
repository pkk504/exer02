<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>

<form action="send1.jsp" method="post">
	<p>
		받을사람(*)<br/>
		<input name = "receiver" type="text" placeholder="receiver's id" style="width: 220px; margin: 5px;"/>
	</p>
	<p>
		보낼내용(*)<br/>
		<textarea name="content" style="height: 300px; width: 220px; margin: 5px; resize: none;"></textarea>	
	</p>
	<button type="submit">메세지전송</button>
	</form>
	
<%@ include file="/layout/bottom.jspf"%>
