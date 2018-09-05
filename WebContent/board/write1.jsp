<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>

	<form action="write2.jsp" method="post" enctype="multipart/form-data">
	<p>
		<b>제목(*)</b><br/><br/>
		<input type="text" placeholder="title" style = "width :220px; padding: 5px;" name="title"/><br/>
	</p>
	<!-- <p>
		<b>글쓴이(*)</b><br/><br/>
		<input type="text" placeholder="writer" style = "width :220px; padding: 5px;" name="writer"/><br/>
	</p> -->
	<p>
		<b>내용(*)</b><br/><br/>
		<textarea name="content"  style="height : 300px; width : 400px; adding : 5px; rexise:none; font-family : inherit;" placeholder="content(s)"></textarea>	
	</p>
	
	
		 <br/>
		 <input type="file"" name="attach"/>
	
		<button type="submit">등록</button>
	</form>

</body>
</html>