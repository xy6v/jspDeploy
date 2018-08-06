<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	td {
		border : 1px solid blue ;
	}
</style>
</head>
<body>

<%
	//기본객체 : request, response, session
	//out 객체 : servlet의 printWriter와 유사한 객체
	//localhost:8180/jsp/implict/out.jsp
	out.write("sumResult : " + session.getAttribute("sumResult"));
	out.write("<br>");
%>


<% 
	out.write("<table>");
	for(int i = 1; i <= 9; i++){
		out.write("<tr>");
		for(int j = 2; j <= 9; j++)
			out.write("<td>" + j + "*" + i + "=" + i*j +"</td>");
		out.write("</tr>");
	}
	out.write("</table>");
%> 
	
</body>
</html>





