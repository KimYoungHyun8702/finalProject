package com.mugs.service.impl.student;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.mugs.dao.CreditDao;
import com.mugs.dao.GraduationCreditDao;
import com.mugs.dao.StudentDao;
import com.mugs.service.student.GraduationManagementService;
import com.mugs.vo.Credit;
import com.mugs.vo.GraduationCredit;
import com.mugs.vo.Users;

@Service
public class GraduationManagementServiceImpl implements GraduationManagementService{
	@Autowired
	CreditDao creditDao;
	@Autowired
	GraduationCreditDao graCreditDao;
	@Autowired
	StudentDao stuDao;
	
	//지역변수로 사용 불가능함.
	private List<Credit> credits;
	
	@Override
	public List<String> getMajorList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String,Object> getCreditByYearAndSemesterAndUsersIdForGraduInfo() {	
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String stuId = users.getUsersId();
		Map<String,Object> creditsAndGraduCredit = new HashMap<String, Object>();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		
		// 로그인된 학생의 학점들을 조회.
		List<Credit> creditForGetYearAndSemester = creditDao.selectAllCreditByStuId(stuId);
		
		for(int i = 0; i<creditForGetYearAndSemester.size(); i++){		
		// 위 학점들의 학기정보, 연도를 가져온다.			
			credits = 		creditDao.selectCreditByYearSemesterAndUsersId(
							creditForGetYearAndSemester.get(i).getCreditYear(),
							creditForGetYearAndSemester.get(i).getCreditSemester(), stuId
							);			
		}
		//학생의 입학연도를 알아온다. 
		GraduationCredit gradCredit = 	graCreditDao.selectGraduationCreditByMajorIdAndUsersId(
										stuDao.selectStudentById(stuId).getMajorId(),
										//Date 데이터를 SimpleDateFormat을 이용해서 yyyy-MM-dd형식으로 변환, 입학연도를 비교한다.
										sd.format((stuDao.selectStudentById(stuId).getStuAdmissionDate())).substring(0,4), stuId);
		
		String gradExamPass = stuDao.selectStuGraduationExam(stuId);
	
		int eduVitAc = 0; //교양필수 이수학점
		int eduSelAc = 0; //교양선택 이수학점
		int mjrVitAc = 0; //전공필수 이수학점
		int mjrSelAc = 0; //전공선택 이수학점
		
		int eduVitAcNeed = 0; //교양필수 필요학점
		int eduSelAcNeed = 0; //교양선택 필요학점
		int mjrVitAcNeed = 0; //전공필수 필요학점
		int mjrSelAcNeed = 0; //전공선택 필요학점
		
		String gradPass = "";

		for(int i = 0; i<credits.size();i++){
			if(credits.get(i).getSubject().getSubjectType().equals("전공필수")){
				mjrVitAc += credits.get(i).getCreditAcquire();
				mjrVitAcNeed = gradCredit.getGradVitalMajorCredit()-mjrVitAc;
				if(mjrVitAcNeed<0)mjrVitAcNeed=0;				
			}
			if(credits.get(i).getSubject().getSubjectType().equals("전공선택")){
				mjrSelAc += credits.get(i).getCreditAcquire();
				mjrSelAcNeed = gradCredit.getGradSelectMajorCredit()-mjrSelAc;
				if(mjrSelAcNeed<0)mjrSelAcNeed=0;
			}
			if(credits.get(i).getSubject().getSubjectType().equals("교양필수")){
				eduVitAc += credits.get(i).getCreditAcquire();
				eduVitAcNeed = gradCredit.getGradVitalEduCredit()-eduVitAc;
				if(eduVitAcNeed<0)eduVitAcNeed=0;			
			}
			if(credits.get(i).getSubject().getSubjectType().equals("교양선택")){
				eduSelAc += credits.get(i).getCreditAcquire();
				eduSelAcNeed = gradCredit.getGradSelectEduCredit()-eduSelAc;
				if(eduSelAcNeed<0)eduVitAcNeed=0;
			}			
		}
		
		if(eduVitAcNeed==0 && eduSelAcNeed ==0 && mjrVitAcNeed==0 && mjrSelAcNeed==0 && gradExamPass.equals("y")){
			gradPass="졸업가능";
		}else{
			gradPass="졸업불가";
		}
					
		creditsAndGraduCredit.put("gradPass",gradPass);
		creditsAndGraduCredit.put("eduVitAcNeed",eduVitAcNeed);
		creditsAndGraduCredit.put("eduSelAcNeed",eduSelAcNeed);
		creditsAndGraduCredit.put("mjrVitAcNeed",mjrVitAcNeed);
		creditsAndGraduCredit.put("mjrSelAcNeed",mjrSelAcNeed);							
		creditsAndGraduCredit.put("mjrVitAc", mjrVitAc);
		creditsAndGraduCredit.put("eduVitAc", eduVitAc);
		creditsAndGraduCredit.put("mjrSelAc", mjrSelAc);
		creditsAndGraduCredit.put("eduSelAc", eduSelAc);
		creditsAndGraduCredit.put("gradCredit", gradCredit);
		creditsAndGraduCredit.put("gradExamPass", gradExamPass);
		return creditsAndGraduCredit;
	}



}

