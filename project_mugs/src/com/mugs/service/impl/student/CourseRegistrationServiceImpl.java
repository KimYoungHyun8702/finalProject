package com.mugs.service.impl.student;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.AcademicCalendarDao;
import com.mugs.dao.CollegeDao;
import com.mugs.dao.CourseDao;
import com.mugs.dao.CreditDao;
import com.mugs.dao.EvaluationAnswerDao;
import com.mugs.dao.MajorDao;
import com.mugs.dao.ProfessorDao;
import com.mugs.dao.ProfessorSubjectDao;
import com.mugs.dao.StandardDao;
import com.mugs.dao.StudentDao;
import com.mugs.dao.SubjectDao;
import com.mugs.service.student.CourseRegistrationService;
import com.mugs.vo.AcademicCalendar;
import com.mugs.vo.College;
import com.mugs.vo.Course;
import com.mugs.vo.Credit;
import com.mugs.vo.EvaluationAnswer;
import com.mugs.vo.Major;
import com.mugs.vo.Professor;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.Standard;
import com.mugs.vo.Student;
import com.mugs.vo.Subject;

@Service
public class CourseRegistrationServiceImpl implements CourseRegistrationService {

   @Autowired
   private CollegeDao collegeDaoImpl;

   @Autowired
   private SubjectDao subjectDaoImpl;

   @Autowired
   private MajorDao majorDaoImpl;

   @Autowired
   private CourseDao courseDaoImpl;
	
   @Autowired
   private ProfessorDao professorDaoImpl;
	
   @Autowired
   private ProfessorSubjectDao professorSubjectDaoImpl;
	
   @Autowired
   private StandardDao standardDaoImpl;
	
   @Autowired
   private StudentDao studentDaoImpl;
	
   @Autowired
   private CreditDao creditDaoImpl;
	
   @Autowired
   private AcademicCalendarDao academicCalendarDaoImpl;
	
   @Autowired
   private EvaluationAnswerDao evaluationAnswerDaoImpl;
	
	/**
	 * 현재 대학교에 존재하는 모든 단과대학(학부)
	 * 의 정보를 리트스테 담아서 리턴하는 역할을 하는 메소드
	 * 
	 * By Beak.J.H
	 */
	@Override
	public HashMap<String, Object> findCollegeList(String subjectType, String stuId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
		int nowYear = new Date().getYear() + 1900;
		String dateStr = dataFormat.format(new Date());
		
		String semester = null;
		
		if(subjectType.equals("선택교양")) {
			List<AcademicCalendar> academicCalendarList = 
					academicCalendarDaoImpl.selectCalendarByDate(dateStr);
			for(int i = 0; i < academicCalendarList.size(); i++) {
				if(academicCalendarList.get(i).getCalendarName().contains("학기") && 
						academicCalendarList.get(i).getCalendarName().length() < 5) {
					semester = academicCalendarList.get(i).getCalendarName();
				}
			}
			
			List<ProfessorSubject> professorSubjectList = professorSubjectDaoImpl.selectProfessorSubjectListByJoinMajorNull(nowYear, semester, subjectType);
			
			List<Credit> myCourseList = creditDaoImpl.selectAllCreditByStuId(stuId);
			
			for(int i = 0; i < professorSubjectList.size(); i++) {
				if(myCourseList.size() == 0) {
					professorSubjectList.get(i).getSubject().setRecourse("N");
				} else {
					for(int j = 0; j < myCourseList.size(); j++) {
						if(professorSubjectList.get(i).getSubjectId() == myCourseList.get(j).getSubjectId()) {
							professorSubjectList.get(i).getSubject().setRecourse("Y");
						} else {
							professorSubjectList.get(i).getSubject().setRecourse("N");
						}
					}
				}
			}
			
			map.put("professorSubjectList", professorSubjectList);
			return map;
		}
		
		List<College> collegeList = collegeDaoImpl.selectCollegeList();
		map.put("collegeList", collegeList);
		return map;
	}


   
   
