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
<style>
.triangle-up {
	width: 0;
	height: 0;
	border-left: 25px solid transparent;
	border-right: 25px solid transparent;
	border-bottom: 50px solid #555;
}
</style>
</head>
<body>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String name = "";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "pc00";
		String pass = "java";
		
		conn = DriverManager.getConnection(url, user, pass);
		stmt = conn.createStatement();
		
		String sql = "select * from student where id = (select round(dbms_random.value(1,(select count(*) from student)),0) from dual)";
		rs = stmt.executeQuery(sql);
%>
		<%rs.next();%>
<%-- 		<%out.write("-결과-");%><br> --%>
<%-- 		<%out.write("학생 이름 : " + rs.getString("name"));%><br>	 --%>
<%-- 		<%out.write("학생 id : " + rs.getInt("id"));%><br>	 --%>
<%-- 		<%out.write("호출 횟수  : " + rs.getInt("callcnt"));%><br>		 --%>
		<%name = rs.getString("name");%>
<%
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if(rs!=null) try { rs.close(); } catch (SQLException e2) {}
		if(stmt!=null) try { stmt.close(); } catch (SQLException e2) {}
		if(conn!=null) try { conn.close(); } catch (SQLException e2) {}
	}
%>

<!-- canvas -->
<canvas id="student" width="200" height="200" style="border: 1px solid #000000"></canvas>

<canvas id="student2" width="500" height="500" style="border: 1px solid #000000"></canvas>

<div class="triangle-up"></div>

</body>

<script>
	var canvas = document.getElementById("student");
	var context = canvas.getContext("2d");
	context.beginPath();
	context.arc(100, 100, 100, 0, 2*Math.PI);
	context.stroke();
	
	context.font = "60px arial";
	context.fillText("<%=name%>", 10, 115);
	//////////////////////////////////////////////////
	var canvas2 = document.getElementById("student2");
	var context2 = canvas2.getContext("2d");
	
	var grd = context2.createRadialGradient(200, 100, 50, 360, 250, 300);
	grd.addColorStop(0, "skyblue");
	grd.addColorStop(1, "#99ff99");
	
	context2.fillStyle = grd;
	context2.fillRect(10,10,500,500);
	context2.font = "90px Arial";
	context2.strokeText("<%=name%>",100, 250);
</script>
</html>