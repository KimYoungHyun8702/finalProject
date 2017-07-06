package com.mugs.service.impl.student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.CollegeDao;
import com.mugs.dao.MajorDao;
import com.mugs.dao.ProfessorSubjectDao;
import com.mugs.dao.StudentDao;
import com.mugs.dao.SubjectDao;
import com.mugs.dao.UsersDao;
import com.mugs.service.student.StudentIndividualService;
import com.mugs.vo.College;
import com.mugs.vo.Major;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.Student;
import com.mugs.vo.Subject;
import com.mugs.vo.Users;

@Service
public class StudentIndividualServiceImpl implements StudentIndividualService {
	//병문 serviceImpl
	
	@Autowired
	private StudentDao stuDao;
	@Autowired
	private UsersDao userDao;
	@Autowired
	private CollegeDao collegeDao;
	@Autowired
	private MajorDao majorDao;
	@Autowired 
	private SubjectDao subjectDao;
	@Autowired
	private ProfessorSubjectDao proSubDao;
	

	
	@Override
	public void updateStudentHumanInfo(Users users) {	
	System.out.println(users);
	userDao.updateStudentHumanInfo(users);	
	}

 
	@Override
	public Student findStudentInfoById(String stuId) {   		       
	return stuDao.selectStudentAllInfoByJoin(stuDao.selectStudentById(stuId));
	}


	@Override
	public List<College> getCollegeList(){
		return collegeDao.selectCollegeList();
	}

	@Override
	public List<Major> getMajorList(int collegeId) {
		return majorDao.selectMajorByCollegeId(collegeId);
	}


	@Override
	public List<Subject> getSubjectTypeListByMajorId(int majorId) {
		return subjectDao.selectSubjectTypeByMajorId(majorId);
	}


	@Override
	public Map<String,Object> getSubjectBySubjectTypeAndMajorId(Map<String,Object> subTypeAndMajorId) {
		// 교수의 이름을 받아오기 위한 List 
		List<String> proNameList = new ArrayList<String>();		
		// 교수담당과목 리스트 (여기에 있는 교수 id를 이용해 교수의 이름들을 가져온다.
		List<ProfessorSubject> proSubList = new ArrayList<ProfessorSubject>();
		//
		HashMap<String,Object> result = new HashMap<String, Object>();
		
			
		// 전공 id, 이수구분별 과목 List를 넣어준다.
		List<Subject> subList = subjectDao.selectSubjectBySubjectTypeAndMajorId(subTypeAndMajorId);		 
		
		// 과목 id들을 넣어준다.
		List<Integer> subIdList = new ArrayList<Integer>();
		
		for(Subject sub : subList){
			subIdList.add(sub.getSubjectId());
		}
		

		// 과목 id 하나당 교수담당과목리스트에 교수담당과목을 추가한다.
		for(Integer i:subIdList){
			proSubList.add(proSubDao.selectProfessorSubjectBySubId(i));
		} 
		   
		// 교수담당 과목에서 교수들의 이름을 빼온다.
		for(ProfessorSubject ps : proSubList){
			proNameList.add(ps.getProfessor().getUsersName());
		}
		result.put("subjectList", subList);
		result.put("proNameList", proNameList);
		
		return result;
		
	}


}
