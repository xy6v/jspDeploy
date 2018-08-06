<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setHeader("Content-Disposition","attachment; filename=excel.xls");
	response.setHeader("Content-Description","JSP Generated Data");
	response.setContentType("application/vnd.ms-excel");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>userId</td>			
			<td>password</td>
		</tr>
		
		<tr>
			<td>brown</td>			
			<td>1234</td>
		</tr>
		<tr>
			<td>sally</td>			
			<td>4321</td>
		</tr>
	</table>
</body>
</html>