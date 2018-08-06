<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  oracle db의 student 테이블을 조회하여 화면에 출력  -->
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
		String name = "";
		try {
			//드라이브 올리고
			Class.forName("oracle.jdbc.driver.OracleDriver");
		
			//DB접속 // url, user, password 필요
			//Connection객체
			String url ="jdbc:oracle:thin:@localhost:1521:xe";
			String user ="pc00";
			String password = "java";
			conn = DriverManager.getConnection(url, user, password);
			//Statemente 객체 (sql질의하는 문)
			stmt = conn.createStatement();
			
			
			//ResultSet 객체 (select면 내용들, 딴건는 레코드 수)
			String sql = "select * from student where id = (select round(dbms_random.value(1,25),0)from dual)"; //쿼리문
			rs =  stmt.executeQuery(sql);
		
			rs.next();
			name = rs.getString("name");
				
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//6.사용했던 자원 반납
			if(rs!=null)try{rs.close();}catch(SQLException e2){}
			if(stmt!=null)try{stmt.close();}catch(SQLException e2){}
			if(conn!=null)try{conn.close();}catch(SQLException e2){}
		}
	%>	
	<canvas id="student" width="200" height="200" style="border: 1px solid pink"></canvas>
	<canvas id="student2" width="200" height="200" style="border: 1px solid white"></canvas>
</body>
<script>

   var canvas=document.getElementById("student");
   var context = canvas.getContext("2d");
   context.beginPath();
   context.arc(100,100,100,0,2*Math.PI);
   context.stroke();
   
   context.font = "60px arial";
   context.fillText("<%=name%>",10,115);
   
   var canvas=document.getElementById("student2");
   var context = canvas.getContext("2d");
   context.beginPath();
   context.arc(100,100,100,0,2*Math.PI);
   var brush1 =context.createRadialGradient(100,100,0,100,100,80);
   brush1.addColorStop(0, "yellow");
   brush1.addColorStop(1, "white");
   context.fillStyle = brush1;
   context.fill();
   
   context.font = "60px arial";

   var brush = context.createLinearGradient(0, 0, canvas.width, canvas.height);
   brush.addColorStop(0, "red");
   brush.addColorStop(0.3, "yellow");
   brush.addColorStop(0.5, "green");
   brush.addColorStop(0.7, "blue");
   brush.addColorStop(1, "violet");
   context.strokeStyle= "pink";
   		for(var i =0; i<12;i++){
   		  context.strokeText("<%=name%>",2+i,111+i);   		  
   		}
  

   context.fillStyle = brush;
   context.fillText("<%=name%>", 22-8,127-4);
   
   

   
   
</script>
</html>