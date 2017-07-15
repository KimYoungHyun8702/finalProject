package com.mugs.service.impl.student;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.AcademicCalendarDao;
import com.mugs.dao.CourseDao;
import com.mugs.dao.EvaluationAnswerDao;
import com.mugs.dao.EvaluationDao;
import com.mugs.dao.StudentDao;
import com.mugs.service.student.EvaluationManagementService;
import com.mugs.vo.Evaluation;
import com.mugs.vo.EvaluationAnswer;
import com.mugs.vo.Student;

@Service
public class EvaluationManagementServiceImpl implements EvaluationManagementService {

	@Autowired
	private EvaluationAnswerDao evaluationAnswerDaoImpl;
	
	@Autowired
	private EvaluationDao evaluationDaoImpl;
	
	@Autowired
	private CourseDao courseDaoImpl;
	
	@Autowired
	private AcademicCalendarDao academicCalendarDaoImpl;
	
	@Autowired
	private StudentDao studentDaoImpl;


	//평가테이블
	@Override
	public List<EvaluationAnswer> addEvaluationAnswerValue(int evaluationTaskPoint, int evaluationExamPoint, int evaluationReadyPoint, 
										 int evaluationPassionPoint, int evaluationQuestionPoint ,int nowYear, 
										 String nowSemester, String loginId, int subjectId, String proId) {
		Evaluation evaluation = new Evaluation(0, nowYear, nowSemester, evaluationTaskPoint, evaluationExamPoint, evaluationReadyPoint, evaluationPassionPoint, evaluationQuestionPoint, proId, subjectId);
				
		//평가테이블 - 평가정보 인서트
		evaluationDaoImpl.insertEvaluation(evaluation);		
		
		//평가응답테이블, 평가응답상태(N->Y)로 update하는 dao메소드 호출 - 서비스에서 dao메소드 두개 호출이 가능함.
		ArrayList<Object> evaluationAnswerState = evaluationAnswerDaoImpl.updateEvaluationAnswerState(nowYear, nowSemester, loginId, subjectId);

		
		
		List<EvaluationAnswer> evaluationAnswerValueList = evaluationAnswerDaoImpl.selectEvaluationAnswerValueList(loginId, nowYear, nowSemester);

		return evaluationAnswerValueList;
	}

	
	@Override
	public HashMap<String, Object> getEvaluationPeriod(String loginId) {

		HashMap<String, Object> map = new HashMap<>();
		Date nowDate = new Date();	// 오늘 날짜
		// Date date = new Date(System.currentTimeMillis() - 1000*60*60*24*15);	// 15일전 시간
		
		List<String> evaluationPeriodResult = 
				academicCalendarDaoImpl.selectCalendarName(nowDate);	// 오늘 날짜를 기준으로 학사일정명을 뽑아온다.
		
		// List<String> nowSemesterResult = 
				// academicCalendarDaoImpl.selectCalendarName(date); // 오늘로부터 15일전 날짜를 기준으로 학사일정명을 뽑아온다.(직전학기를 뽑아오기 위한것)
		
		
		String msg = null;	// 메세지 담을 메소드
		String nowSemester = null;	// 바로 직전학기 담을 메소드
		Integer nowYear = new Date().getYear() + 1900;	// 현재 연도 추출
		Student student = studentDaoImpl.selectStudentById(loginId); // 현재 로그인한 학생정보를 가져온다.
		String stuRegister = student.getStuRegisterState();	// 지금 로그인한 학생의 재적상태를 담는 메소드
		String term = null;	// 설문응답 학사일정명을 담을 변수명
		
		// 오늘 날짜기준으로 학사일정명을 뽑아온 리스트중에 설문응답 기간이 있으면 trem이라는 메소드에 담는다.
		if(evaluationPeriodResult.size() != 0) {
			for(int i = 0; i < evaluationPeriodResult.size(); i++) {
				if(evaluationPeriodResult.get(i).contains("설문응답")) {
					term = evaluationPeriodResult.get(i);
				}
				
				if(evaluationPeriodResult.get(i).contains("학기") && 
						evaluationPeriodResult.get(i).length() < 5) {
					nowSemester = evaluationPeriodResult.get(i);
				}
			}
		}
		
		// 직전학기를 담는다
		/*if(nowSemesterResult.size() != 0) {
			for(int i = 0; i < nowSemesterResult.size(); i++) {
				if(nowSemesterResult.get(i).contains("학기") && nowSemesterResult.get(i).length() < 5) {
					nowSemester = nowSemesterResult.get(i);
				}
			}
		}*/
		
		
		if(!stuRegister.equals("휴학") && !stuRegister.equals("군휴학")) {
			if(term == null) {
				// 만약 현재 로그인한 학생이 휴학, 군휴학 상태가 아닌 정상적인 재적상태라면에서 현재가 설문응답 기간이 아니면
				// 설문응답이 아니라는 메시지를 담고 map 담는다.
				msg = "지금은 설문응답기간이 아닙니다. 정해진 기간 내에 설문에 응하여 주시기 바랍니다.";
				map.put("alarm", msg);
			} else {
				map.put("evaluationAnswerValueListResult", evaluationAnswerDaoImpl.selectEvaluationAnswerValueList(loginId, nowYear, nowSemester));
				map.put("alarm", "");	// 현재 로그인한 학생이 재적상태도 정상적인 재적상태이고 현재가 설문 응담기간이면 msg "" 공백으로 map 담고
									// 바로 윗줄에서는 설문응답 페이지에서 보여줄 설문응답 리스트를 담는다.
			}
		} else {
			map.put("studentState", stuRegister); // 현재 재적 상태가 휴학 상태이거나, 군휴학 이면 map에 담는다.
		}
		return map;
	}
}

