<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>RequestMethod</title>
</head>
<body>
<h2>��û���</h2>
	<p>
		���� �������ݰ��� �ٸ���, ���޹ް����ϴ� ��û�� ����� �������ټ��� �ִ�.
		�⺻�����δ� GET/POST ��û�� ����Ҽ� �ְ�,.
		�� ���� ����� ����ϱ� ���ؼ��� ������Ʈ ������ ���� �ٸ����ؼ� ����ؾ� �Ѵ�.(spring�� �Ҷ� ������)	
	</p>
	<p>
		�Ϲ������� ����ڵ��� �ּ�â�� ����ġ�ų�,
		 a �±׸� �̿��ؼ� �߻���Ų ��û�� GET �̶�� ������� �߻���.
	</p>
	<p>
	POST����� form���� �߻���Ű�� ��û�� ��쿡 ���ؼ��� ����μ��� �����ϴ�.
	(�� form �� ���� ��û�� default�� GET���� �Ͼ��.)
	</p>
	<hr/>
	<a href = "02rst.jsp?data=web">��û..!</a>
	<form action="02rst.jsp">
		<input type ="radio" name="data" value="db"/> �����ͺ��̽�
		<input type ="radio" name="data" value="java"/> �ڹ�
		<input type ="radio" name="data" value="jsp"/> JSP
		<button type = "submit">��û</button>
	</form>
	
	
	<form action="02rst.jsp" method ="post">
		<input type ="radio" name="data" value="chopper"/> ����
		<input type ="radio" name="data" value="sanji"/> ���
		<input type ="radio" name="data" value="franky"/> ����Ű
		<button type = "submit">��û</button>
	</form>
	<hr/>
	
	<p>
		POST�� GET ��û�� ���̴�,
		���������� ���������� ��û�� ������, 
		�������ڵ��� ��½�Ʈ���� �̿��ؼ� ������(POST), �ƴϳ�(GET)�� ���̴�.
		(����requestBody�� �ִ� ��û�ΰ� �ƴѰ�.)
	</p>
	<p>
		GET�� ���۽�Ű�����ϴ� ���ڿ��� ũ�������� �ִ�.
		 POST����� ��ûũ�⿡ �����̾���.
		 form�� �̿��ؼ� ���޹پƾߵǴ� �����Ͱ� ���ٸ�,POST�� ������ �ϰ�(�����͵�ϰ����ѿ�û
		���� �˻��� ��

	</p>
	
</body>
</html>