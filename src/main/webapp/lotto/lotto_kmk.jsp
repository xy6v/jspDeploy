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
<title>Insert title here</title>
</head>
<body>

	<!-- oracle db의 student 테이블을 조회하여 화면에 출력 -->
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String name = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "pc00";
			String pass = "java";
			conn = DriverManager.getConnection(url, user, pass);

			stmt = conn.createStatement();

			String sql = "select * from student where id = (select round(dbms_random.value(1, (select count(*) from student)), 0) from dual)";
			rs = stmt.executeQuery(sql);

			out.write("결과 출력해보자!" + "<br>" + "<br>");

// 				out.write("ID : " + rs.getInt("ID") + "	/	");
// 				out.write("NAME : " + rs.getString("NAME") + "	/	");
// 				out.write("CALL_CNT : " + rs.getInt("CALL_CNT") + "<br>");
			rs.next();
			name = rs.getString("name");

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
	%>

	<canvas id="student" width="200" height="200"
		style="border: 1px solid #000000"></canvas>

	<canvas id="student2" width="200" height="200"
		style="border: 1px solid #d3d3d3"></canvas>

</body>

<script>
	var canvas = document.getElementById("student");
	var context = canvas.getContext("2d");
	context.beginPath();
	context.arc(100, 100, 100, 0, 2 * Math.PI);
	context.stroke();

	context.font = "60px arial";
	context.fillText("<%=name%>", 10, 115);
	
	///////////////////////////////////////////
	 
	var canvas = document.getElementById("student2");
	var context = canvas.getContext("2d");
	
	var grd = context.createRadialGradient(100,100,0,100,100,100);
	
	grd.addColorStop(0,"red");
	grd.addColorStop(1,"#ffcc66");
	
	context.fillStyle = grd;
	context.fillRect(0,0,200,200);
	context.arc(100, 100, 90, 0, 2 * Math.PI);
	
	context.font = "30px arial";
	context.strokeText("<%=name%>", 55, 110);
	context.stroke();
</script>
</html>