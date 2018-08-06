<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- localhost:8180/jsp/parameter.jsp?userId=브라운;password=1234 --%>
<%-- jsp 기본객체(암묵적객체, 묵시적객체, implict object)
	request, response
 --%>
<%
	//인자값 : 파라미터 이름
	//userId 파라미터에 대한 값
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	
	String[] userIds = request.getParameterValues("userId");
	
	
	Map<String, String[]> requestMap = request.getParameterMap();
	String[] mapUserIds = requestMap.get("userId");
	
	Enumeration enumeration = request.getParameterNames();
%>
	userId : <%=userId %> <br>
	password : <%=password %> <br>
	
	<h2>getParameterValues</h2>
	<%for(String id : userIds){ %>
		userId : <%=id %> <br>
	<%} %>
	
	<h2>getParameterMap</h2>
	<%for(String id : mapUserIds){ %>
		userId : <%=id %> <br>
	<%} %>
	
	<h3>getParameterNames</h3>
	<%while(enumeration.hasMoreElements()){
		String parameterName = (String)enumeration.nextElement();
	%>
		parameterName : <%=parameterName %><br>
	<%} %>
	
	
	
</body>
</html>