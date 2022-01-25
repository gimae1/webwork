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
			<h1>게시판 입력</h1>
			<form action="insert.jsp" method="post">
			<table>
				
				<tr>
					<td bgcolor="#dddddd">제목</td>
					<td><input type="text" name="sub"></td>
				</tr>
				
				<tr>
					<td bgcolor="#dddddd">글쓴이</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<textarea rows="6" cols="20" name="content"></textarea>
						</td>
				</tr>
				<tr>
					<td colspan="2" align="center">	
					<input type="submit" value="입 력">
					<input type="reset" value="취소">
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