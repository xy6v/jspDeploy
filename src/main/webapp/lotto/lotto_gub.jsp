<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- student테이블에서 학생이름을 랜덤으로 출력하시오  -->
	<% 
	
		// DB 작업에 필요한 객체변수 선언 ( sql껄로 선택)
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;  //쿼리문이'select'일 경우 필요
		
		String name = "";

		try {
			// 1. 드라이버 로딩 
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//2. DB 접속 ==> Connection 객체생성
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "pc00";
			String pass = "java";
			conn = DriverManager.getConnection(url, user, pass);

			// 3. Statement 객체생성
			//		Statement 객체는 Connection 객체를 이용해서 생성한다.
			stmt = conn.createStatement();

			// 4. SQL 문을 Statement 객체를 이용하여 실행하고 실행결과를 ResultSet 객체에 저장한다. // 4번전까지는 방법이 거의 같음 
	/* select * from student where id =
		( select round( dbms_random.value(1, (select count(*) from student )), 0 ) from dual ); */
			String sql = "select * from student where id = ( select round( dbms_random.value(1, (select count(*) from student )), 0 ) from dual )";
			rs = stmt.executeQuery(sql); //  executeQuery ==> 'select'일 경우
			StringBuffer sql2 = new StringBuffer();		
			sql2.append("select * from student");
			
			
		

			// 5. 결과 처리 ==> ResultSet 객체에 저장되어 있는 자료를 반복문을 이용하여 차례로 읽어와 처리한다. 
			out.write("실행결과==================" + "<br><br>");
			

			// ResultSet 객체에 담겨있는 데이터(레코드ㅡ)에 접근하기위해 현재작업을 진행하는 레코드를 가리키는 것이 있는데 
			// 이것을 커서(Cursor)라 한다.
			// next()메서드는 이 커서의 위치를 다음 레코드 위치로 이동시키고 그 자리에 데이터가 있으면 true, 없으면 false를 반환한다. 

// 			while (rs.next()) {  //컬럼의 데이터를 가져오기 위해서는  get 자료형이름() 메서드를 사용하는데 이 메서드의 매개값으로 '컬럼명' 또는 '컬럼번호'를 지정하면된다.(컬럼 번호는 1부터 시작한다.) 
				rs.next();
				name = rs.getString("name");
				
// 				out.write(rs.getInt("ID") + " / " + rs.getString("NAME") + " / " + rs.getInt("call_cnt") +"<hr>" );
// 				out.write("ID: " + rs.getInt("ID") + " | ");
// 				out.write("NAME: " + rs.getString("NAME") + " | ");
// 				out.write("CALL_CNT: " + rs.getInt("CALL_CNT") + "<br>");
// 				out.write(rs.getInt("CALL_CNT")); // 하면 안나온다 
// 				out.write("--------------------------------------" + "<br>");
// 			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
		} finally {
			// 6. 사용했던 자원 반납 
			if (rs != null)	try {rs.close();} catch (SQLException e2) {	}
			if (stmt != null) try {	stmt.close();} catch (SQLException e2) { }
			if (conn != null)	try { conn.close();	} catch (SQLException e2) {	}
		}
	%>
	
	<!--https://www.w3schools.com/html/html5_canvas.asp 를 이용해서 이쁘게 꾸며보자  -->
	
	<canvas id="student" width="200" height="200"  style="border: 1px solid #000000;"></canvas>
	
	<canvas id="student2" width="200" height="200"  ></canvas>  <!-- style="border: 2px solid #D6A2E8;" -->
	<img id="saram" src="wonder.png" alt="The img" width="200" height="200" hidden="true">
	<p><button onclick="randomStudent()">Click</button></p>
	
</body>
<script>
/* var c = document.getElementById("myCanvas");
var ctx = c.getContext("2d");
ctx.beginPath();
ctx.arc(95, 50, 40, 0, 2 * Math.PI);
ctx.stroke(); */

	var canvas = document.getElementById("student");
	var context = canvas.getContext("2d");
	context.beginPath();
	context.arc(100, 100, 100, 0, 2*Math.PI); 
	context.stroke();
	context.font = "60px arial";
	context.fillText("<%=name%>", 10, 115);
	
	///////////////////////////////////////////////
	
// 	var canvas2 = document.getElementById("student2");
// 	var context2 = canvas2.getContext("2d");
// 	context2.stroke();
// 	var img = document.getElementById("saram");
// 	context2.drawImage(img, 0, 0, 200, 200);

// 	context2.font = "40px Comic Sans MS";
// 	context2.fillStyle = "#fff200";
// 	context2.textAlign = "center";
// 	context2.fillText("오늘의 주인공", canvas.width/2, 185); 
	
	
	function randomStudent(){
	var canvas2 = document.getElementById("student2");
	var context2 = canvas2.getContext("2d");
	
	var img = document.getElementById("saram");
	context2.drawImage(img, 0, 0, 200, 200);

	context2.font = "30px Comic Sans MS";
<%-- 	context2.strokeText("★"+"<%=name%>"+"★", 25, 185); --%>
	context2.fillStyle = "#4cd137";
	context2.textAlign = "center";
	context2.fillText("★"+"<%=name%>"+"★", canvas.width/2, 185); 
	
	context2.stroke();
	};
</script>

</html>






















