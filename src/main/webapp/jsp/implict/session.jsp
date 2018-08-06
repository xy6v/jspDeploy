<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	sumResult : <%=request.getAttribute("sumResult") %> <br>
	
	<%
		HttpSession sess = request.getSession();
	%>
	
	기본객체 session sumReulst : <%=session.getAttribute("sumResult") %><br>
	request 객체 session sumReulst : <%=sess.getAttribute("sumResult") %><br>
	
	localhost:8180/jsp/implict/session.jsp
</body>
</html>