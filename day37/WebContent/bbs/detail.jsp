<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../template/header.jspf" %>
<%@ page import="java.sql.*" %>

<jsp:useBean id="bean" class="com.hi.bean.BbsBean"></jsp:useBean>
<jsp:setProperty property="num" name="bean"/>
<%
	String sql="select * from bbs06 where num="+bean.getNum();
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
			bean.setSub(rs.getString("sub"));
			bean.setId(rs.getString("id"));
			bean.setContent(rs.getString("content"));
			bean.setNalja(rs.getDate("nalja"));
		}
		
		
	}finally{if(rs!=null)rs.close();if(stmt!=null)stmt.close();if(conn!=null)conn.close();}
	
	
%>
<h1>상세페이지</h1>

<form action="edit.jsp">
<input type="hidden" name="num" value="<%=bean.getNum()%>">
	<table border="1" cellspacing="0" width="600" align="center">
		<tr>
			<td colspan="4">
			<jsp:getProperty property="num" name="bean"/>
			</td>
		</tr>
		<tr>
			<td width="100">글쓴이</td>
			<td>
				<jsp:getProperty property="id" name="bean"/>
			</td>
			<td width="100">날짜</td>
			<td>
			
				<jsp:getProperty property="nalja" name="bean"/></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">
				<jsp:getProperty property="sub" name="bean"/></td>
		</tr>
		<tr>
			<td colspan="4">
				<jsp:getProperty property="content" name="bean"/>
				</td>
		</tr>
		<tr>
			<td colspan="4">
			<form action="edit.jsp">
			<input type="hidden" name="num" value="<%=bean.getNum()%>">
			 <input type="submit" value="수 정"></form>
			 <form action="delete.jsp" method="post">
			 <input type="hidden" name="num" value="<%=bean.getNum()%>">
			 <input type="submit" value="삭제">
			 </form>
			</td>
		</tr>
	</table>
</form>

<%@ include file="../template/footer.jspf" %>
</body>
</html>