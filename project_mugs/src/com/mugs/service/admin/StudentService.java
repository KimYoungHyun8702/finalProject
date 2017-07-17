package com.mugs.service.admin;

import java.util.List;
import java.util.Map;

import com.mugs.vo.AcademicProbation;
import com.mugs.vo.CreditGiveUp;
import com.mugs.vo.LeaveReturnApplication;
import com.mugs.vo.Student;
import com.mugs.vo.Users;

public interface StudentService {

	/**
	 * 학생 등록 메소드
	 * @param users
	 * @param student
	 * @return
	 * @throws Exception 
	 */
	String insertStudent(Users users, Student student, String role) throws Exception;
	
	/**
	 * 학생 수정 메소드
	 * @param users
	 * @param student
	 * @return
	 */
	String updateStudent(Users users, Student student);
	
	/**
	 * 학생 제거 메소드
	 * @param usersId
	 * @return
	 */
	String deleteStudent(String usersId);
	
	/**
	 * 학생 전체 조회 메소드
	 * @param usersName
	 * @return
	 */
	List<Student> selectStudentByName(String usersName);
	
	/** 
	 * 매개변수로 proId를 받아 해당하는 교수 조회 메소드
	 * @param proId
	 * @return
	 */
	Map selectStudentInfoById(String stuId);
	
	/**
	 * 학생 등록하기 위한 메소드
	 * @return
	 */
	Map<String,Object> selectForInsertStudent();
	
	/**
	 * 매개변수로 usersId를 받아 해당하는 수정하기 위한 학생 정보를 조회하는 메소드
	 * @param usersId
	 * @return
	 */
	Map selectStudentForupdate(String usersId);
	
	/**
	 * 학번 중복 검사를 위한 Users전체 조회 리스트
	 * @return
	 */
	List<Users> selectUsersList(String usersId);
	
	/**
	 * 학점 포기 현황 전체 조회 리스트
	 * @return
	 */
	List<CreditGiveUp> selectCreditGiveUpList();
	
	/**
	 * 휴.복학 신청 현황 전체 조회 리스트
	 * @return
	 */
	List<LeaveReturnApplication> selectLeaveReturnApplicationList();
	
	/**
	 * 학점 포기 승인하는 메소드
	 * @param creditGiveUp
	 * @return
	 */
	void approveCreditGiveUp(int creditGiveUpId);
	
	/**
	 * 학점 포기 거절하는 메소드
	 * @param creditGiveUpId
	 */
	void refuseCreditGiveUp(int creditGiveUpId);
	
	/**
	 * 휴.복학 신청 승인 메소드
	 * @param LRApplicationId
	 */
	void approveLeaveReturnApplication(int LRApplicationId);
	
	/**
	 * 휴.복학 신청 거절 메소드
	 * @param LRApplicationId
	 */
	void refuseLeaveReturnApplication(int LRApplicationId);
	
	/**
	 * 학사경고 3번 이상 받은 학생 조회 메소드
	 * @param stuId
	 * @return
	 */
	Map selectForExpel();
	
	/**
	 * 제적 처리하는 메소드
	 * @param usersId
	 */
	void expelProbation(String usersId);
	
}
