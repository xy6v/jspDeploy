<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- localhost:8180/jsp/jstl/out.jsp  --%>
<%
	FileReader reader = new FileReader(application.getRealPath("/main.jsp"));
	pageContext.setAttribute("reader", reader);
%>	

<c:out value="${reader}"/>
 
</body>
</html>