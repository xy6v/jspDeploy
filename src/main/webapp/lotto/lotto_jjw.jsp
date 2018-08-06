<%@page import="java.io.Console"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<script src="https://ajax.googleapis.com/ajax/libs/dojo/1.13.0/dojo/dojo.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;		// 쿼리문이 'SELECT'일 경우 필요
		String name = "";
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. DB 접속 ==> Connection 객체 생성
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id  = "pc00";
			String pw  = "java";
			
			conn = DriverManager.getConnection(url, id, pw);
			
			// 3. Statement 객체 생성 (Statement 객체는 Connection 객체를 이용해서 생성한다.)
			stmt = conn.createStatement();
			
			// 4. SQL문을 Statment객체를 이용하여 실행하고 실행 겨로가를 ResultSet객체에 저장한다.
			String sql = "SELECT	*  "
						+"FROM STUDENT "
						+"WHERE ID = (SELECT  ROUND(DBMS_RANDOM.VALUE(1,(SELECT COUNT(*) FROM STUDENT)),0) "
						+			 "FROM DUAL) ";
			rs = stmt.executeQuery(sql);

			while (rs.next()){
				
				name = rs.getString("name");
				
// 				out.write("  ID : "+rs.getString("id") + "<br/>");
// 				out.write("  NAME: "+rs.getString("name")+ "<br/>");
// 				out.write("  CALL_CNT : "+rs.getString("call_cnt")+ "<br/>");
// 				out.write("========================================= <br/>");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// 6. 사용했던 자원 반납
			if (rs != null)   { try { rs.close();  } catch (SQLException e2) {  e2.printStackTrace(); } }
			if (stmt != null) {  try {  stmt.close();  } catch (SQLException e2) {  e2.printStackTrace(); } }
			if (conn != null) {  try {  conn.close();  } catch (SQLException e2) {  e2.printStackTrace(); } }
		}
	%>

<title>Insert title here</title>
</head>
<body>
	<img src="/img/하트_라이언.gif" width="100" height="100" id="i1" hidden="true">
	<img src="/img/카톡 런런1.gif" width="100" height="100" id="i2" hidden="true">
	<img src="/img/61269a70d775af7b43c3c767e13d711f.gif" width="100" height="100" id="i3" hidden="true">
	<img src="/img/pooh.gif" width="100" height="100" id="i4" hidden="true">
	<img src="/img/kakao2.gif" width="100" height="100" id="i5" hidden="true">
	<img src="/img/kakao1.gif" width="100" height="100" id="i6" hidden="true">
	<img src="/img/9667341cc07028aa766bd361712932e0.gif" width="100" height="100" id="i7" hidden="true">
	<img src="/img/61269a70d775af7b43c3c767e13d711f.gif" width="100" height="100" id="i8" hidden="true">
	<img src="/img/23.gif" width="100" height="100" id="i9" hidden="true">
	<img src="/img/9a451af0e24cc1283f6656cb3786cc47.gif" width="100" height="100" id="i10" hidden="true"> 
	<img src="/img/8f6a46b21f5205711fe55a9a1eb3bc5b.gif" width="100" height="100" id="i11" hidden="true">
	
	<canvas id="myCanvas" width="320" height="100" style="border:1px solid #000000;"/>
</body>
<script type="text/javascript">

	var rImg = ['i1','i2','i3','i4','i5','i6','i7','i8','i9','i10','i11'];
	var count = Math.floor(Math.random()*(rImg.length-1-0+1));
	var result = rImg[count];
	
	var c = document.getElementById("myCanvas");
	var ctx = c.getContext("2d");
	ctx.font = "65px Arial";
	
	var imgCtx = c.getContext("2d");
	var img = document.getElementById(result);
	imgCtx.font = "65px Arial";

	var grdCtx = c.getContext("2d");
	// Create gradient
	var grd = grdCtx.createLinearGradient(0, 0, 200, 200);
	grd.addColorStop(0, "red");
	grd.addColorStop(1, "white");
	// Fill with gradient
	ctx.fillStyle = grd;
	ctx.fillRect(10, 10, 280, 80);
	
	imgCtx.drawImage(img, 8, 8,100, 80);
	ctx.strokeText("<%=name %>", 100, 75);
		
</script>
</html>