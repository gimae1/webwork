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
<%@ page import="java.sql.*,java.util.ArrayList,com.hi.bean.BbsBean" %>

<%
ArrayList<BbsBean> list=new ArrayList<BbsBean>();
String sql="select num,sub,id,nalja from bbs06 order by num desc";
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:scott/tiger@localhost:1521:xe";
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
		while (rs.next()) {
			
			BbsBean bean=new BbsBean();
			bean.setNum(rs.getInt(1));
			bean.setId(rs.getString(2));
			bean.setSub(rs.getString(3));
			bean.setNalja(rs.getDate(4));
			list.add(bean);
		}
		
	}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();}


%>
	<h1>게시판목록</h1>
	<table border="1" align="center" width="600" cellspacing="0">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
		</tr>
		<%
/* 		for(int i=0; i<list.size(); i++){
			BbsBean bean=list.get(i); */
			for(BbsBean bean:list){
		%>
		<tr>
			<td align="center"><a href="detail.jsp?num=<%=bean.getNum() %>"><%=bean.getNum() %></a></td>
			<td align="center"><a href="detail.jsp?num=<%=bean.getNum() %>"><%=bean.getSub() %></a></td>
			<td align="center"><a href="detail.jsp?num=<%=bean.getNum() %>"><%=bean.getId() %></a></td>
			<td align="center"><a href="detail.jsp?num=<%=bean.getNum() %>"><%=bean.getNalja() %></a></td>
		</tr>
		<%
		}
		%>
		
	</table>
	<p>
		<a href="add.jsp">[입력]</a>
	</p>
<%@ include file="../template/footer.jspf" %>
</body>
</html>