<%@page import="org.apache.commons.dbcp2.BasicDataSource"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
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
	<!-- db connection 얻는 방법 3가지
		1.jdbc
		2.application connection pool
		3.was connection pool (jndi)
		
		각 방법별로 컨넥션을 생성하는 시간 profiling
	 -->
	 
<%

	//db 설정에 대한 값 설정
	String driverClassName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "pc00";
	String password = "java";
	int poolSize	=	10; 
	
	BasicDataSource bds = new BasicDataSource();
	bds.setDriverClassName(driverClassName);
	bds.setUrl(url);
	bds.setUsername(username);
	bds.setPassword(password);
	bds.setInitialSize(poolSize);
	
	//컨넥션을 100번 얻어오고 해제한다.
	Connection conn = null;
	int i = 0;
	try{
		long startTime = System.currentTimeMillis();
		
		for(; i < 100; i++){
			conn = bds.getConnection();
			out.write("scheme : " + conn.getSchema() + "<br>");
			conn.close();
		}
		
		long endTime = System.currentTimeMillis();
		
		out.write("during : " + (endTime-startTime) +"ms");
		
		bds.close();
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("i : " + i);
	}finally{
		if(conn!=null) try { conn.close();	} catch (SQLException e2) {	e2.printStackTrace();}
	}
	
	//localhost:8180/jsp/jdbc/dbcp.jsp
	

%>
	 

</body>
</html>

