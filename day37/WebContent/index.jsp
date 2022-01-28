<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./template/header.jspf" %>

		<jsp:getProperty property="name" name="user"/><br>
		<img alt="" src="https://dummyimage.com/600x400/aaa/fff.png" >
<%@ include file="./template/footer.jspf" %>
</body>
</html>