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
<style>
html, body, h1, p, a {
	padding: 0;
	margin: 0;
	line-height: 1
}

img {
	border: 0
}

div.imgTopic {
	position: relative;
	width: 200px;
	height: 200px;
	font-family: 'Dotum', '돋움', sansserif;
	border: 1px solid powderblue;
/* 	background:rgba(0, 0, 0, .7); */
	background-image : url('data:image/png;base64,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');
}

div.back {
	position:absolute;
	height:100px;
	z-index:1;
	bottom:0;
	left:0;
	right:0;
	background:rgba(0, .7, .7, .7);
}

div.imgTopic a {
	text-decoration: none
}

h1.title {
	position: absolute;
	z-index: 1;
	left: 5px;
	bottom: 50px
}

h1.title a {
	font-size: 30px;
	font-weight:900;
	color:white;
	
}

h1.title a:hover, h1.title a:focus {
	text-decoration: underline;
}

p.content a {
	font-size: 20px;
	color: red
}

span.date {
	position: absolute;
	display: block;
	left: 0;
	bottom: 0;
	width: 200px;
	height: 50px;
	padding: 0px 0 0 5px;
}
</style>
</head>
<body>

	<!-- 07.06 oracle db의 student 테이블을 조회하여 화면에 출력 -->

	<%
		Connection conn = null;	//connection객체
			Statement stmt = null;	//connection객체를 이용해서 연결객체생성
			ResultSet rs = null;	//결과값을 담을 객체 (select문만 해당)
			String name = ""; //resultSet에서 가져올때 담을객체
			
			// 1. 드라이버를 로딩(동적 바인딩)
			// 프로그램 실행시 드라이버를 로딩한다.
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//──────────────────────────────────────────────────────────────────
			
			// 2. DB접속 ==> Connection 객체 생성
			//							     자기컴퓨터   오라클버전에따라다름
			//									│		   │			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "PC00"; 	//Oracle Id
			String pass = "java";	//Oracle 비번
			conn = DriverManager.getConnection(url, user, pass);
			
			//──────────────────────────────────────────────────────────────────
			
			// 3. Statetment 객체 생성
			// Statement 객체는 Connection 객체를 이용해 생성한다.
			stmt = conn.createStatement();
			
			//──────────────────────────────────────────────────────────────────
			
			// 4. SQL문을 Statement 객체를 이용해 실행하고 
			//	실행 결과를 ResultSet 객체에 저장한다(Select문만 해당)
			String sql = " select * from student where id =   (select round(dbms_random.value(1, (select count(*) from student)),0) from dual) ";
			rs = stmt.executeQuery(sql);
			// 5. 결과처리 ==> ResultSet 객체에 저장되어 있는 자료를
			//		    	  반복문을 이용해 차례로 읽어와 처리한다.
			/*
					ResultSet 객체에 담겨 있는 데이터에 접근하기 위해 
					현재 작업을 진행하는 레코드를 가리키는 것이 있는데 
					이것을 커서(Cursor)라고 한다. 
					next()메서드는 이 커서의 위치를 다음 레코드 위치로 이동시키고 
					그 자리에 데이터가 있으면 true, 없으면 false를 반환한다. 
			*/
		rs.next(); //데이터가 1건이기때문에 loop를 돌 필요가 없다.
		name = rs.getString("name");
		/* 
		out.write(rs.getString("ID")+" │ ");
		out.write(rs.getString("name")+" │ ");
		out.write(rs.getInt("CALL_CNT")+" │ "+"<br>");
		 */

		rs.close();
		stmt.close();
		conn.close();
	%>
	<canvas id="student" width="200" height="200" style="border: 1px solid powderblue"></canvas>

</body>
<script>
	var canvas = document.getElementById("student");
	var context = canvas.getContext("2d");
	context.beginPath();

	/*  x   y   r   시작 종료  */
	context.arc(100, 100, 100, 0, 2 * Math.PI);
	context.stroke();


	var c = document.getElementById("student");
	var ctx = c.getContext("2d");
	ctx.font = "60px Arial";
	ctx.fillText("<%=name%>", 0, 120);
</script>
<!--  <body onload="draw();">
   <canvas id="student2" width="200" height="200"></canvas>
   <div class = "containerBox">
   <div class='text-box'>
     <img class="img-responsive" id="source" src="data:image/png;base64,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" width="200" height="200">
     <img class="img-responsive" id="frame" src="data:image/png;base64,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" width="200" height="200">
   </div>
   </div>
   
 </body> -->

<div class="imgTopic">
	<div class="back"></div>
	<h1 class="title">
		<a href="#">YOU!!</a>
	</h1>
	<p class="content">
			<span class="date"><%=name%></span>
	</p>
</div>

</html>