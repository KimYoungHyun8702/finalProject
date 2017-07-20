package com.mugs.controller.professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.professor.AddStudentGradeService;
import com.mugs.service.professor.SubjectPlanService;
import com.mugs.vo.AcademicProbation;
import com.mugs.vo.Course;
import com.mugs.vo.Credit;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/professor/")
public class AddStudentGradeController{

	private static final Exception Exception = null;
	@Autowired
	private SubjectPlanService service;
	@Autowired
	private AddStudentGradeService service2;
	
	@RequestMapping("searchSubjectList") 
	@ResponseBody
	public List<ProfessorSubject> getProfessorSubjectList(){
		Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = users.getUsersId();
		//Business Logic 호출	
		List<ProfessorSubject> list = service.getProfessorSubjectInfoByJoin(id);
		/*for(int i=0;i<list.size();i++){
			System.out.println(list.get(i));
		}*/
		return list;
	}
	
	@RequestMapping("searchCourseByThreeId") 
	@ResponseBody
	public List<Course> getCourse(int courseYear, String courseSemester, int subjectId){
		System.out.println("-----------------searchCourseByThreeId  TEST -------------------");
		System.out.println(courseYear + courseSemester + subjectId);
		//System.out.println(planYear+planSemester+subjectId+proId);
		List<Course> courseList = service2.getCourseByThreeId(courseYear, courseSemester, subjectId);
	/*	for(Course c : courseList){
			System.out.println(c.getCount());
		}*/
		return courseList;
		
	}
	
	@RequestMapping("registerCredit") 
	@ResponseBody
	public Credit registerCredit(@ModelAttribute Credit credit)throws Exception{
		/*System.out.println("-----------객체 확인용-----------");
		System.out.println(credit);*/
		//성적이 등록되었는지 조회하는 메소드
		Credit check = service2.getCreditByFourId(credit.getCreditYear(),credit.getCreditSemester(),credit.getStuId(),credit.getSubjectId());
		//만약 등록되어 있지 않다면
		if(check==null){
			//하나의 성적을 등록한다
			service2.addCredit(credit);
			//학점테이블로부터 한 학생의 해당 년,학기 학점의 평균을 가져온다.
			double avg = service2.getCreditAvgByThreeId(credit.getCreditYear(),credit.getCreditSemester(),credit.getStuId());
			/*System.out.println("---------------------등록 후 평균 확인---------------");
			System.out.println(avg);*/
			//만약 학년 평균이 1.0 이하라면 
		if(avg<=1.0){
				//해당 년,월에 학사경고가 등록되어 있는지 조회한다.
				AcademicProbation academicProbation = service2.getAcademicProbationByThreeId(credit.getCreditYear(), credit.getCreditSemester(), credit.getStuId());
			/*	System.out.println("--------------학사경고 조회여부 확인(1.0이하)-------------");
				System.out.println(academicProbation);*/
				//만약 학사경고내역이 없다면 
				if(academicProbation==null){
					System.out.println("들어오는지");
					//학사경고를 등록한다.
					/*System.out.println("----------------학사경고 등록 여부 확인------------------");*/
					AcademicProbation newAp = new AcademicProbation(credit.getCreditYear(),credit.getCreditSemester(),avg,credit.getStuId());
					/*System.out.println(newAp);*/
					service2.addAcademicProbation(newAp);
				}
			}else{
				//해당 년,월에 학사경고가 등록되어 있는지 조회한다.
				AcademicProbation academicProbation = service2.getAcademicProbationByThreeId(credit.getCreditYear(), credit.getCreditSemester(), credit.getStuId());
			/*	System.out.println("--------------학사경고 조회여부 확인(1.0이상)-------------");
				System.out.println(academicProbation);*/
				//만약 학사경고내역이 있다면 
				if(academicProbation!=null){
					//학사경고 내역을 삭제한다.
					service2.removeAcademicProbationByThreeId(credit.getCreditYear(), credit.getCreditSemester(), credit.getStuId());
				/*	System.out.println("---------------삭제도달-------------");*/
				}
			}
			return credit;
		//만얃 등록되어있다면	
		}else{
			throw Exception;
		}		
	}
	
	@RequestMapping("renewCredit") 
	@ResponseBody
	public String renewCredit(@ModelAttribute Credit credit){
		//하나의 학점을 수정한다.
		service2.setCreditByFourId(credit);	
		//학점테이블로부터 한 학생의 해당 년,학기 학점의 평균을 가져온다.
		double avg = service2.getCreditAvgByThreeId(credit.getCreditYear(),credit.getCreditSemester(),credit.getStuId());
		/*System.out.println("---------------------수정 후 평균 확인---------------");
		System.out.println(avg);*/
		//만약 학년 평균이 1.0 이하라면
		if(avg<=1.0){
			//해당 년,월에 학사경고가 등록되어 있는지 조회한다.
			AcademicProbation academicProbation = service2.getAcademicProbationByThreeId(credit.getCreditYear(), credit.getCreditSemester(), credit.getStuId());
		/*	System.out.println("--------------학사경고 조회여부 확인(1.0이하)-------------");
			System.out.println(academicProbation);*/
			//만약 학사경고내역이 없다면 
			if(academicProbation==null){
				//학사경고를 등록한다.
				AcademicProbation newAp = new AcademicProbation(credit.getCreditYear(),credit.getCreditSemester(),avg,credit.getStuId());
				service2.addAcademicProbation(newAp);
			}
		}else{
			//해당 년,월에 학사경고가 등록되어 있는지 조회한다.
			AcademicProbation academicProbation = service2.getAcademicProbationByThreeId(credit.getCreditYear(), credit.getCreditSemester(), credit.getStuId());
	/*		System.out.println("--------------학사경고 조회여부 확인(1.0이상)-------------");
			System.out.println(academicProbation);*/
			//만약 학사경고내역이 있다면 
			if(academicProbation!=null){
				//학사경고 내역을 삭제한다.
				service2.removeAcademicProbationByThreeId(credit.getCreditYear(), credit.getCreditSemester(), credit.getStuId());
			}
		}
		
		return "professor/addStudentGrade.tiles";
	}
	@RequestMapping("addStudentGrade")
	public ModelAndView addStudentGrade(){
		return new ModelAndView("professor/addStudentGrade.tiles","check",service2.getCalendarCheck());
	}
}
