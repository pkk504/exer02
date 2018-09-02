<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>RequestMethod</title>
</head>
<body>
<h2>요청방식</h2>
	<p>
		예전 프로토콜과는 다르게, 전달받고자하는 요청의 방식을 설정해줄수가 있다.
		기본적으로는 GET/POST 요청을 사용할수 있고,.
		그 외의 방식을 사용하기 위해서는 프로젝트 설정을 조금 다르게해서 사용해야 한다.(spring을 할때 배울거임)	
	</p>
	<p>
		일반적으로 사용자들이 주소창에 직접치거나,
		 a 태그를 이용해서 발생시킨 요청은 GET 이라는 방식으로 발생함.
	</p>
	<p>
	POST방식은 form으로 발생시키는 요청의 경우에 한해서만 현재로서는 가능하다.
	(※ form 에 의한 요청도 default는 GET으로 일어난다.)
	</p>
	<hr/>
	<a href = "02rst.jsp?data=web">요청..!</a>
	<form action="02rst.jsp">
		<input type ="radio" name="data" value="db"/> 데이터베이스
		<input type ="radio" name="data" value="java"/> 자바
		<input type ="radio" name="data" value="jsp"/> JSP
		<button type = "submit">요청</button>
	</form>
	
	
	<form action="02rst.jsp" method ="post">
		<input type ="radio" name="data" value="chopper"/> 쵸파
		<input type ="radio" name="data" value="sanji"/> 상디
		<input type ="radio" name="data" value="franky"/> 프랑키
		<button type = "submit">요청</button>
	</form>
	<hr/>
	
	<p>
		POST와 GET 요청의 차이는,
		브라우저에서 서버측으로 요청을 보낼때, 
		전달인자들을 출력스트림을 이용해서 보내냐(POST), 아니냐(GET)의 차이다.
		(몸통requestBody가 있는 요청인가 아닌가.)
	</p>
	<p>
		GET은 전송시키고자하는 문자열에 크기제약이 있다.
		 POST방식은 요청크기에 제약이없다.
		 form을 이용해서 전달바아야되는 데이터가 많다면,POST로 구축을 하고(대이터등록같으ㅡ요청
		보통 검색과 가

	</p>
	
</body>
</html>