<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
<!-- oracle db의 student 테이블을 조회하여 화면에 출력 -->
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
			
			StringBuffer sql = new StringBuffer();
			sql.append("select *");
			sql.append(" from student");
			sql.append(" where id = (select round(dbms_random.value(1, (select count(*)");
			sql.append(" from student)), 0) from dual)");
			
			rs = stmt.executeQuery(sql.toString());
			
			rs.next();
			name = rs.getString("name");
			
// 			while(rs.next()){
// 				out.write(rs.getInt("id")+"/");
// 				out.write(rs.getString("name")+"/");
// 				out.write(rs.getInt("call_cnt")+"");
// 			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}finally{
			if (rs!=null) try{ rs.close(); }catch (SQLException e2) {}
			if (stmt!=null) try{ stmt.close(); }catch (SQLException e2) {}
			if (conn!=null) try{ conn.close(); }catch (SQLException e2) {}
		}
		
	%>
	
	<canvas id="student" width="200px" height="200px" style="border: 1px solid #000"></canvas>
	
	<canvas id="student2" width="200px" height="200px" style="border: 1px solid #000"></canvas>
	
</body>
<script>
	var canvas = document.getElementById("student");
	var context = canvas.getContext("2d");
	
	context.beginPath();
	context.arc(100, 100, 100, 0, 2*Math.PI);
	context.stroke();
	
	context.font = "60px arial";
	context.fillText("<%=name%>", 10, 115);
	
	//===================================================
	var canvas2 = document.getElementById("student2");
	var context2 = canvas2.getContext("2d");
	
// 	context2.globalAlpha = 0.9; // set global alpha	
	var grd = context2.createRadialGradient(100, 100, 20, 100, 100, 100);
	grd.addColorStop(0, "#0a3d62");
	grd.addColorStop(1, "#55efc4");	
	
	context2.fillStyle = grd;
	context2.fillRect(0, 0, 200, 200);	
	
	context2.font = "60px arial";
	context2.strokeText("<%=name%>", 10, 115);

</script>
</html>