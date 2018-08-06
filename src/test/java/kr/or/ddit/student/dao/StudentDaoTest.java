package kr.or.ddit.student.dao;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.student.model.StudentVo;

import org.junit.Before;
import org.junit.Test;

public class StudentDaoTest {
	
	//@Before --> @Test --> @After
	
	//테스트 메소드안에 중복되는 내용 : StudentDao 구현체에 대한 생성 로직
	// --> @Before 어노테이션이 붙은 setup 메소드에 위임
	//모든 테스트 메소드에서 StudentDao 객체를 참조할수 있게끔 클래스 변수로 생성할 필요가 있고 (O)
	//클래스 변수를 setup메소드에서 초기화하는 로직이 필요(O)
	//테스트 메소드에서 StudentDao를 생성하는 로직은 삭제(O)
	
	private StudentDaoInf studentDao;
	
	@Before
	public void setup(){
		studentDao = new StudentDao();
	}
	
	/**
	* Method : selectAllStudentsTest
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* Method 설명 : 전체 학생 정보를 조회한다
	*/
	@Test
	public void selectAllStudentsTest() {
		/***Given***/
		
		/***When***/
		List<StudentVo> studentList = studentDao.selectAllStudents();
		
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
		StudentVo studentVo = studentDao.getStudent(id);

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
		StudentVo studentVo = studentDao.getStudent(paramVo);

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
		List<StudentVo> pageList = studentDao.getStudentPageList(map);

		/***Then***/
		assertEquals(10, pageList.size());
	}
	
	/**
	* Method : getStudentPageListTest2
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* Method 설명 : 학생 페이지 리스트 조회 (3페이지-5건) 테스트
	*/
	@Test
	public void getStudentPageListTest2(){
		/***Given***/
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", 3);
		map.put("pageSize", 10);
		
		/***When***/
		List<StudentVo> pageList = studentDao.getStudentPageList(map);

		/***Then***/
		assertEquals(5, pageList.size());
	}
	
	/**
	* Method : getStudentTotCntTest
	* 최초작성일 : 2018. 7. 11.
	* 작성자 : SAM
	* 변경이력 :
	* Method 설명 : 학생 전체 건수 조회
	*/
	@Test
	public void getStudentTotCntTest(){
		/***Given***/
		
		/***When***/
		int cnt = studentDao.getStudentTotCnt();

		/***Then***/
		assertEquals(25, cnt);
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
		int updateCnt = studentDao.studentUpdate(studentVo);

		/***Then***/
		assertEquals(1, updateCnt);

	}

}







