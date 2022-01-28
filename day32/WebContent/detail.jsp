<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,oracle.jdbc.driver.OracleDriver"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align="center">
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
		<h1> 상세페이지</h1>
		<% 
		String num=request.getParameter("num");
		String nalja=null;
		String sub=null;
		String content=null;
		String sql="select num,sub,nalja,content from bbs01 where num="+num;
		String url="jdbc:oracle:thin:scott/tiger@localhost:1521:xe";
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try{
			DriverManager.registerDriver(new OracleDriver());
			conn=DriverManager.getConnection(url);
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()){
			num=rs.getString(1);
			sub=rs.getString(2);
			nalja=rs.getString(3);
			content=rs.getString(4);
			}
		}catch(SQLException ex){
		
		}finally{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
		%>
		<table border="1" align="center" width="80%">
			<tr>
				<td width="100">글번호</td>
				<td><%=num %></td><!--표현식 이라고 함 out.print(num); 과 같다 ; 이 들어가면 오류  -->
				<td width="100">날짜</td>
				<td><%=nalja %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"><%=sub %></td>
			</tr>
			<tr>
				<td colspan="4"><%=content %></td>
				
			</tr>
			<tr>
				<td colspan="4">
					<a href="edit.jsp?num=<%=num %>">수정</a>
					<a href="delete.jsp?num=<%=num %>">삭제</a>
				</td>
			</tr>
		
		
		
		</table>
		
		
		
		<!-- content end  -->
		</td>
		</tr>	
		<tr> 
		<td colspan="6"><img src="imgs/img08.png"></td>
		</tr>	
	</table>
</body>
</html>