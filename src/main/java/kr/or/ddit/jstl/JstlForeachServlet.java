package kr.or.ddit.jstl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.student.model.StudentVo;
import kr.or.ddit.student.service.StudentService;
import kr.or.ddit.student.service.StudentServiceInf;

/**
 * Servlet implementation class JstlForeachServlet
 */
@WebServlet("/jstlForeachServlet")
public class JstlForeachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.studnetService.selectAllStudents()
		//2.request 객체에 list 데이터 저장 (studnetList)
		//3.foreach.jsp로 forward
		
		//데이터 조회
		StudentServiceInf studnetService = new StudentService();
		List<StudentVo> studentList = studnetService.selectAllStudents();
		
		request.setAttribute("studentList", studentList);

		//foreach를 이용한 map 데이터 조회
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", "brown");
		map.put("alias", "곰");
		map.put("id", "5");
		
		request.setAttribute("map", map);
		
		//forTokens를 이용한 데이터 조회
		request.setAttribute("lineRangers", "brown,cony,sally,james,moon");
		
		//view 위임
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/jstl/foreach.jsp");
		rd.forward(request, response);
	}
}







