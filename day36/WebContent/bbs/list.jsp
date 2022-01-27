<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.ArrayList,com.hi.bean.bbsBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../template/header.jspf" %>

<%
	String key=request.getParameter("key"); 
	String word=request.getParameter("word");
	if(key==null)key="sub";
	if(word==null)word="";
	ArrayList<bbsBean> list=new ArrayList<bbsBean>();
	String sql="select num,sub,id,dep from bbs05 where "+key+" like '%"+word+"%' order by grp desc,ord asc";
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:scott/tiger@localhost:1521:xe";
	String user="scott";
	String password="tiger";
	 
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,user,password);
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		while(rs.next()){
			bbsBean bean=new bbsBean();
			bean.num=rs.getInt(1);
			bean.sub=rs.getString(2);
			bean.id=rs.getString(3);
			bean.cnt=rs.getInt(4);
			list.add(bean);
		}
		
	}finally{if(rs!=null)rs.close();if(stmt!=null)stmt.close();if(conn!=null)conn.close();}
	
	
%>
<h1>게시판 목록</h1>
	<table border="1" cellspacing="0" width="600">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>띄어쓰기</th>
		</tr>
		
		<%
		for(int i=0; i<list.size(); i++){
			bbsBean bean=list.get(i);
		
		%>
		<tr height="30">
			<td><a href="detail.jsp?num=<%=bean.num %>"><%=bean.num %> </a></td>
			<td><a href="detail.jsp?num=<%=bean.num %>"><%
			for(int j=0; j<bean.cnt; j++){
				out.print("&nbsp;&nbsp;&nbsp;");
			}
			if(bean.cnt!=0)out.print("└");
			out.print(bean.sub); %> </a></td>
			<td><a href="detail.jsp?num=<%=bean.num %>"><%=bean.id %> </a></td>
			<td><a href="detail.jsp?num=<%=bean.num %>"><%=bean.cnt %> </a></td>
		</tr>
		<%
		}
		
		%>
	</table>
	<br>
	<form action="list.jsp">
	<select name="key">
		<option value="sub">제목</option>
		<option value="id">글쓴이</option>
		</select>
	<input type="text" name="word">
	<input type="submit" value="검색">
	</form>
	<br>
	<p align="center"><a href="add.jsp"><img src="https://dummyimage.com/50x25/aaa/fff.png&text=add"></a></p>
	<br>
	<br>
	

<%@ include file="../template/footer.jspf" %>
</body>
</html>