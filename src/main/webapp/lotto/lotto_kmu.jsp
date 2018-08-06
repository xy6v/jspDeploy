<%@page import="java.sql.SQLException"%>
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
<style>
td {
	border: 1px solid pink;
	text-align: center;
}

#student {
	background-color: skyblue;
}

context {
	background-color: pink;
}

#student2 {
	background-color: lime;
}


</style>
<title>Insert title here</title>
</head>
<body>
	<!-- oracle db의 student 테이블을 조회하여 화면에 출력 -->
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null; // 쿼리문이 'select'일 경우 필요

		String name = "";
		String id2 = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "pc00";
			String pass = "java";
			conn = DriverManager.getConnection(url, id, pass);

			stmt = conn.createStatement();

			String sql = "select id, name, call_cnt from student where id"
					+ " =("
					+ "select round(dbms_random.value(1, (select count(*) from student)),0) from dual)";
			rs = stmt.executeQuery(sql);
			out.write("<table><tr><td>번호</td><td>이름</td><td>횟수</td></tr>");
			rs.next();
			name = rs.getString("name");
			id2 = rs.getString("id");			

			// 			out.write("<tr><td>" + rs.getInt("ID") + "</td>"
			// 					+ "<td>" + rs.getString("NAME") + "</td>"
			// 					+ "<td>" + rs.getString("call_cnt") + "</td></tr>");

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e2) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e2) {
				}
		}
		out.write("</table><br>");
	%>
	<canvas id="student" width="200" height="200" style="border: 1px solid #000000"></canvas>	
	
	<canvas id="student2" width="200" height="200" style="border: 1px solid #000000"></canvas>
</body>
<script>

	var canvas = document.getElementById("student");
	var context = canvas.getContext("2d");
	context.beginPath();
	context.arc(100, 100, 100, 0, 2 * Math.PI);
	context.stroke();

	context.font = "60px arial";
	context.fillText("<%=name%>", 10, 120);
	
	////////////////////////////////////////////////////////////
	
	var canvas = document.getElementById("student2");
	var context2 = canvas.getContext("2d");

	var grd = context2.createRadialGradient(75, 50, 5, 90, 60, 100);
	grd.addColorStop(0, "red");
	grd.addColorStop(1, "white");

	context2.fillStyle = grd;
	
	context2.font = "60px arial";
	context2.fillText("<%=id2%>", 10, 120);
	
</script>
</html>