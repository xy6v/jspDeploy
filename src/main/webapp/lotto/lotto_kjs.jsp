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

<!-- oracle DB의 student 테이블을 조회하여 화면에 출력 -->
<%

	// DB작업에 필요한 객체 변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;		// 쿼리문이 'select'일 경우 필요
	
	String name = "";
	
	try {
		// 1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 2. DB접속 : Connection객체 생성
		String url = "jdbc:oracle:thin:@localhost:1521:xe";	// 현재 컴퓨터에 oracle이 설치되어 있을 때 localhost
		String user = "pc00";
		String pass = "java";
		conn = DriverManager.getConnection(url, user, pass);
		
		// 3. Statement객체 생성(Statement객체는 Connection객체를 이용해서 생성한다)
		stmt = conn.createStatement();
		
		// 4. SQL문을 Statement객체를 이용하여 실행하고 실행 결과를 ResultSet객체에 저장한다.
		StringBuffer sql = new StringBuffer();
		sql.append("select * ");
		sql.append(" from student ");
		sql.append(" where id = ");
		sql.append(" (select round(dbms_random.value(1, (select count(*) from student)), 0) from dual) ");
		
		rs = stmt.executeQuery(sql.toString());
		
		rs.next();
		name = rs.getString("name");
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (rs!=null) try { rs.close(); } catch (SQLException e2) {}
		if (stmt!=null) try { stmt.close(); } catch (SQLException e2) {}
		if (conn!=null) try { conn.close(); } catch (SQLException e2) {}
	}

%>
<div class="body-wrap-basic">
	<h1>Lotto Test</h1>
	<canvas id="student" width="200" height="200"></canvas>
	<canvas id="student2" width="200" height="200"></canvas>
	<canvas id="student3" width="200" height="200"></canvas>
</div>
<style>
/* #student3 {border-radius:50%;background: linear-gradient(to bottom right, red, yellow)} */
.body-wrap-basic {position:relative;width:960px;margin:0 auto}
.body-wrap-basic h1 {font-size:60px;text-align:center}
#student, #student2 {position:absolute;left:50%;top:100px;transform:translate(-50%, 0)}
#student {z-index:99}
#student2 {z-index:9}
</style>

</body>

<script type="text/javascript">

	/**************************************
	Note : canvas1 - text
	**************************************/
	var canvas = document.getElementById("student");
	var context = canvas.getContext("2d");
	context.beginPath();
	context.arc(100, 100, 100, 0, 2*Math.PI);
	
	context.font = "40px arial";
	context.fillStyle = "white";
	context.fillText("<%=name%>", 40, 110);
	
	/**************************************
	Note : canvas2 - background
	**************************************/
	var canvas2 = document.getElementById("student2");
	var context2 = canvas2.getContext("2d");
	context2.beginPath();
	
	// Create gradient
	var grd = context2.createRadialGradient(100, 100, 50, 100, 100, 100);
	grd.addColorStop(0, "#3498db");
	grd.addColorStop(1, "white");
	
	// Fill with gradient
	context2.fillStyle = grd, "white";
	context2.fillRect(0, 0, 200, 200);
	
	context2.font = "60px arial";
	context2.fillText("<%=name%>", 10, 120);
	
	/**************************************
	Note : canvas3
	**************************************/
// 	var canvas3 = document.getElementById("student3");
// 	var context3 = canvas3.getContext("2d");
// 	context3.font = "40px arial";
// 	context3.fillStyle = "white";
<%-- 	context3.fillText("<%=name%>", 40, 115); --%>
</script>
</html>




