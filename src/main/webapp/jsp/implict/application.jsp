<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//request, response, session, out
		//application : 서버 전반적인 정보 (page, request, session, application)
		application.getRealPath("/jsp/implict/application.jsp");
	
		application.getInitParameter("ADMIN_USER");
		
	%>
	
	<h3>application</h3>
	application.getContextPath() : <%=application.getContextPath() %><br>
	application.getServletContextName() : <%=application.getServletContextName() %><br>
	application.getMajorVersion() : <%= application.getMajorVersion() %><br>
	application.getMinorVersion() : <%= application.getMinorVersion() %><br>
	application.getRealPath("/jsp/implict/application.jsp") : <%=application.getRealPath("/jsp/implict/application.jsp")%><br>
	application.getInitParameter("ADMIN_USER") : <%=application.getInitParameter("ADMIN_USER") %><br>	
</body>
</html>









