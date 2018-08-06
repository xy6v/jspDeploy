package kr.or.ddit.student.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.student.model.StudentVo;

public interface StudentServiceInf {

	/**
	* Method : selectAllStudents
	* 최초작성일 : 2018. 7. 10.
	* 작성자 : SAM
	* 변경이력 :
	* @return
	* Method 설명 : 전체 학생 정보 조회
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
	* Method 설명 : 학생 정보 페이지 조회
	*/
	Map<String, Object> getStudentPageList(Map<String, Integer> map);
	
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
