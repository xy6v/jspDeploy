<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
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
String name = "";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user ="pc00";
	String pass ="java";
	conn = DriverManager.getConnection(url, user, pass);
	
	stmt = conn.createStatement();
	
	String sql = "select * from student where id=(select round(dbms_random.value(1, (select count(*) from student)),0) from dual)";
	rs = stmt.executeQuery(sql);
	
	rs.next();
	name=rs.getString("name");
// 		out.write(rs.getInt("id") + "/");
// 		out.write(rs.getString("name")+ "/");
// 		out.write(rs.getInt("call_cnt")+"");
	
	
} catch (SQLException e) {
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}finally{
	if(rs != null) try { rs.close();} catch (SQLException e2) {	}
	if(stmt != null) try { stmt.close();} catch (SQLException e2) {	}
	if(conn != null) try { conn.close();} catch (SQLException e2) {	}
}
%>
<canvas id="student" width="200" height="200" style="border:1px solid #000000"></canvas>
<canvas id="student2" width="450" height="300" style="border:1px solid #000000"></canvas>
</body>
<script>
	var canvas = document.getElementById("student");
	var context = canvas.getContext("2d");
	context.beginPath();
	context.arc(100, 100, 100, 0, 2*Math.PI); //100, 100, 100, 0, 2*Math.PI
	context.stroke();
	context.font = "40px Arial";
	context.strokeText("<%=name%>",40,110);
	var canvas2 = document.getElementById("student2");
	var context2 = canvas2.getContext("2d");
	var img = new Image();
	img.src="char.png";
	img.onload=function(){
		context2.drawImage(img, 0,100);
	}
	var grd = context2.createLinearGradient(0, 0, 200, 0);
	grd.addColorStop(0.5, "red");
	grd.addColorStop(1, "yellow");
	context2.strokeStyle = grd;
	context2.beginPath();
	context2.font = "40px Arial";
	context2.strokeText("<%=name%>",160,70);
	
</script>
</html>