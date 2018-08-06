<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- localhost:8180/jsp/jstl/redirect.jsp --%>

<c:redirect url="/main.jsp">
	<c:param name="redirectFrom" value="redirect.jsp"/>
</c:redirect>