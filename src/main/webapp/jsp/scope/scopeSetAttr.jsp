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
		//값을 각 영영에 설정 (page, request, session, application)
		pageContext.setAttribute("pageScope", request.getParameter("pageScope"));
		request.setAttribute("requestScope", request.getParameter("requestScope"));
		session.setAttribute("sessionScope", request.getParameter("sessionScope"));
		application.setAttribute("applicationScope", request.getParameter("applicationScope"));
		
		//각 영역의 속성을 출력해줄 결과 화면으로 위임(dispatch forward)
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/scope/scopeResult.jsp");
		rd.forward(request, response);
	%> 

</body>
</html>