   /**
    * 수강신청 탭을 눌렀을 때 오늘 날짜가 수강신청 기간이면 
    * 대분류인 이수구분과 현재 학기를 리스트에 담아서 리턴
    * 현재 수강신청 기간이 아니면 수강신청기간이 아니라는 메시지를 리턴
    * 
    * By Baek.J.H
    */
   @Override
   public HashMap<String, Object> getSubjectTypeMap(String stuId) {
      // TODO Auto-generated method stub
      HashMap<String, Object> map = new HashMap<>();
      SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
      
      String dateStr = dataFormat.format(new Date());
      
      List<AcademicCalendar> academicCalendarList = 
            academicCalendarDaoImpl.selectCalendarByDate(dateStr);
      
      String msg = null;
      String semester = null;
      String term = null;
      Integer nowYear = new Date().getYear() + 1900;
      Student student = studentDaoImpl.selectStudentById(stuId);
      String stuRegister = student.getStuRegisterState();
      int stuMajorId = student.getMajorId();
      
      Date date = student.getStuAdmissionDate();
      
      String formatDate = dataFormat.format(date);
      String admissionYear = formatDate.substring(0, 4);
      
      Standard standard = standardDaoImpl.selectStandardById(Integer.parseInt(admissionYear), stuMajorId);
      
      if(academicCalendarList.size() != 0) {
         for(int i = 0; i < academicCalendarList.size(); i++) {
            if(academicCalendarList.get(i).getCalendarName().contains("학기") 
                  && academicCalendarList.get(i).getCalendarName().length() < 5) {
               semester = academicCalendarList.get(i).getCalendarName();
            } else if(academicCalendarList.get(i).getCalendarName().contains("수강신청")) {
               term = academicCalendarList.get(i).getCalendarName();
            } 
         }
      }
      
      if(!stuRegister.equals("휴학") && !stuRegister.equals("군휴학")) {
         if(term == null) {
            msg = "수강신청 기간이 아닙니다.";
            map.put("msg", msg);
         } else {
            map.put("myCourseList", courseDaoImpl.selectMyCourseList(stuId, nowYear, semester));
            map.put("subjectTypeList", subjectDaoImpl.selectSubjectTypeList());
            map.put("nowYear", nowYear);
            map.put("semester", semester);
            map.put("stuRegister", stuRegister);
            map.put("msg", "");
            map.put("standard", standard);
         }
      } else {
         map.put("stuRegister", stuRegister);
      }
      
      return map;
   }

   @Override
      public List<College> getCollegeList() {
         // TODO Auto-generated method stub
         return collegeDaoImpl.selectCollegeList();
      }
   
   
   
   @Override
   public List<Major> findMajorListByCollegeId(int collegeId) {
      // TODO Auto-generated method stub
      return majorDaoImpl.selectMajorByCollegeId(collegeId);
   }

   @Override
   public HashMap<String, Object> findMyCourseListByJoin(String loginId) {
      // 여기서 년도랑 학기를 뽑아오는 메소드를 호출해서 지금년도, 지금학기와 비교하여... 해당학기, 해당년도를 조회한다.
	  HashMap<String, Object> map = new HashMap<>();
	  Date date = new Date();
      int nowYear = date.getYear() + 1900;
      String nowSemester = "";
      String courseMessage = null;
      String stuRegister = studentDaoImpl.selectStudentById(loginId).getStuRegisterState();
      
      List<String> semesterList = academicCalendarDaoImpl.selectCalendarName(date);
      for(int i = 0; i < semesterList.size(); i++) {
         if(semesterList.get(i).contains("학기") && semesterList.get(i).length() < 5) {
            nowSemester = semesterList.get(i);
         }
      }
      
      if (!stuRegister.equals("휴학")) {
          if (nowSemester == null) {
             courseMessage = "현재 수강하고 있는 과목이 없습니다.";
             map.put("courseMessage", courseMessage);
          } else {

        	 List<Course> myCourseList = courseDaoImpl.selectMyCourseListByJoin(loginId, nowYear, nowSemester);

             map.put("myCourseListResult", myCourseList);
             map.put("courseMessage", ""); 
          }
       } else {
          map.put("stuRegisterMyCourse", stuRegister);
       }
      
      return map;
   }

