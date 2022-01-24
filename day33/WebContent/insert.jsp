<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="0; url=index.jsp">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
		String url="jdbc:oracle:thin:scott/tiger@localhost:1521:xe";
		String sub=request.getParameter("sub");
		String content=request.getParameter("content");	
		String sql="insert into bbs02 values (bbs02_seq.nextval,'"+sub+"','"+content+"',sysdate)";
		
		Connection conn=null;
		Statement stmt=null;
		
		try{
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			conn=DriverManager.getConnection(url);	
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
		}finally{
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
	
	
	%>
</body>
</html>