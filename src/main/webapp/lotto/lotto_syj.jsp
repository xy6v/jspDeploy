<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
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
	/* try-catch문을 작성하지 않아도 되는 이유 :  
		하지만 사용했던 자원은 반납하는것이 좋다. */	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "pc00";
	String pass = "java";
	Connection conn =null;
	Statement  stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
			
	String name = "";
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		stmt = conn.createStatement();
		String sql = "select * from student where id = (select round(dbms_random.value(1, (select count(*) from student)), 0 ) from dual)";
		pstmt = conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		rs.next();
		
// 		out.write(rs.getString("ID" + ""));
// 		out.write(rs.getString("NAME"));
// 		out.write(rs.getString("CALL_CNT" + ""));
		name = rs.getString("NAME");
		
		
// 		String sql2 = "update student set CALL_CNT = call_cnt + 1 where ID = rs.getInt('ID')";
		
		conn.close();
	
	} catch (SQLException e) {
		e.printStackTrace();		
	} finally {
		if(rs!=null) try {rs.close();} catch (SQLException e) {}
		if(stmt!=null) try {stmt.close();} catch (SQLException e) {}
		if(conn!=null) try {conn.close();} catch (SQLException e) {}
	}
	
	
%>
<!-- 	style="border:1px solid #000000;background-color:#e3a1f1;" -->
<canvas id="student" width="400" height="400"></canvas>
<canvas id="ball" width="200" height="200"></canvas>
</body>
<script>	
	var canvas = document.getElementById("student");
	var ctx = canvas.getContext("2d");
	var ballRadius = 10;
	
	var x = canvas.width/2;
	var y = canvas.height/2;
	var dx = 2;
	var dy = -2;
	
	function drawName() {
		var ball = document.getElementById("ball");
		
		ctx.beginPath();
		ctx.arc(100, 100, 100, 0, Math.PI*2);
		
	    ctx.fillText("<%=name %>", "55", "105");
	    ctx.font = "30px arial";
// 	    ctx.fillStyle = "blue";
	    var grd = ctx.createLinearGradient(0, 0, 400, 0);
		grd.addColorStop(0, "blue");
		grd.addColorStop(1, "white");
		ctx.fillStyle = grd;
	    ctx.stroke();
	    ctx.closePath();
	}
	
	function drawBall() {
	    ctx.beginPath();
	    ctx.arc(x, y, 70, 0, Math.PI*2);
	    ctx.fill();
	    ctx.closePath();
	}
	
	function draw() {
	    ctx.clearRect(0, 0, canvas.width, canvas.height);
	    drawName();
	    drawBall();
	    if(x + dx > canvas.width-ballRadius || x + dx < ballRadius) {
	        dx = -dx;
	    }
	    if(y + dy > canvas.height-ballRadius || y + dy < ballRadius) {
	        dy = -dy;
	    }
	    
	    x += dx;
	    y += dy;
	}

	setInterval(draw, 10);
	
	
</script>


</html>