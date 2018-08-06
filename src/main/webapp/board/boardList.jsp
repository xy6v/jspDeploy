<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.model.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	
	th, td {
		border : 1px solid blue ;
	}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>사용자 아이디</th>
				<th>별명</th>
				<th>등록일(yyyy-MM-dd)</th>
			</tr>
		</thead>
		<tbody>
		
		<%	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			for(BoardVo boardVo : (List<BoardVo>)request.getAttribute("boardList")){%>
			<tr>
				<td><%=boardVo.getTitle() %></td>
				<td><%=boardVo.getUserId() %></td>
				<td><%=boardVo.getAlias() %></td>
				<td><%=sdf.format(boardVo.getRegDt()) %></td>
			</tr>
		<%} %>
			
		</tbody>
	</table>
</body>
</html>






