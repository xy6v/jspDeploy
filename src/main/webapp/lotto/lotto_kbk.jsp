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
	<!-- oracle db의 student 테이블을 조회하여 화면에 출력 -->
	<%
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "pc00";
		String pass = "java";
		Connection conn;
		Statement stmt;
		ResultSet rs;

		String name = "";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		stmt = conn.createStatement();
		rs = stmt
				.executeQuery("select * from student where id=round(dbms_random.value(1,(select count(*) from student)),0)");
		out.println("<table border=\"1\">");
		// 		while (rs.next()) {
		// 			out.println("<tr>");
		// 			out.println("<td>" + rs.getInt("ID") + "</td>");
		// 			out.println("<td>" + rs.getString("NAME") + "</td>");
		// 			out.println("<td>" + rs.getInt("CALL_CNT") + "</td>");
		// 			out.println("</tr>");
		rs.next();
		name = rs.getString("NAME");
		// 		}
		out.println("</table>");
		conn.close();
	%>
	<canvas id="student" width="200" height="200" style="border: 1px solid #4257b2;"></canvas>
	<canvas id="student2" width="200" height="200" style="border: 1px solid #4257b2;"></canvas>

	<img id="image" src="/images/예리.jpg" style="visibility:hidden" width="200" height="200">
	<script>
		var canvas = document.getElementById("student");
		var context = canvas.getContext("2d");
		context.beginPath();
		context.arc(100, 100, 100, 0, 2 * Math.PI);
		context.stroke();

		context.font = "50px Arial";
		context.strokeText("<%=name%>", 30, 110);
		
		var canvas2 = document.getElementById("student2");
		var context2 = canvas2.getContext("2d");
	 	var img = document.getElementById("image");
		context2.drawImage(image,0,0);

		var grd = context2.createRadialGradient(75, 50, 5, 90, 60, 100);
		grd.addColorStop(0, "red");
		grd.addColorStop(1, "white");
		
		context2.fillStyle = grd;
		
		context2.font = "50px Arial";
		context2.fillText("<%=name%>", 30, 110);
	</script>
</body>
</html>