package com.mugs.service.impl.student;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.AcademicCalendarDao;
import com.mugs.dao.CourseDao;
import com.mugs.dao.EvaluationAnswerDao;
import com.mugs.dao.EvaluationDao;
import com.mugs.service.student.EvaluationManagementService;
import com.mugs.vo.Evaluation;
import com.mugs.vo.EvaluationAnswer;

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

	//평가응답테이블
	@Override
	public List<EvaluationAnswer> getEvaluationValueList(String loginId) {
		Date date = new Date();
		String nowSemester = academicCalendarDaoImpl.selectCalendarName(date);
		System.out.println("일정명 조회 : "+nowSemester);
		System.out.println("로그인한 아이디 : " + loginId);
		int nowYear = date.getYear() + 1900;
		// int nowMonth = date.getMonth();//-1해줘야 함
		//String nowSemester = "1학기";// 학기는 원래 여기서 해주지 않고 디비를 통해서 서비스에서 가져오는 건데 일단 이렇게

		// 현재년도와 현재 월을 전달함으로써 몇학기인지가 조회되는 메소드 - 학사일정테이블 필요
		// String nowSemester = courseDaoImpl.selectHackGiIlJung(nowMonth);
		// String nowSemester = nowMonth+"학기";
		
		//평가응답리스트 조회하는 메소드
		List<EvaluationAnswer> evaluationAnswerValueList = evaluationAnswerDaoImpl.selectEvaluationAnswerValueList(loginId, nowYear, nowSemester);

		System.out.println("서비스임플확인 : " +evaluationAnswerValueList);
		return evaluationAnswerValueList;
	}

	//평가테이블
	@Override
	public List<EvaluationAnswer> addEvaluationAnswerValue(int evaluationTaskPoint, int evaluationExamPoint, int evaluationReadyPoint, 
										 int evaluationPassionPoint, int evaluationQuestionPoint ,int nowYear, 
										 String nowSemester, String loginId, int subjectId, String proId) {
		Evaluation evaluation = new Evaluation(0, nowYear, nowSemester, evaluationTaskPoint, evaluationExamPoint, evaluationReadyPoint, evaluationPassionPoint, evaluationQuestionPoint, proId, subjectId);
		
		//int nowYear = date.getYear() + 1900;
		// int nowMonth = date.getMonth();//-1해줘야 함
		//String nowSemester = "1학기";// 학기는 원래 여기서 해주지 않고 디비를 통해서 서비스에서 가져오는 건데 일단 이렇게

		// 현재년도와 현재 월을 전달함으로써 몇학기인지가 조회되는 메소드 - 학사일정테이블 필요
		// String nowSemester = courseDaoImpl.selectHackGiIlJung(nowMonth);
		// String nowSemester = nowMonth+"학기";
		System.out.printf("설문응답점수주는 페이지-서비스임플에서 테스트 - 과제점수:%d, 년도:%d, 학기:%s, 로그인아이디:%s, 과목아이디:%s, 교수아이디:%s", evaluationTaskPoint, nowYear, nowSemester, loginId, subjectId, proId);
		//evaluationDaoImpl.insertEvaluationAnswerValue(evaluationTaskPoint, evaluationExamPoint, evaluationReadyPoint, evaluationPassionPoint, evaluationQuestionPoint, nowYear, nowSemester, loginId, subjectId, proId);
		
		//평가테이블 - 평가정보 인서트
		evaluationDaoImpl.insertEvaluation(evaluation);		
		
		//평가응답테이블, 평가응답상태(N->Y)로 update하는 dao메소드 호출 - 서비스에서 dao메소드 두개 호출이 가능함.
		ArrayList<Object> evaluationAnswerState = evaluationAnswerDaoImpl.updateEvaluationAnswerState(nowYear, nowSemester, loginId, subjectId);
		System.out.println("응답y로 업데이트 하고 매개변수4개 리스트로 들어왔나 확인 - 평가응답상태여부 조회하기 위해 필요한 매개변수임 : " + evaluationAnswerState);
		
		
		List<EvaluationAnswer> evaluationAnswerValueList = evaluationAnswerDaoImpl.selectEvaluationAnswerValueList(loginId, nowYear, nowSemester);

		System.out.println("서비스임플확인 : " +evaluationAnswerValueList);
		return evaluationAnswerValueList;
		
		
		
		
		
		
	/*	int nYear =  (int) evaluationAnswerState.get(0);
		String nSemester = (String) evaluationAnswerState.get(1);
		String nowId = (String) evaluationAnswerState.get(2);
		int subjctId = (int) evaluationAnswerState.get(3);
		HashMap params = new HashMap();
		params.put("nowYear", evaluationAnswerState.get(0));
		params.put("nowSemester", evaluationAnswerState.get(1));
		params.put("loginId", evaluationAnswerState.get(2));
		params.put("stuId", evaluationAnswerState.get(3));
		
		//평가응답상태여부 재 조회하기 위해 필요한 조회메소드임.
		List<EvaluationAnswer> getReEvaluationAnswerValue = evaluationAnswerDaoImpl.selectEvaluationAnswerValue(nYear, nSemester, nowId, subjctId);
		System.out.println("마지막셀렉트 : " + getReEvaluationAnswerValue);

		
		return getReEvaluationAnswerValue;*/
	}

	@Override
	public String getEvaluationPeriod() {
		System.out.println("설문응답기간조회 서비스임플로 이동완료");
		Date date = new Date();
		System.out.println(date);
		//일정명을 조회하는 dao메소드 호출 후, 일정명을 변수에 담음. 이 변수를 컨트롤러로 보내게 됨
		String evaluationPeriodResult = academicCalendarDaoImpl.selectCalendarName(date);
		System.out.println("설문응답기간을 위한 학사일정명 조회완료 - 조회한 학사일정명 :"+evaluationPeriodResult);
		/*if(evaluationPeriodResult.equals("1학기 중간고사 설문응답기간")) {
			System.out.println("1학기중간고사설문응답기간이라구");
			//return "contents/student/evaluationAnswer/evaluationAnswerView";
			return "/project_mugs/student/selectEvaluationAnswerValueList.do";
		}
		else if(evaluationPeriodResult.equals("1학기 기말고사 설문응답기간")) {
			//return "contents/student/evaluationAnswer/evaluationAnswerView";
			return "/project_mugs/student/selectEvaluationAnswerValueList.do";
		}
		else if(evaluationPeriodResult.equals("2학기 중간고사 설문응답기간")) {
			//return "contents/student/evaluationAnswer/evaluationAnswerView";
			return "student/selectEvaluationAnswerValueList.do";
		}
		else if(evaluationPeriodResult.equals("2학기 기말고사 설문응답기간")) {
			//return "contents/student/evaluationAnswer/evaluationAnswerView";
			return "student/selectEvaluationAnswerValueList.do";
		}
		System.out.println("왜 설문응답하는 jsp로 이동이안되지");*/
		return evaluationPeriodResult;
	}

}
