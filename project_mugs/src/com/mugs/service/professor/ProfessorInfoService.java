package com.mugs.service.professor;

import com.mugs.vo.Professor;
import com.mugs.vo.Users;



public interface ProfessorInfoService {
	
	/**
	 * proId로 교수 개인-학적 정보 조회
	 * user와 조인관계에 있다
	 * @param proId
	 * @return
	 */
	Professor getProfessorInfoByJoin(String proId);
	
	/**
	 * 교수 개인 정보 수정
	 * Users 테이블에 교수 개인의 정보를 수정한다 (등록은 관리자로부터 ID와 기본정보를 부여받는다.)
	 * @param users 수정할 교수 개인 정보
	 */
	void updateProfessorInfo(Users users);
}
