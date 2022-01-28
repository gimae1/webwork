<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="bean" class="com.hi.bean.BbsBean"></jsp:useBean><!-- 태그처럼 보이지만 자바코드 -->
	<jsp:setProperty property="sub" name="bean"/><!-- 원래는 String sub=request.getParameter("sub") -->
	<jsp:setProperty property="id" name="bean"/>
	<jsp:setProperty property="content" name="bean"/>
	<%@ page import="java.sql.*" %>
	<%
	String sql="insert into bbs06 values(bbs06_seq.nextval,'"+bean.getId()+"',sysdate,'"+bean.getSub()+"','"+bean.getContent()+"')";
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String username="scott";
	String password="tiger";
	
	Connection conn=null;
	Statement stmt=null;
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, username,password);
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
	}finally{if(stmt!=null)stmt.close();if(conn!=null)conn.close();}
	response.sendRedirect("./");
	%>
</body>
</html>