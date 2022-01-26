<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!//선언부 -필드 메서드 생성자 외부클래스 등이 올수 있다. 
 class Bean{
	int num;
	String sub,name;
	java.sql.Date nalja;
}
%>
<%//db작업
String param1=request.getParameter("page");
if(param1==null)param1="1";
int p=Integer.parseInt(param1);
//1p->01 -> 1+10*0 -> 1+10*(1-1)
//2p->11 -> 1+10*1 -> 1+10*(2-1)
//3p->21 -> 1+10*2 -> 1+10*(3-1)
//4p->31
int row=10;
int pstart=1+row*(p-1);
int pend=pstart+(row-1);
int tot=0;
String sql="select * from (select rownum as rn,num,sub,name,nalja, (select count(*) from bbs04) from "+
"(select * from bbs04 order by num desc))where rn between "+pstart+"and "+pend;
 ArrayList<Bean> list=new ArrayList<Bean>();
String url="jdbc:oracle:thin:scott/tiger@localhost:1521:xe";
String user="scott";
String password="tiger";
String driver="oracle.jdbc.driver.OracleDriver";
Class.forName(driver);
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
try{
	
conn=DriverManager.getConnection(url, user,password);
stmt=conn.createStatement();
rs=stmt.executeQuery(sql);
	
	while(rs.next()){
		Bean bean=new Bean();
		bean.num=rs.getInt(2);
		bean.sub=rs.getString(3);
		bean.name=rs.getString(4);
		bean.nalja=rs.getDate(5);
		tot=rs.getInt(6);
		list.add(bean);
	}
	
}finally{
	if(rs!=null)rs.close();if(stmt!=null)stmt.close();if(conn!=null)conn.close();
}


%>
	<h1>게시판</h1>
	<table border="1" width="80%" align="center">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
		<%
		for(int i=0; i<list.size();i++){
			Bean bean=list.get(i);
		
		%>
		<tr>
			<td><%=bean.num %></td>
			<td><%=bean.sub %></td>
			<td><%=bean.name %></td>
			<td><%=bean.nalja %></td>
		</tr>
		<%
		}
		%>
	</table>
	<p align="center">
	<%
	
	
	
	
	
	for(int i=1; i<=(tot-1)/row+1; i++){
	%>
	<a href="index.jsp?page=<%=i%>">[<%=i%>]</a>
	
	<%
	}
	%>
	</p>
	
	
</body>
</html>