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
<%
	String path="add.jsp";
String method=request.getMethod();
	request.setCharacterEncoding("utf-8");
	String sub=request.getParameter("sub");
	String id=request.getParameter("id");
	String content=request.getParameter("content");
	if(method.equals("POST")&&sub!=null&&id!=null&&!sub.isEmpty()&&!id.isEmpty()){
		String sql="insert into bbs05(num,sub,id,content,grp) values (bbs05_seq.nextval,'"+sub+"','"+id+"','"+content+"',bbs05_seq.currval)";
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:scott/tiger@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		
		
		Connection conn=null;
		Statement stmt=null;
		
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url,user,password);
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
			path="list.jsp";
		}finally{if(stmt!=null)stmt.close();if(conn!=null)conn.close();}
			}else{
				if(sub==null)sub="";
				if(id==null)id="";
				path +="?sub="+sub+"&id="+id;
	}

	response.sendRedirect(path);
	
%>

</body>
</html>