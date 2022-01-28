<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,oracle.jdbc.driver.OracleDriver"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="2; url=http://localhost:8080/day32/list.jsp">
<title>Insert title here</title>
</head>
<body>
	<table align="center" width="1130px">
		<tr> 
		<td colspan="6"><img src="imgs/img01.png"></td>

		</tr>	
		<tr> 
		<td><img src="imgs/img02.png"></td>
		<td align="center" width="184px" background="imgs/img03.png"><a href="index.jsp">[HOMEE]</a></td>
		<td align="center" width="184px" background="imgs/img04.png"><a href="intro.jsp">[INTRO]</a></td>
		<td align="center" width="184px" background="imgs/img05.png"><a href="list.jsp">[B B S]</a></td>
		<td align="center" width="184px" background="imgs/img06.png"><a href="guest.jsp">[GUEST]</a></td>
		<td><img src="imgs/img02.png"></td>
		</tr>	
		<tr> 
		<td colspan="6">
		<!-- content start  -->
		<%
		String url="jdbc:oracle:thin:scott/tiger@localhost:1521:xe";
		String sub=request.getParameter("sub");
		
		String content=request.getParameter("content");
		String sql="select max(num)+1 from bbs01";
	
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		try{
		DriverManager.registerDriver(new OracleDriver());
		conn=DriverManager.getConnection(url);
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		rs.next();
		int nextval=rs.getInt(1);
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
		String sql2="insert into bbs01 values ("+nextval+", '"+sub+"',sysdate,'"+content+"')";
		conn=DriverManager.getConnection(url);
		stmt=conn.createStatement();
		int result=stmt.executeUpdate(sql2);
		if(result>0)out.println("<h1>입력성공</h1>");
		else out.println("<h1>입력실패</h1>");
		}finally{
		
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
		
		
		%>
		
		<!-- content end  -->
		</td>
		</tr>	
		<tr> 
		<td colspan="6"><img src="imgs/img08.png"></td>
		</tr>	
	</table>
</body>
</html>