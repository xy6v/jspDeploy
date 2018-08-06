<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- localhost:8180/formatServlet --%>
<h3>number</h3>
<%--<fmt:setLocale value="de"/> --%>
<fmt:formatNumber value="${number }" type="number"/><br>
<fmt:formatNumber value="${number }" type="currency"/><br>
<fmt:formatNumber value="${number }" type="percent" /><br>

<h3>number parse</h3>
<fmt:parseNumber value="${numberStr }"/><br>

<h3>date</h3>
<fmt:formatDate value="${today }" dateStyle="full"/> <br>
<fmt:formatDate value="${today }" dateStyle="medium"/> <br>
<fmt:formatDate value="${today }" dateStyle="short"/> <br>
<fmt:formatDate value="${today }" pattern="yyyy/MM/dd"/> <br>

<h3>date parse</h3>
<%-- yyyy.mm.dd --> yyyy/mm/dd --%>
<fmt:parseDate value="${todayStr }" pattern="yyyy.MM.dd"/>

<h3>timeZone</h3>
<fmt:timeZone value="Canada/Atlantic" >
	<fmt:formatDate value="${today }" type="both" timeStyle="full"/><br>
</fmt:timeZone>

<fmt:setTimeZone value="Europe/Athens" var="timeZone"/>
<fmt:formatDate value="${today }" timeZone="${timeZone }" type="both" timeStyle="full"/>

<h3>fn length</h3>
fn:length ${fn:length(todayStr) }<br>

</body>
</html>








