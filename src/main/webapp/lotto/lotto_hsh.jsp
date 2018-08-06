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
		// 1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 2. DB접속 : Connection객체 생성
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "pc00";
		String pass = "java";
		conn = DriverManager.getConnection(url, user, pass);
		
		// 3. Statement객체 생성 : Statement객체는 Connection객체를 이용해서 생성한다.
		stmt = conn.createStatement();
		
		// 4. SQL문을 Statement객체를 이용하여 실행하고 실행결과를 ResultSet객체에 저장한다.
		StringBuffer sql = new StringBuffer();
		sql.append("select * ");
		sql.append("from student ");
		sql.append("where id = ");
		sql.append("(select round(dbms_random.value(1, (select count(*) from student)),0) from dual)");
		rs=stmt.executeQuery(sql.toString());
		
		out.write("<h2>로또인듯 로또아닌 로또같은 로또 당첨자</h2>");

		rs.next(); 
		name = rs.getString("name");
			
 		
	} catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		if (rs!=null) try{ rs.close(); }catch (SQLException e2) {}
		if (stmt!=null) try{ stmt.close(); }catch (SQLException e2) {}
		if (conn!=null) try{ conn.close(); }catch (SQLException e2) {}
	}	

	
	
%>

<canvas id="student" width="500" height="688" style="border:1px solid #000;"></canvas>


<canvas id="student2" width="200" height="200" style="border:1px solid #000;"></canvas>


</body>
<script>
 var canvas = document.getElementById("student");
 var context = canvas.getContext("2d");
 context.clearRect(0, 0, canvas.width, canvas.height);
 context.beginPath();
 context.arc(100, 100, 100, 0, 2*Math.PI);
 context.font = "30px arial"
 context.fillText("<%= name %>",190, 560);
 
 //이미지 객체 생성입
 var imgClo = new Image();

 //페이지 로드후 이미지가 로드 되었을 때 이미지 출력
 imgClo.addEventListener('load', function(){
     //로드된 이미지를 캔버스에 출력
     //canvas.drawImage() 함수를 사용하여 이미지 출력
     //drawImage ( image sx, sy, sWidth, sHeight, dx, dy, dWidth, dHeight)
     context.drawImage( imgClo , 0, 0, 500, 688);
 },false);

 //이미지 경로 설정
 imgClo.src="bo.png";
 
 
 
 
 var canvas2 = document.getElementById("student2");
 var context2 = canvas2.getContext("2d");
 context2.beginPath();
 context2.arc(100, 100, 100, 0, 2*Math.PI);
 context2.stroke();
 context2.font = "50px arial"
 context2.fillText("<%= name %>", 25, 115);
 
 
 
 
</script>

</html>