<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, oracle.jdbc.driver.OracleDriver"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="0; url=list.jsp">
<title>Insert title here</title>
</head>
<body>
<%
String num=request.getParameter("num");
String sql="delete from bbs01 where num="+num;

String url="jdbc:oracle:thin:scott/tiger@localhost:1521:xe";
Connection conn=null;
Statement stmt=null;
try{
	
	DriverManager.registerDriver(new OracleDriver());
	conn=DriverManager.getConnection(url);
	stmt=conn.createStatement();
	stmt.executeUpdate(sql);
	
	
}catch(SQLException e){
	
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}

%>
</body>
</html>