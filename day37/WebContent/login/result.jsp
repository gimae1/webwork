<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ include file="../template/header.jspf" %>


	<jsp:useBean id="user" class="com.hi.bean.UserBean" scope="session"></jsp:useBean>
	<jsp:setProperty property="*" name="user"/>
<%
String sql="select name from user06 where id='"+user.getId()+"' and pw='"+user.getPw()+"'";
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String username="scott";
String password="tiger";
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url,username,password);
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	if(rs.next()){
		//로그인 성공
		String name=rs.getString("name");
		user.setName(name);
		user.setResult(true);
		out.println("<h1>로그인 성공</h1>");
	}else{
	//로그인 실패
	user.setResult(false);
	out.println("<h1>로그인 실패</h1>");
	}
	
}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();}
response.sendRedirect("/day37/");
%>

<%@ include file="../template/footer.jspf" %>

</body>
</html>