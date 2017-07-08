package com.mugs.service.impl.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.BuildingDao;
import com.mugs.dao.CollegeDao;
import com.mugs.dao.MajorDao;
import com.mugs.dao.RoomDao;
import com.mugs.dao.StudentDao;
import com.mugs.dao.UsersDao;
import com.mugs.service.admin.StudentService;
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
	private BuildingDao buildingDao;
	@Autowired
	private RoomDao roomDao;
	@Autowired
	private MajorDao majorDao;
	@Autowired
	private CollegeDao collegeDao;
	
	
	@Override
	public String insertStudent(Users users, Student student) {
		usersDao.insertUsers(users);
		student.setStuId(users.getUsersId());
		if(student.getMajorMinorId() == 0){
			student.setMajorMinorId(null);
		}
		if(student.getMajorDualId() == 0){
			student.setMajorDualId(null);
		}
		System.out.println(student.getStuAdmissionDate());
		System.out.println(student.getStuGraduationDate());
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
	public String updateStudent(Users users, Student student) {
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
		
		System.out.println(map.get("stuAdmissionDate"));
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
		
		System.out.println(map.get("stuAdmissionDate"));
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
}
