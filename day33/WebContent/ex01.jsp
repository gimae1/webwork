<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.lang.*" %>
<!--자바에서 패키지와 ㅇimport 명세하는 곳이라고 볼 수 있다  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	
<h1>내용</h1>
		<%!
			 int su=1234;
			//선언부--클래스 안이면서 main 바깥 이라고 할 수 있다. 
			 void func(){
				System.out.println("호출");
		}
		%>
		<%
			request.getParameter("id");
			func();
			//스크립트릿--main method 라고 볼 수 있다. 
		%>



</body>
</html>