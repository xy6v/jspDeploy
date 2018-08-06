<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- localhost:8180/jsp/jstl/import.jsp --%>
<%-- <c:import url="/main.jsp" var="page"></c:import>
		${page }
--%>

<c:import url="https://search.naver.com/search.naver">
	<c:param name="query" value="html5"/>
</c:import>

</body>
</html>






