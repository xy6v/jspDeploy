package kr.or.ddit.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.student.dao.StudentDao;
import kr.or.ddit.student.dao.StudentDaoInf;
import kr.or.ddit.student.model.StudentVo;

public class StudentService implements StudentServiceInf {

	/**
	* Method : selectAllStudents
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* @return
	* Method 설명 : 학생 정보 전체 조회
	*/
	@Override
	public List<StudentVo> selectAllStudents() {
		StudentDaoInf studentDao = new StudentDao();
		return studentDao.selectAllStudents();
	}

	/**
	* Method : getStudent
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* @param id
	* @return
	* Method 설명 : 학생 정보 조회
	*/
	@Override
	public StudentVo getStudent(int id) {
		StudentDaoInf studentDao = new StudentDao();
		return studentDao.getStudent(id);
	}

	/**
	* Method : getStudent
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* @param studentVo
	* @return
	* Method 설명 : 학생 정보 조회
	*/
	@Override
	public StudentVo getStudent(StudentVo studentVo) {
		StudentDaoInf studentDao = new StudentDao();
		return studentDao.getStudent(studentVo);
	}

	/**
	* Method : getStudentPageList
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 학생 정보 페이지 리스트 조회
	*/
	@Override
	public Map<String, Object> getStudentPageList(Map<String, Integer> map) {
		StudentDaoInf studentDao = new StudentDao();
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//학생 페이지 리스트 조회
		List<StudentVo> pageList = studentDao.getStudentPageList(map);
		resultMap.put("pageList", pageList);
		
		//학생 전체 건수 조회
		int totCnt = studentDao.getStudentTotCnt();
		resultMap.put("totCnt", totCnt);
		
		//페이지 네비게이션 html 생성
		int page = map.get("page");
		int pageSize = map.get("pageSize");
		
		resultMap.put("pageNavi", makePageNvai(page, pageSize, totCnt));
		
		return resultMap;
	}
	
	/**
	* Method : makePageNvai
	* 최초작성일 : 2018. 7. 11.
	* 작성자 : SAM
	* 변경이력 :
	* @param page
	* @param pageSize
	* @param totCnt
	* @return
	* Method 설명 : 페이지 네비게이션 문자열 생성
	*/
	private String makePageNvai(int page, int pageSize, int totCnt){
		int cnt = totCnt / pageSize;		//몫
		int mod = totCnt % pageSize;		//나머지
		
		if (mod > 0 )
			cnt++;
		
		StringBuffer pageNaviStr = new StringBuffer();
		
		int prevPage = page == 1 ? 1 : page-1;
		int nextPage = page == cnt ? page : page + 1;
		pageNaviStr.append("<li><a href=\"/studentList?page=" + prevPage +
						"&pageSzie="+ pageSize + "\" aria-label=\"Previous\">"
						+ "<span aria-hidden=\"true\">&laquo;</span></a></li>");
		
		for(int i = 1; i <= cnt; i++){
			///studentList?page=3&pageSize=10
			String activeClass = "";
			if( i == page )
				activeClass = "class=\"active\"";
				
			pageNaviStr.append("<li " + activeClass + "><a href=\"/studentList?page=" + i +
								"&pageSize="+ pageSize + "\">" + i + "</a></li>");
		}

		pageNaviStr.append("<li><a href=\"/studentList?page=" + nextPage +
							"&pageSize=" + pageSize + "\" aria-label=\"Next\">"+
							"<span aria-hidden=\"true\">&raquo;</span></a></li>");
		
		return pageNaviStr.toString();
	}
	
	/**
	* Method : studentUpdate
	* 최초작성일 : 2018. 7. 17.
	* 작성자 : SAM
	* 변경이력 :
	* @param studentVo
	* @return
	* Method 설명 : 학생정보 업데이트
	*/
	@Override
	public int studentUpdate(StudentVo studentVo) {
		StudentDaoInf studentDao = new StudentDao();
		return studentDao.studentUpdate(studentVo);
	}
}









