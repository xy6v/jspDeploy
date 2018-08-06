package kr.or.ddit.servlet;

import java.io.IOException; 
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
* BasicServlet.java
*
* @author SAM
* @since 2018. 7. 2.
* @version 1.0
* @see
*
* <pre>
* << 개정이력(Modification Information) >>
*
* 수정일 수정자 수정내용
* ---------- ------ ------------------------
* 2018. 7. 2. SAM 최초 생성
*
* </pre>
*/
public class BasicServlet extends HttpServlet{ 
	@Override
	public void destroy() {
		System.out.println("destroy   ");
	}

	@Override
	public void init() throws ServletException {
		System.out.println("init ");
	}

	/**
	* Method : doGet
	* 최초작성일 : 2018. 7. 2.
	* 작성자 : SAM
	* 변경이력 :
	* @param req
	* @param resp
	* @throws ServletException
	* @throws IOException
	* Method 설명 : 현재 날짜를 출력
	*/
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		PrintWriter pw = resp.getWriter();
		Date dt = new Date();
		
		System.out.println("test : " + getServletConfig().getInitParameter("test"));
		
		pw.write("hello servlet world");
		pw.write("current time : " + dt.toString());
		pw.close();
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
