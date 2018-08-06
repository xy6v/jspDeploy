package kr.or.ddit.student.service;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.student.model.StudentVo;

import org.junit.Before;
import org.junit.Test;

public class StudentServiceTest {

	//@Before --> @Test --> @After

	//테스트 메소드안에 중복되는 내용 : StudentService 구현체에 대한 생성 로직
	// --> @Before 어노테이션이 붙은 setup 메소드에 위임
	//모든 테스트 메소드에서 StudentService 객체를 참조할수 있게끔 클래스 변수로 생성할 필요가 있고
	//클래스 변수를 setup메소드에서 초기화하는 로직이 필요
	//테스트 메소드에서 StudentService를 생성하는 로직은 삭제 
	
	private StudentServiceInf studentService;
	
	@Before
	public void setup(){
		 studentService = new StudentService();
	}
	
	/**
	* Method : selectAllStudentsTest
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* Method 설명 : 전체 학생 정보 조회 테스트
	*/
	@Test
	public void selectAllStudentsTest() {
		/***Given***/

		/***When***/
		List<StudentVo> studentList = studentService.selectAllStudents();
		for(StudentVo vo : studentList)
			System.out.println(vo);

		/***Then***/
		assertEquals(25, studentList.size());
	}
	
	/**
	* Method : getStudentTest
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* Method 설명 : 학생 정보 조회 테스트
	*/
	@Test
	public void getStudentTest(){
		/***Given***/
		int id = 1;

		/***When***/
		StudentVo studentVo = studentService.getStudent(id);

		/***Then***/
		assertEquals(id, studentVo.getId());
		assertEquals("김마음", studentVo.getName());
	}
	
	/**
	* Method : getStudentTest
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* Method 설명 : 학생 정보 조회 테스트
	*/
	@Test
	public void getStudentTestByVo(){
		/***Given***/
		StudentVo paramVo = new StudentVo();
		int id = 1;
		paramVo.setId(id);
		
		/***When***/
		StudentVo studentVo = studentService.getStudent(paramVo);

		/***Then***/
		assertEquals(id, studentVo.getId());
		assertEquals("김마음", studentVo.getName());
	}
	
	/**
	* Method : getStudentPageListTest
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* Method 설명 : 학생 페이지 리스트 조회 테스트
	*/
	@Test
	public void getStudentPageListTest(){
		/***Given***/
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", 2);
		map.put("pageSize", 10);
		
		/***When***/
		Map<String, Object> resultMap = studentService.getStudentPageList(map);
		
		//학생 페이지 리스트
		List<StudentVo> pageList = (List<StudentVo>) resultMap.get("pageList");
		
		//학생 전체 건수
		int totCnt = (int) resultMap.get("totCnt");

		/***Then***/
		assertEquals(10, pageList.size());		//학생 페이지 리스트 건수에 대한 검증
		assertEquals(25, totCnt);				 //학생 전체 건수에 대한 검증
	}
	
	/**
	* Method : calculatePageNavi
	* 최초작성일 : 2018. 7. 11.
	* 작성자 : SAM
	* 변경이력 :
	* Method 설명 : 전체 건수를 인자로 페이지 네비게이션 사이즈를 구하는 테스트
	*/
	@Test
	public void calculatePageNavi(){
		/***Given***/
		int totCnt = 25;
		int pageSize = 10;
		
		int cnt = totCnt / pageSize;		//몫
		int mod = totCnt % pageSize;		//나머지
		
		if (mod > 0 )
			cnt++;
		
		/***When***/
		double naviSize = (totCnt / pageSize);
		System.out.println(Math.ceil(2.5d));
		System.out.println(Math.ceil(((double)totCnt / (double)pageSize)));
		System.out.println(Math.floor(totCnt / pageSize));

		/***Then***/
		assertEquals(3, cnt);
	}
	
	/**
	* Method : studentUpdateTest
	* 최초작성일 : 2018. 7. 17.
	* 작성자 : SAM
	* 변경이력 :
	* Method 설명 : 학생 정보 수정 테스트
	*/
	@Test
	public void studentUpdateTest(){
		/***Given***/
		StudentVo studentVo = new StudentVo();
		studentVo.setId(2);
		studentVo.setName("강병관");
		studentVo.setAddr1("대전광역시 중구 중앙로 76");
		studentVo.setAddr2("영민빌딩 2층 대덕인재개발원");
		studentVo.setZipcd("34940");
		studentVo.setPic("sally.png");
		studentVo.setPicpath("D:\\A_TeachingMaterial\\7.JspSpring\\fileUpload");
		studentVo.setPicname("f255b282-0a8a-4e5a-8cb6-abb4308554b7");
		
		/***When***/
		int updateCnt = studentService.studentUpdate(studentVo);

		/***Then***/
		assertEquals(1, updateCnt);

	}
}






