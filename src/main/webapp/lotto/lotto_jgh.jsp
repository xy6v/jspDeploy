<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null; //쿼리문이  'select'일 경우 필요
		
		String name = "";
		int id = 0;

		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "pc00";
		String pass = "java";

		conn = DriverManager.getConnection(url, user, pass);
		stmt = conn.createStatement();

		String sql = "select * from STUDENT where ID =	(select round(dbms_random.value(1,25),0) from dual)";
		rs = stmt.executeQuery(sql);
		
		
		
		%>
		<%while(rs.next()){ %>
			
			<%name = rs.getString("name");%>
			<%id=rs.getInt("ID"); %>
		
<!-- 		<tr> -->
			
<%-- 			<% out.write(rs.getInt("ID")+"<tr>");%> --%>
<%-- 			<% out.write("번");%> --%>
<%-- 			<% out.write("이름 :");%> --%>
<%-- 			<% out.write(rs.getString("NAME"));%> --%>
<%-- 			<% out.write(rs.getInt("CALL_CNT")+"<tr>");%><br> --%>
<!-- 		</tr> -->
		
		
		
	<% }%>

	<canvas id="student" width="200" height="200" style="border:10px solid #0040FF"></canvas>
	
	<canvas id="student2" width="200" height="200" style="border:10px solid #01DFA5"></canvas>
	
</body>
<script>
	var canvas = document.getElementById("student");
	var context = canvas.getContext("2d");
	
	context.beginPath();
	context.arc(100, 100, 100, 0, 2*Math.PI);
	context.lineWidth = 30;
	context.strokeStyle = '#0040FF';
	context.stroke();
	
	var grd = context.createLinearGradient(0, 0, canvas.width, canvas.height);
	grd.addColorStop(0, '#0040FF')
	context.fillStyle = grd;
	context.font="40px arial";
	context.fillText("<%=name%>", 43, 115);
	
	////////////////////////////////////////////////////////////////////////////////
	var canvas = document.getElementById("student2");
	var context2 = canvas.getContext("2d");
	
	context2.beginPath();
	context2.arc(100, 100, 100, 0, 2*Math.PI);
	context2.lineWidth = 30;
	context2.strokeStyle = '#01DFA5';
	context2.stroke();
	
	var grd = context2.createLinearGradient(0, 0, canvas.width, canvas.height);
	grd.addColorStop(0, '#01DFA5')
	context2.fillStyle = grd;
	context2.font="40px arial";
	context2.fillText("<%=id%>", 80, 115);
	
</script>

</html>