   @Override
   public List<Standard> findYearListByMajorId(int majorId) {
      List<Standard> yearList = standardDaoImpl.selectYearListByMajorId(majorId);
      return yearList;
   }

   @Override
   public Standard findStandardValue(int collegeId, int majorId, int standardYear) {
      Standard standardValue = standardDaoImpl.selectStandardValue(collegeId, majorId, standardYear);
      return standardValue;
   }

   public Professor selectFullInfoProfessorById(String id) {
      return professorDaoImpl.selectFullInfoProfessorById(id);
   }

   
   
   
   /**
    * 학생ID, 학과ID, 현재연도, 학기, 이수구분을 매개변수로 받아
    * 해당연도, 학기에 해당학과에서 개설한 해당 이수구분타입의 강의 정보를 리스트에 담는다.
    * 리턴시키기전에 학점테이블에 가서 내가 여태동안 들었던 과목 ID를 받아와서 내가 받아온
    * 강의 정보 list에의 강의ID와 내가 들었던 과목ID 비교해서 ID가 똑같은 재수강 여부를 'Y'
    * 똑같지 않으면 'N'으로 set한다음에 리턴
    * 
    * By Baek.J.H
    */
   
   public HashMap<String, Object> findSubjectListByJoin(int majorId, int nowYear, String semester, String subjectType, String stuId) {
      // TODO Auto-generated method stub
      HashMap<String, Object> map = new HashMap<>();
      List<ProfessorSubject> professorSubjectList = 
            professorSubjectDaoImpl.selectProfessorSubjectListByJoin(majorId, nowYear, semester, subjectType);
      
      List<Credit> myCourseList = creditDaoImpl.selectAllCreditByStuId(stuId);
      
      for(int i = 0; i < professorSubjectList.size(); i++) {
         if(myCourseList.size() == 0) {
            professorSubjectList.get(i).getSubject().setRecourse("N");
         } else {
            for(int j = 0; j < myCourseList.size(); j++) {
               if(professorSubjectList.get(i).getSubjectId() == myCourseList.get(j).getSubjectId()) {
                  professorSubjectList.get(i).getSubject().setRecourse("Y");
               } else {
                  professorSubjectList.get(i).getSubject().setRecourse("N");
               }
            }
         }
      }
      map.put("professorSubjectList", professorSubjectList);

      return map;
   }
   
