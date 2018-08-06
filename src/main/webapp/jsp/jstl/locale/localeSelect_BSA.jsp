<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/localeSelect" method="get">
		<select name="local">
			<option value="ko"<c:if test="${local=='ko'}">selected</c:if>>한국어</option>
			<option value="ja"<c:if test="${local=='ja'}">selected</c:if>>日本語</option>
			<option value="en"<c:if test="${local=='en'}">selected</c:if>>English</option>
		</select>
		<%-- <c:choose>
			<c:when test="${local=='ko'}"><fmt:setLocale value="ko"/></c:when>
			<c:when test="${local=='ja'}"><fmt:setLocale value="ja"/></c:when>
			<c:when test="${local=='en'}"><fmt:setLocale value="en"/></c:when>
		</c:choose>--%>
		<fmt:setLocale value="${local}"/>
		<c:set var="userId" value="brown" />
		<fmt:bundle basename="kr.or.ddit.msg.msg">
			<fmt:message key="hello" />
			<br>
			<fmt:message key="visitor">
				<fmt:param value="${userId}"></fmt:param>
			</fmt:message>
		</fmt:bundle>
		<button type="submit" >전송</button>
	</form>
</body>
</html>