<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>before</h1>
	<%
	java.io.OutputStream os=response.getOutputStream();
	os.write("hello".getBytes());
	os.flush();
	os.close();
	
	%>
	<h2>after</h2>
</body>
</html>