   /**
    * 수강신청시 로그인한 학생의 재학상태 확인 후 그에 맞는 최대 이수가능 학점
    * 재수강 여부, 해당 신청과목 신청인원 수를 통해 강의 신청여부를 알아보고
    * 신청가능 하면 강의신청, 불가능하면 강의 신청불가능한 이유 메시지 형식으로 리턴
    * 
    * By Baek.J.H
    *
    */
   public HashMap<String, Object> addCourseMySubject(int majorId, String semester, int nowYear, String subjectType, String recourse, String proId, int subjectId, String stuId, String  stuRegister) {
      // TODO Auto-generated method stub
      HashMap<String, Object> map = new HashMap<>();
      
      String msg = null;
      
      Student student = studentDaoImpl.selectStudentById(stuId);
      Subject subject = subjectDaoImpl.selectSubjectById(subjectId);
      
      Date date = student.getStuAdmissionDate();
      int stuMajorId = student.getMajorId();
      
      SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
      
      String dateStr = dataFormat.format(date);
      String admissionYear = dateStr.substring(0, 4);
      
      Standard standard = standardDaoImpl.selectStandardById(Integer.parseInt(admissionYear), stuMajorId);
      
      List<Course>courseList = courseDaoImpl.selectMyCourseList(stuId, nowYear, semester);
      
      int myCreditSum = 0;
      
      for(int i = 0; i < courseList.size(); i++) {
         myCreditSum += courseList.get(i).getSubject().getSubjectCredit();
      }
      
      if(stuRegister.equals("재학") && standard.getStandardMaxCredit() < (myCreditSum + subject.getSubjectCredit())) {
         msg = "최대 이수가능 학점에서 " + (myCreditSum + subject.getSubjectCredit() - standard.getStandardMaxCredit()) + "점이 초과되서 신청할 수 없습니다.";
         map.put("msg", msg);
         return map;
      }
      
      if(stuRegister.equals("졸업유예") && standard.getStandardDelayMaxCredit() < (myCreditSum + subject.getSubjectCredit())) {
         msg = "최대 이수가능 학점에서 " + (myCreditSum + subject.getSubjectCredit() - standard.getStandardDelayMaxCredit()) + "점이 초과되서 신청할 수 없습니다.";
         map.put("msg", msg);
         return map;
      }
      
      if(recourse == "Y") {
         List<Double> creditList = creditDaoImpl.selectCreditScoreBySubjectIdStuId(subjectId, stuId);
         for(int i = 0; i < creditList.size(); i++) {
            if(creditList.get(i) > 1.0) {
               msg = "D+ 이상은 재수강이 불가능합니다.";
               map.put("msg", msg);
               return map;
            }
         }
      } else {
         for(int i = 0; i < courseList.size(); i++) {
            if(courseList.get(i).getSubjectId() == subjectId) {
               msg = "이미 수강신청된 과목입니다.";
               map.put("msg", msg);
               return map;
            }
         }
         
         if(subject.getSubjectCapacity() > subject.getSubjectRequest()) {
        	 if(majorId == 0)  {
        		 courseDaoImpl.insertCourse(new Course(0, nowYear, semester, subjectId, stuId, proId));
        		 evaluationAnswerDaoImpl.insertEvaluationAnswer(new EvaluationAnswer(0, "N", nowYear, semester, stuId, subjectId));
        		 
                 int subjectRequest = courseDaoImpl.selectStudentCount(semester, nowYear, subjectId);
                 
                 subject.setSubjectRequest(subjectRequest);
                 
                 subjectDaoImpl.updateSubjectById(subject);
                 
                 List<ProfessorSubject> professorSubjectList = professorSubjectDaoImpl.selectProfessorSubjectListByJoinMajorNull(nowYear, semester, subjectType);
                 List<Credit> myCourseList = creditDaoImpl.selectAllCreditByStuId(stuId);
                 
                 for(int i = 0; i < professorSubjectList.size(); i++) {
                    if(myCourseList.size() == 0) {
                       professorSubjectList.get(i).getSubject().setRecourse("N");
                    } else {
                       for(int j = 0; j < myCourseList.size(); j++) {
                          if(professorSubjectList.get(i).getSubjectId() == myCourseList.get(j).getSubjectId()) {
                             professorSubjectList.get(i).getSubject().setRecourse("Y");
                          } else {
                             professorSubjectList.get(i).getSubject().setRecourse("N");
                          }
                       }
                    }
                 }
                 
                 map.put("professorSubjectList", professorSubjectList);
                 map.put("courseSubjectList", courseDaoImpl.selectMyCourseList(stuId, nowYear, semester));
        	 } else {
        		 courseDaoImpl.insertCourse(new Course(0, nowYear, semester, subjectId, stuId, proId));
        		 evaluationAnswerDaoImpl.insertEvaluationAnswer(new EvaluationAnswer(0, "N", nowYear, semester, stuId, subjectId));
        		 
                 int subjectRequest = courseDaoImpl.selectStudentCount(semester, nowYear, subjectId);
                 
                 subject.setSubjectRequest(subjectRequest);
                 
                 subjectDaoImpl.updateSubjectById(subject);
                 
                 List<ProfessorSubject> professorSubjectList = professorSubjectDaoImpl.selectProfessorSubjectListByJoin(majorId, nowYear, semester, subjectType);
                 List<Credit> myCourseList = creditDaoImpl.selectAllCreditByStuId(stuId);
                 
                 for(int i = 0; i < professorSubjectList.size(); i++) {
                    if(myCourseList.size() == 0) {
                       professorSubjectList.get(i).getSubject().setRecourse("N");
                    } else {
                       for(int j = 0; j < myCourseList.size(); j++) {
                          if(professorSubjectList.get(i).getSubjectId() == myCourseList.get(j).getSubjectId()) {
                             professorSubjectList.get(i).getSubject().setRecourse("Y");
                          } else {
                             professorSubjectList.get(i).getSubject().setRecourse("N");
                          }
                       }
                    }
                 }
                 
                 map.put("professorSubjectList", professorSubjectList);
                 map.put("courseSubjectList", courseDaoImpl.selectMyCourseList(stuId, nowYear, semester));
        	 }
            
         } else {
            msg = "해당 과목의 수강인원이 꽉 차서 수강신청이 불가능합니다.";
            map.put("msg", msg);
            return map;
         }
      }
      return map;
   }
   
   
   
   
      /**
       * 
       */
      @Override
      public HashMap<String, Object> deleteMySubject(int subjectId, String proId, String semester, int majorId, int nowYear, String stuId, String subjectType) {
         // TODO Auto-generated method stub
         //List
         HashMap<String, Object> map = new HashMap<>();
         courseDaoImpl.deleteCourse(stuId, nowYear, semester, subjectId);
         evaluationAnswerDaoImpl.deleteEvaluationAnswerByEtc(nowYear, semester, stuId, subjectId);
         
         int subjectRequest = courseDaoImpl.selectStudentCount(semester, nowYear, subjectId);
         
         Subject subject = subjectDaoImpl.selectSubjectById(subjectId);
         subject.setSubjectRequest(subjectRequest);
         
         subjectDaoImpl.updateSubjectById(subject);
         
         if(majorId == 0) {
        	 List<ProfessorSubject> professorSubjectList = professorSubjectDaoImpl.selectProfessorSubjectListByJoinMajorNull(nowYear, semester, subjectType);
        			 
        	 List<Credit> myCourseList = creditDaoImpl.selectAllCreditByStuId(stuId);
        	 
        	 for(int i = 0; i < professorSubjectList.size(); i++) {
                 if(myCourseList.size() == 0) {
                    professorSubjectList.get(i).getSubject().setRecourse("N");
                 } else {
                    for(int j = 0; j < myCourseList.size(); j++) {
                       if(professorSubjectList.get(i).getSubjectId() == myCourseList.get(j).getSubjectId()) {
                          professorSubjectList.get(i).getSubject().setRecourse("Y");
                       } else {
                          professorSubjectList.get(i).getSubject().setRecourse("N");
                       }
                    }
                 }
              }
              
              map.put("professorSubjectList", professorSubjectList);
              map.put("courseSubjectList", courseDaoImpl.selectMyCourseList(stuId, nowYear, semester));
         } else {
        	 List<ProfessorSubject> professorSubjectList = professorSubjectDaoImpl.selectProfessorSubjectListByJoin(majorId, nowYear, semester, subjectType);
             List<Credit> myCourseList = creditDaoImpl.selectAllCreditByStuId(stuId);
              
             for(int i = 0; i < professorSubjectList.size(); i++) {
                if(myCourseList.size() == 0) {
                   professorSubjectList.get(i).getSubject().setRecourse("N");
                } else {
                   for(int j = 0; j < myCourseList.size(); j++) {
                      if(professorSubjectList.get(i).getSubjectId() == myCourseList.get(j).getSubjectId()) {
                         professorSubjectList.get(i).getSubject().setRecourse("Y");
                      } else {
                         professorSubjectList.get(i).getSubject().setRecourse("N");
                      }
                   }
                }
             }
             map.put("professorSubjectList", professorSubjectList);
             map.put("courseSubjectList", courseDaoImpl.selectMyCourseList(stuId, nowYear, semester));
         }
         
         return map;
      }
}