package com.mugs.service.impl.student;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mugs.dao.CollegeDao;
import com.mugs.dao.MajorDao;
import com.mugs.dao.ProfessorSubjectDao;
import com.mugs.dao.RoomDao;
import com.mugs.dao.StudentDao;
import com.mugs.dao.SubjectDao;
import com.mugs.dao.UsersDao;
import com.mugs.service.student.StudentIndividualService;
import com.mugs.vo.College;
import com.mugs.vo.Major;
import com.mugs.vo.ProfessorSubject;
import com.mugs.vo.Room;
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
	@Autowired
	private RoomDao roomDao;
	@Autowired
	private PasswordEncoder passwordEncoder;

	
	@Override
	public void updateStudentHumanInfo(Users users) {	
	userDao.updateStudentHumanInfo(users);	
	}
	
	@Override
	public void updateStudentPassword(Users user) {
		user.setUsersPassword(passwordEncoder.encode(user.getUsersPassword()));
		userDao.updateStudentPassword(user);
	}
 
	@Override
	public Map findStudentInfoById(String stuId) {
	      Map map = new HashMap();	      
	      Student stuInfo = stuDao.selectStudentAllInfoByJoin(stuDao.selectStudentById(stuId));
	      SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
	      if(stuInfo.getStuGraduationDate() != null){      
		         map.put("stuGraduationDate", sd.format(stuInfo.getStuGraduationDate()));
		      }
		      map.put("stuAdmissionDate", sd.format(stuInfo.getStuAdmissionDate()));
		      map.put("stuInfo", stuInfo);
	return map;
	}
	
	public List<Integer> getSemesterInfo(){
		return subjectDao.selectSemesterInfo();
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
	public List<Object> getSubjectTypeListByMajorId(int majorId,String semester) {
		List<String> proNameList = new ArrayList<String>();				
		List<ProfessorSubject> proSubList = new ArrayList<ProfessorSubject>();
		List<Object> resultSubList = new ArrayList<Object>(); 
		List<Room> roomList = new ArrayList<Room>();
		List<String> roomNameList = new ArrayList<String>();
		
		// 전공 id별 과목 List를 넣어준다.
		List<Subject> subList = subjectDao.selectSubjectListByMajorIdForAllTime(majorId,semester);
				
		// 해당 과목들의 강의실 id들을 넣어준다.
		List<Integer> roomIdList = new ArrayList<Integer>();
		for(Subject sub : subList){
			roomIdList.add(sub.getLectureId());
		}
		
		//  강의실리스트에 강의실 id에 맞는 강의실을 추가한다.
		for(Integer i:roomIdList){
			roomList.add(roomDao.selectRoomById(i));
		}
		
		// 강의실에서 강의실 이름을 빼온다.
		for(Room r : roomList){
			roomNameList.add(r.getRoomName()); 
		}
		
		// 과목 id들을 넣어준다.
		List<Integer> subIdList = new ArrayList<Integer>();
		for(Subject sub : subList){
			subIdList.add(sub.getSubjectId());
		}

		// 교수담당과목리스트에 해당 과목 id에 맞는 교수담당과목을 추가한다.
		for(Integer i:subIdList){
			proSubList.add(proSubDao.selectProfessorSubjectBySubId(i));			
			} 
		  
		// 교수담당 과목에서 교수들의 이름을 빼온다.
		for(ProfessorSubject ps : proSubList){
			proNameList.add(ps.getProfessor().getUsersName());
		}
		
		//List에 넣어준다.
		resultSubList.add(subList);
		resultSubList.add(proNameList);
		resultSubList.add(roomNameList);
		resultSubList.add(subjectDao.subjectTypeList());
		
		return resultSubList;
		
	}


	@Override
	public Map<String,Object> getSubjectBySubjectTypeAndMajorId(String semester, Integer majorId, String subjectType) {
		/**
		 * 1. 해당 단과대학 -> 전공 -> 이수구분 을 가지고 있는 과목들을 가져온다.
		 * 2. 1번에 해당하는 강의실 이름과 교수 이름을 가져온다. 
		 * 3. 강의실 이름과 교수 이름을 받아오기 위해 이수구분과 전공 id(List)를 파라미터로 받는다.
		 * 4. 아래는 결과를 받아오기 위한 리스트들
		 */
		List<String> proNameList = new ArrayList<String>();				
		List<ProfessorSubject> proSubList = new ArrayList<ProfessorSubject>();
		Map<String,Object> resultSubMap = new HashMap<>(); 
		List<Room> roomList = new ArrayList<Room>();
		List<String> roomNameList = new ArrayList<String>();
		List<Subject> subList = new ArrayList<Subject>();
		
		
		// 전공 id, 이수구분별 과목 List를 넣어준다.
		if(subjectType.equals("선택교양") || subjectType.equals("필수교양")){
		majorId = null;		
		subList = subjectDao.selectSubjectBySubjectTypeAndMajorId(semester,majorId,subjectType);
		}else{
		subList = subjectDao.selectSubjectBySubjectTypeAndMajorId(semester,majorId,subjectType);
		}
		// 해당 과목들의 강의실 id들을 넣어준다. 
		List<Integer> roomIdList = new ArrayList<Integer>();
		for(Subject sub : subList){
			roomIdList.add(sub.getLectureId());
		}
		
		//  강의실리스트에 강의실 id에 맞는 강의실을 추가한다.
		for(Integer i:roomIdList){
			roomList.add(roomDao.selectRoomById(i));
		}
		
		// 강의실에서 강의실 이름을 빼온다.
		for(Room r : roomList){
			roomNameList.add(r.getRoomName()); 
		}
		
		// 과목 id들을 넣어준다.
		List<Integer> subIdList = new ArrayList<Integer>();
		for(Subject sub : subList){
			subIdList.add(sub.getSubjectId());
		}
		// 교수담당과목리스트에 해당 과목 id에 맞는 교수담당과목을 추가한다.
		for(Integer i:subIdList){
			proSubList.add(proSubDao.selectProfessorSubjectBySubId(i));
		} 
		   
		// 교수담당 과목에서 교수들의 이름을 빼온다.
		for(ProfessorSubject ps : proSubList){
			proNameList.add(ps.getProfessor().getUsersName());
		}
		
		//List에 넣어준다.
		resultSubMap.put("subList", subList);
		resultSubMap.put("proNameList", proNameList);
		resultSubMap.put("roomNameList", roomNameList);
		
		
		return resultSubMap;
	}

}
