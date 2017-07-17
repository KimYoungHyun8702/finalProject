package com.mugs.service.impl.admin;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mugs.dao.AcademicProbationDao;
import com.mugs.dao.AuthoritiesDao;
import com.mugs.dao.CreditDao;
import com.mugs.dao.CreditGiveUpDao;
import com.mugs.dao.LeaveReturnApplicationDao;
import com.mugs.dao.MajorDao;
import com.mugs.dao.StudentDao;
import com.mugs.dao.UsersDao;
import com.mugs.service.admin.StudentService;
import com.mugs.vo.AcademicProbation;
import com.mugs.vo.Authorities;
import com.mugs.vo.Credit;
import com.mugs.vo.CreditGiveUp;
import com.mugs.vo.LeaveReturnApplication;
import com.mugs.vo.Major;
import com.mugs.vo.Student;
import com.mugs.vo.Users;
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private UsersDao usersDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private MajorDao majorDao;
	@Autowired
	private AuthoritiesDao authoritiesDao;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private CreditGiveUpDao creditGiveUpDao;
	@Autowired
	private LeaveReturnApplicationDao leaveReturnApplicationDao;
	@Autowired
	private CreditDao creditDao;
	@Autowired
	private AcademicProbationDao academicProbationDao;
	
	@Override
	@Transactional
	public String insertStudent(Users users, Student student, String role) throws Exception{
		int index = users.getUsersRRN().indexOf("-");
		users.setUsersPassword(users.getUsersRRN().substring(index+1));
		users.setUsersPassword(passwordEncoder.encode(users.getUsersPassword()));
		usersDao.insertUsers(users);
		authoritiesDao.insertAuthorities(new Authorities(users.getUsersId(),role));
		student.setStuId(users.getUsersId());
		if(student.getMajorMinorId() == 0){
			student.setMajorMinorId(null);
		}
		if(student.getMajorDualId() == 0){
			student.setMajorDualId(null);
		}
		if(student.getStuAdmissionDate().equals(student.getStuGraduationDate())){
			student.setStuGraduationDate(null);
		}
		int cnt = studentDao.insertStudent(student);
		if(cnt == 0){
			return "실패";
		}else{
			return "성공"; 
		}
	}

	@Override
	@Transactional
	public String updateStudent(Users users, Student student) {
		if(student.getStuGraduationDate() != null){
			authoritiesDao.updateAuthoritiesById(new Authorities(users.getUsersId(),"ROLE_GRADUATION"));
			student.setStuRegisterState("졸업");
		}
		usersDao.updateUsersById(users);
		student.setStuId(users.getUsersId());
		if(student.getMajorMinorId() == 0){
			student.setMajorMinorId(null);
		}
		if(student.getMajorDualId() == 0){
			student.setMajorDualId(null);
		}
		int cnt = studentDao.updateStudent(student);
		if(cnt == 0){
			return "실패";
		}else{
			return "성공"; 
		}
	}

	@Override
	public String deleteStudent(String usersId) {
		int cnt = usersDao.deleteUsers(usersId);
		if(cnt == 0){
			return "실패";
		}else{
			return "성공";
		}
	}

	@Override
	public List<Student> selectStudentByName(String usersName) {
		return studentDao.selectStudentByName(usersName);
		
	}

	@Override
	public Map selectStudentInfoById(String stuId) {
		Map map = new HashMap();
		Student info = studentDao.selectStudentInfoByStuId(stuId);
		Student major = studentDao.selectStudentInfoForMajorById(stuId);
		Student majorDual = studentDao.selectStudentInfoForMajorDualById(stuId);
		Student majorMinor = studentDao.selectStudentInfoForMajorMinorById(stuId);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		if(info.getStuGraduationDate() != null){		
			map.put("stuGraduationDate", sd.format(info.getStuGraduationDate()));
		}
		map.put("stuAdmissionDate", sd.format(info.getStuAdmissionDate()));
		
		map.put("info", info);
		map.put("major", major);
		map.put("majorDual", majorDual);
		map.put("majorMinor", majorMinor);
		return map;
	}

	@Override
	public Map<String, Object> selectForInsertStudent() {
		Map map = new HashMap();
		List<Major> major = majorDao.selectMajorList();
		List<Major> majorMinor = majorDao.selectMajorList();
		List<Major> majorDual = majorDao.selectMajorList();
		map.put("major", major);
		map.put("majorMinor", majorMinor);
		map.put("majorDual", majorDual);
		return map;
	}

	@Override
	public Map selectStudentForupdate(String usersId) {
		Map map = new HashMap();
		Student info = studentDao.selectStudentInfoByStuId(usersId);
		Student major = studentDao.selectStudentInfoForMajorById(usersId);
		Student majorDual = studentDao.selectStudentInfoForMajorDualById(usersId);
		Student majorMinor = studentDao.selectStudentInfoForMajorMinorById(usersId);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		if(info.getStuGraduationDate() != null){		
			map.put("stuGraduationDate", sd.format(info.getStuGraduationDate()));
		}
		map.put("stuAdmissionDate", sd.format(info.getStuAdmissionDate()));
		
		map.put("info", info);
		map.put("major", major);
		map.put("majorDual", majorDual);
		map.put("majorMinor", majorMinor);
		List<Major> majorList = majorDao.selectMajorList();
		List<Major> majorMinorList = majorDao.selectMajorList();
		List<Major> majorDualList = majorDao.selectMajorList();
		map.put("majorList", majorList);
		map.put("majorMinorList", majorMinorList);
		map.put("majorDualList", majorDualList);
		return map;
	}
	
	@Override
	public List<Users> selectUsersList(String usersId){
		List<Users> list = usersDao.selectUsersList();
		for(int i = 0; i<list.size(); i++){
			if(list.get(i).getUsersId().equals(usersId)){
				return null;
			}
		}
		return list;
	}

	@Override
	public List<CreditGiveUp> selectCreditGiveUpList() {
		return creditGiveUpDao.selectCreditGiveUpJoin();
	}

	@Override
	public List<LeaveReturnApplication> selectLeaveReturnApplicationList() {
		return leaveReturnApplicationDao.selectLeaveReturnApplicationJoin();
	}

	@Override
	@Transactional
	public void approveCreditGiveUp(int creditGiveUpId){
		CreditGiveUp creditGiveUp = creditGiveUpDao.SelectCreditGiveUpById(creditGiveUpId);
		int id = creditGiveUp.getCreditId();
		creditGiveUp.setCGUState("승인");
		creditGiveUpDao.updateCreditGiveUp(creditGiveUp);
		Credit credit = creditDao.selectCreditById(id);
		credit.setCreditGrade("포기");
		creditDao.updateCreditById(credit);
	}

	@Override
	public void refuseCreditGiveUp(int creditGiveUpId) {
		CreditGiveUp creditGiveUp = creditGiveUpDao.SelectCreditGiveUpById(creditGiveUpId);
		creditGiveUp.setCGUState("반려");
		creditGiveUpDao.updateCreditGiveUp(creditGiveUp);
	}

	@Override
	@Transactional
	public void approveLeaveReturnApplication(int LRApplicationId) {
		LeaveReturnApplication leaveReturnApplication = leaveReturnApplicationDao.selectLeaveReturnApplicationById(LRApplicationId);
		leaveReturnApplication.setLRApplicationState("승인");
		if (leaveReturnApplication.getLRApplicationType().equals("복학")) {
			Student student = studentDao.selectStudentById(leaveReturnApplication.getStuId());
			student.setStuRegisterState("재학");
			studentDao.updateStudent(student);
			leaveReturnApplicationDao.updateLeaveReturnApplication(leaveReturnApplication);
		} else {
			Student student = studentDao.selectStudentById(leaveReturnApplication.getStuId());
			student.setStuRegisterState("휴학");
			studentDao.updateStudent(student);
			leaveReturnApplicationDao.updateLeaveReturnApplication(leaveReturnApplication);
		}
	}

	@Override
	public void refuseLeaveReturnApplication(int LRApplicationId) {
		LeaveReturnApplication leaveReturnApplication = leaveReturnApplicationDao.selectLeaveReturnApplicationById(LRApplicationId);
		leaveReturnApplication.setLRApplicationState("반려");
		leaveReturnApplicationDao.updateLeaveReturnApplication(leaveReturnApplication);
	}

	@Override
	public Map selectForExpel() {
		Map map = new HashMap();
		List<AcademicProbation> list = academicProbationDao.selectForExpelStudentInfo();
		for(int i =0; i<list.size(); i++){
			if(list.get(i).getUsersEnable() == 0){
				list.remove(i);
				i--;
			}
		}
		map.put("list", list);
		for(int i = 0; i<list.size(); i++){
			List<AcademicProbation> year = academicProbationDao.selectForExpel(list.get(i).getStuId());
			map.put("year", year);
		}
		return map;
	}

	@Override
	public void expelProbation(String usersId) {
		Users users = usersDao.selectUsersById(usersId);
		users.setUsersEnable(0);
		usersDao.updateUsersById(users);
	}

	
	

		
	
	
	
	
	
}
