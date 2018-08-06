package kr.or.ddit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TimesTableServlet
 */
//localhost:8180/TimesTableServlet
@WebServlet("/TimesTableServlet")
public class TimesTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		pw.write("<!DOCTYPE html>");
		pw.write("<html>");
		pw.write("<head>");
		pw.write("<meta charset=\"UTF-8\">");
		pw.write("<title>Insert title here</title>");
		pw.write("<style>");
		pw.write("	");
		pw.write("	td {");
		pw.write("		border : 1px solid blue ;");
		pw.write("	}");
		pw.write("</style>");
		pw.write("</head>");
		pw.write("<body>");
		pw.write("<table>");
		for(int i = 1; i <= 9; i++){
			pw.write("<tr>");
			for(int j = 2; j <= 9; j++)
				pw.write("<td>"+ j + "*" + i + "=" + j*i + "</td>");
			pw.write("</tr>");
		}
		
		pw.write("</table>");
		pw.write("</body>");
		pw.write("</table>");	
		

	}
}
