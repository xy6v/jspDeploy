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
	//localhost:8180/jsp/implict/pageContext.jsp
	//request, response, session, out, application
	//config
	//pageContext : 다른 객체에 대한 전반적인 정보를 갖고 있습니다.
	
	pageContext.getRequest();		//reqeust 기본객체와 비교

	// application --> 
	pageContext.getServletContext();	//applcation
	pageContext.getSession();			//session
	pageContext.getOut();				//out
%>
	<!-- html -->
	request.equals(pageContext.getRequest()) : 
		<%=request.equals(pageContext.getRequest()) %> <br>
		
	application.equals(pageContext.getServletContext()) :
		<%=application.equals(pageContext.getServletContext()) %> <br>
		
	session.equals(pageContext.getSession()) :
		<%=session.equals(pageContext.getSession()) %> <br>
	
	out.equals(pageContext.getOut()) :
		<%=out.equals(pageContext.getOut()) %><br>
		

	

</body>
</html>



