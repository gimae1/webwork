<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="0"  width="800" align="center">
	<tr>
		<td colspan="5">
			<img alt="logo" src="../imgs/logo.png">
			</td>
	</tr>
	<tr>
		<td background="../imgs/bg.png"></td>
		<td background="../imgs/bg.png" align="center" width="100"><a href="../index.jsp">[HOME]</td>
		<td background="../imgs/bg.png" align="center" width="100"><a href="./list.jsp">[B B S]</td>
		<td background="../imgs/bg.png" align="center" width="100"><a href="../login/form.jsp">[LOGIN]</td><!-- 한 디렉토리 올라간 후에 다른 폴더 찾아야 함으로  -->
		<td background="../imgs/bg.png"></td>
	</tr>
	<tr>
		<td colspan="5" align="center">
		<%@ page import="java.sql.*" %>
		<%
		
		
		String param=request.getParameter("num");
		int num=Integer.parseInt(param);
		Date nalja=null;
		String sub=null;
		String content=null;
		String id=null;
		int cnt=0;
		
		String sql="select num,nalja,sub,content,id,cnt from bbs03 where num="+num;
		String url="jdbc:oracle:thin:scott/tiger@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(url, user, password);
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()){
				num=rs.getInt(1);
				nalja=rs.getDate(2);
				sub=rs.getString(3);
				content=rs.getString(4);
				id=rs.getString(5);
				cnt=rs.getInt(6);
			}
		}finally{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
			}
		
		%>
			<h1>게시글 (<%=num %>번 글)</h1>
			<table border="1" width="80%" cellspacing="0">
				<tr>
					<td width="100">글 번호</td>
					<td><%=num %></td>
					<td>날짜</td>
					<td><%=nalja %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=id %></td>
					<td>조회수</td>
					<td><%=cnt %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><%=sub %></td>
					
				</tr>
				<tr>
				
					<td colspan="4" align="center"><%=content %></td>
					
				</tr>
				<tr>
				
					<td colspan="4">
						<a href="edit.jsp?num=<%=num%>">[수 정]</a>
						<a href="delete.jsp?num=<%=num%>">[삭 제]</a>
					</td>
					
				</tr>
				</table>
				
		</td>
	</tr>
	<tr>
		<td colspan="5">
			<img alt="footer" src="../imgs/footer.png">
		</td>
	</tr>


</table>
</body>
</html>