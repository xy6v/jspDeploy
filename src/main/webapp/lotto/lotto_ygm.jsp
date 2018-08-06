<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- oracle db의 student 테이블을 조회하여 화면에 출력 -->
	
	<%
	
	//DB작업에 필요한 객체 변수 선언
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;	//쿼리문이 'select'일 경우 필요
			
			String name = "";
			
			try {
				// 1. 드라이버 로딩
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				// 2. DB에 접속 => Connection객체 생성
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String user = "pc00";
				String pass = "java";
				
				conn = DriverManager.getConnection(url, user, pass);
				
				
				// 3. Statement객체 생성 (Statement 객체는 Connection객체를 이용해서 생성한다)
				stmt = conn.createStatement();
				
				// 4. SQL문을 Statement객체를 이용하여 실행하고 실행결과를 ResultSet객체에 저장한다.
				String sql = "SELECT * FROM STUDENT WHERE ID = (SELECT ROUND(DBMS_RANDOM.VALUE(1,(SELECT COUNT(*) FROM STUDENT)), 0) FROM DUAL)";
				String sql2 = "UPDATE student SET call_cnt = call_cnt + 1 where id = (SELECT ROUND(DBMS_RANDOM.VALUE(1,(SELECT COUNT(*) FROM STUDENT)), 0) FROM DUAL)";

				
				rs = stmt.executeQuery(sql2);
				rs = stmt.executeQuery(sql);
				
				// 5. 결과 처리 ==> resultSet 객체에 저장되어 있는 자료를 반복문을 이용하여 차례로 읽어와 처리한다.
//				 	ResultSet객체에 담겨 있는 데이터(레코드)에 접근하기 위해 현재 작업을 진행하는 레코드를 가리키는 것이 있는데
//					이것을 커서 (Cursor)라 한다.
//					next()메서드는 이 커서의 위치를 다음 레코드 위치로 이동시키고 그 자리에 데이터가 있으면 true, 없으면 false를 반환한다.
				
				
				
					out.write("<table>");
					out.write("<tr>");
					out.write("<td>번호</td>  <td>이름</td>  <td>걸린횟수</td>  "  );
					out.write("</tr>");

				rs.next();
				/* 	System.out.println("STD_NUM: " + rs.getInt("STD_NUM"));
					System.out.println("STD_NAME: " + rs.getString("STD_NAME")); //번호로 지정하여 사용하여도 된다.
						//컬럼의 데이터를 가져오기 위해서는 'get자료형이름()' 메서드를 사용하는데 이 메서드의 매가값으로 '컬럼명' 또는 '컬럼번호'를 지정하면 된다. (컬럼번호는 1번부터 시작한다)
					System.out.println("STD_KOR: " + rs.getString("lprod_gu"));
					System.out.println("STD_ENG: " + rs.getString("STD_ENG"));
					System.out.println("STD_MAT: " + rs.getString("STD_MAT"));
					System.out.println("=======================================");
					 */
					 name = rs.getString("name");
					 
				/* 	out.write("<tr>");
					out.write("<td>" + rs.getInt("id")+ "</td>" );
					out.write("<td>" + rs.getString("name") + "</td>" );
					out.write("<td>" + rs.getString("call_cnt") + "</td>" );
					out.write("</tr>"); */
				
					out.write("</table>");
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} finally{
				//6. 사용했던 자원 반납
				if(rs!=null) try {rs.close();} catch (SQLException e2) {}
				if(stmt!=null) try {stmt.close();} catch (SQLException e2) {}
				if(conn!=null) try {conn.close();} catch (SQLException e2) {}
			}
			
	
	%>
			<canvas id="student" width="200" height="200" style="border: 1px solid #000000"></canvas>


			<!-- <svg id="student2" width="300" height="200"> 
				<canvas id="student2" width="200" height="200" style="border: 1px solid #000000"></canvas> 
			
				<polygon
				points="100,10 40,198 190,78 10,78 160,198"
				style="fill:lime;stroke:purple;stroke-width:5;fill-rule:evenodd;" />
			</svg> -->
			
			
			<canvas id="student2" width="200" height="200" style="border: 1px solid #000000"></canvas>


</body>

<script>

   var canvas=document.getElementById("student");
   var context = canvas.getContext("2d");
   context.beginPath();
   context.arc(100,100,100,0,2*Math.PI);
   context.stroke();
   
   context.font = "60px arial";
   context.fillText("<%=name%>" ,10,115);
   
   
   

	var canvas;
	var ctx;
	window.onload = function() {
		canvas = document.getElementById("student2");
		if (canvas == null || canvas.getContext == null) return;
		ctx = canvas.getContext("2d");
		draw();
	}
	
	function draw() {
		ctx.font = "30pt 궁서";
		ctx.fillStyle = "gray";
		ctx.fillText("<%=name%>", 100, 100);

		ctx.rotate(30 * Math.PI / 180);
		ctx.fillStyle = "gray";
		ctx.fillText("<%=name%>", 40, 40);
		
		ctx.font="bold 80px 궁서";
		
		ctx.shadowColor = "gray";
		ctx.shadowOffsetX = 6;
		ctx.shadowOffsetY = 6;
		ctx.shadowBlur = 12;
		
		ctx.fillStyle = "pink";
		ctx.fillText("<%=name%>", 10,100);
	
		ctx.shadowOffsetX = 0;
		ctx.shadowOffsetY = 0;
		ctx.shadowBlur = 0;
	
		ctx.lineWidth = 3;
		ctx.strokeStyle = "pink";
		ctx.strokeText("<%=name%>", 10,20);
		
		
	}

	
   
   

   
</script>


</html>