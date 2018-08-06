package kr.or.ddit.student.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.student.model.StudentVo;

public interface StudentDaoInf {
	
	/**
	* Method : selectAllStudents
	* 최초작성일 : 2018. 7. 9.
	* 작성자 : SAM
	* 변경이력 :
	* @return
	* Method 설명 : 전체 학생 정보를 조회한다
	*/
	List<StudentVo> selectAllStudents();
	
	/**
	* Method : getStudent
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* @param id
	* @return
	* Method 설명 : 학생 정보 조회
	*/
	StudentVo getStudent(int id);
	
	/**
	* Method : getStudent
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* @param id
	* @return
	* Method 설명 : 학생 정보 조회
	*/
	StudentVo getStudent(StudentVo studentVo);
	
	
	/**
	* Method : getStudentPageList
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 학생 페이지 리스트 조회
	*/
	List<StudentVo> getStudentPageList(Map<String, Integer> map);

	/**
	* Method : getStudentTotCnt
	* 최초작성일 : 2018. 7. 11.
	* 작성자 : SAM
	* 변경이력 :
	* @return
	* Method 설명 : 학생 전체 건수 조회
	*/
	int getStudentTotCnt();
	
	/**
	* Method : studentUpdate
	* 최초작성일 : 2018. 7. 17.
	* 작성자 : SAM
	* 변경이력 :
	* @param studentVo
	* @return
	* Method 설명 : 학생 정보 업데이트
	*/
	int studentUpdate(StudentVo studentVo);
}













