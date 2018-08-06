<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
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
		ResultSet rs = null;
		
		String name = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "pc00";
			String pass = "java";
			
			conn = DriverManager.getConnection(url, user, pass);
			
			stmt = conn.createStatement();
			
			String sql = "select * from student where id = (select round(dbms_random.value(1,(select count(*) from student)), 0) from dual)";
			rs = stmt.executeQuery(sql);
			
				
			rs.next();
			name = rs.getString("NAME");
				
// 			while(rs.next()) {
// 				out.write("=학생랜덤=<br>");
// 				out.write("ID : " + rs.getInt("ID") + "<br>");
// 				out.write("NAME : " + rs.getString("NAME") + "<br>");
// 				out.write("CALL_CNT : " + rs.getInt("CALL_CNT") + "<br>");
// 			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn != null) try{ conn.close(); }catch(SQLException e2){}
			if(stmt != null) try{ stmt.close(); }catch(SQLException e2){}
			if(rs != null) try{ rs.close(); }catch(SQLException e2){}
		}
	%>
	
	<canvas id="student" width="300" height="300" style="border:1px solid #000000;"></canvas>
	<canvas id="student2" width="300" height="300" style="border:1px solid #000000;"></canvas><br>
<!-- 	<canvas id="studentBtn" width="610" height="100" style="border:1px solid #000000;"></canvas> -->
	
</body>
	<script>
		var canvas = document.getElementById("student");
		var context = canvas.getContext("2d");
		context.beginPath();
		context.font="60px arial";
		context.fillText("<%=name %>", 60, 170);
		context.arc(150, 150, 150, 0, 2 * Math.PI);
		context.stroke();
		
		
		// Create gradient
		canvas = document.getElementById("student2");
		context = canvas.getContext("2d");
		var gradient = context.createRadialGradient(150,150,50,150,150,200);
		gradient.addColorStop(0, "white");
		gradient.addColorStop(1, "#00ffff");

		// Fill with gradient
		context.fillStyle = gradient;
		context.fillRect(0,0,300,300);
		context.arc(150, 150, 150, 0, 2 * Math.PI);
		context.stroke();
		
		context.font = "60px Arial";
		context.strokeText("<%=name %>", 60, 170);
		
		function reset() {
			window.location.reload();
		}
		
	</script>
	  <div class="studentBtn" style="background-color:#f1f1f1">
	    <button type="button" class="cancelbtn" onclick="reset()">Reset</button><span> < 새로고침 </span>
<!-- 	    <span class="psw">Forgot <a href="#">password?</a></span> -->
	  </div>
</html>