<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String param1=request.getParameter("num");
	String param2=request.getParameter("sub");
	String param3=request.getParameter("content");
	int num=Integer.parseInt(param1);
	String sub=param2.trim();
	String content=param3;
	
	String sql="update bbs03 set sub='"+sub+"',content='"+content+"' where num="+num;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:scott/tiger@localhost:1521:xe";
	String user="scott";
	String password="tiger";
	
	Connection conn=null;
	Statement stmt=null;
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
		
	}finally{if(stmt!=null)stmt.close();if(conn!=null)conn.close();}
	
	response.sendRedirect("detail.jsp?num="+num);
	
	
	%>
</body>
</html>