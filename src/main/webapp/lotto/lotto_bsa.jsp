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
	//DB작업에 필요한 객체변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null; //쿼리문이  'select'일 경우 필요
	
	String name = "";
	
	try {
		//1.드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//2.DB접속==>COnnection 객체 생성
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "pc00";
		String pass = "java";
		
		conn = DriverManager.getConnection(url, user, pass);
		//호출이 될때마다 컨넥션을 새로 만들음
		//3.Statement객체 생성(Statement객체는 Connection객체를 생성한다.)
		stmt = conn.createStatement();
		
		//4.SQL문을 Statement샛체를 이용하여 실행하고 실행결과를 Result객체에 저장한다.
		String sql = " select * from student where id = (select round(dbms_random.value(1,(select count(*) from student)),0)from dual)";
		rs= stmt.executeQuery(sql);
		
		//5.결과처리==>ResultSet객체에 저장되어 있는 자료를 반복문을 이용하여 차례로 읽어와 처리한다.
		
		System.out.println("========실행 결과========");
		
		
		//ResultSet객체에 담겨있는 데이터(레코드)에 접근하기 위해 현재 작업을 진행하는 레코드를 가리키는 것이 있는데 이것을 커서(cursor)라고 한다.
		//nect()메서드는 이커서의 위치를 다음 레코드 위치로 이동시키고 그 자리에 데이터가 있으면 true, 없으면 false를 반환함.
		rs.next();
		
		name = rs.getString("name");
		/*	
				out.write("<table border=\"1\">");
				out.write("<td>학번</td>"+"<td>이름</td>"+"<td>호출횟수</td>");
			while(rs.next()){
				out.write("<tr>");
				out.write("<td>"+rs.getInt("id")+"</td>");
				out.write("<td>"+rs.getString("name")+"</td>");
				out.write("<td>"+rs.getString("callcnt")+"</td>"+"</tr>"+"<br>");		
			
			}
		 */
		out.write("</table>");
		System.out.println("출력 끝....");

	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} finally {

		//6.사용했던 자원반납
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e2) {
			}
		;
		if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException e2) {
			}
		;
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e2) {
			}
		;
	}
%>
<canvas id="student" width="200" height="200" style="border: 1px solid #000000"></canvas>
<canvas id="student2" width="200" height="200" style="border: 3px solid hotpink"></canvas>


</body>
<script>

	var canvas=document.getElementById("student");
	var context = canvas.getContext("2d");
	context.beginPath();
	context.arc(100,100,100,0,2*Math.PI);
	context.style="border:2px";
	context.stroke();
	
	context.font = "60px arial";
	context.fillText("<%=name%>",15,125);

	

	var canvas=document.getElementById("student2");
	
	var context = canvas.getContext("2d");
	
	var grd = context.createRadialGradient(75, 50, 5, 90, 60, 150);
	grd.addColorStop(0, "red");
	grd.addColorStop(1, "white");
	context.fillStyle = grd;
	context.beginPath();
	
	//원
	context.arc(100,100,100,0,2*Math.PI);
	context.arc(100,100,95,0,2*Math.PI);
	context.strokeStyle="#f44336";
	context.stroke();
	
	

	//글씨
	context.font = "60px arial";
	context.shadowColor="rad";
	context.fontStyle =grd;
	context.fillText("<%=name%>",12,125);
	context.shadowBlur=10;
	
	
	
	

	
		
</script>
</html>