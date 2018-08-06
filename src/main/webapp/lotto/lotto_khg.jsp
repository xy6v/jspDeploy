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
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null; 

String name = "";

try {
	//1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//2.DataBase에 접속 => Connection객체 생성
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user ="pc00";
	String pass ="java";
	conn = DriverManager.getConnection(url, user, pass);
	
	//3. Statement객체 생성(Statement객체는 Connection객체를 이용해서 생성)
	stmt = conn.createStatement();
	
	//4. SQL문을 Statement객체를 이용하여 실행하고 실행 결과를 ResultSet객체에 저장한다
	String sql = "select * from student where id= (select round(dbms_random.value(1,(select count(*) from student)),0) from dual)";
	rs = stmt.executeQuery(sql);
	
	rs.next();
	name = rs.getString("name");
	
	%>

	
<%-- 	<% while(rs.next()){%> --%>
<%-- 		 <%=rs.getInt("id") %>/ --%>
<%-- 		 <%=rs.getString("name")%>/ --%>
<%-- 		 <%=rs.getInt("call_cnt") %> --%>
		
<!-- 		<hr> -->
			
		
<%-- <%}%> --%>

	
	

		

<%} catch (SQLException e) {
	e.printStackTrace();
} catch (ClassNotFoundException e) {	
	e.printStackTrace();
}finally{
	//6. 사용했던 자원 반납
	if(rs != null) try { rs.close();} catch (SQLException e2) {	}
	if(stmt != null) try { stmt.close();} catch (SQLException e2) {	}
	if(conn != null) try { conn.close();} catch (SQLException e2) {	}
}
	%> 
	
<canvas id="student" width="400" height="400" style="border : 1px solid #d3d3d3"></canvas>
<script>

	
	
	var canvas = document.getElementById("student");
	var ctx = canvas.getContext("2d");
	ctx.beginPath();
	ctx.arc(200,200,200,0,2*Math.PI); 
	ctx.stroke();
	ctx.strokeStyle = "border : 2px solid blue";
	
	
	var gradient2=ctx.createLinearGradient(0,0,canvas.width,0);
	gradient2.addColorStop("0.3","magenta");
	gradient2.addColorStop("0.5","blue");
	gradient2.addColorStop("1.0","skyblue");

	// Fill with gradient
	ctx.strokeStyle=gradient2;
	ctx.lineWidth=3;
	ctx.strokeRect(0,0,400,400);
	
	ctx.font = "70px Verdana";
	var gradient = ctx.createLinearGradient(0,0,canvas.width,0);
	gradient.addColorStop("0.3","magenta");
	gradient.addColorStop("0.5","blue");
	gradient.addColorStop("1.0","skyblue");
	ctx.strokeStyle = gradient;
	ctx.strokeText("<%=name%>", 100, 200);
	
</script>	
</body>
</html>