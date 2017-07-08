package com.mugs.service.impl.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.BuildingDao;
import com.mugs.dao.CollegeDao;
import com.mugs.dao.MajorDao;
import com.mugs.dao.ProfessorDao;
import com.mugs.dao.RoomDao;
import com.mugs.dao.UsersDao;
import com.mugs.service.admin.ProfessorService;
import com.mugs.vo.Building;
import com.mugs.vo.College;
import com.mugs.vo.Major;
import com.mugs.vo.Professor;
import com.mugs.vo.Room;
import com.mugs.vo.Users;

@Service
public class ProfessorServiceImpl implements ProfessorService {
	
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private ProfessorDao professorDao; 
	@Autowired
	private BuildingDao buildingDao;
	@Autowired
	private RoomDao roomDao;
	@Autowired
	private MajorDao majorDao;
	@Autowired
	private CollegeDao collegeDao;
	
	@Override
	public int insertProfessor(Users users, Professor professor) {
		usersDao.insertUsers(users);
		professor.setProId(users.getUsersId());
		if(professor.getMajorId() == 0){
			professor.setMajorId(null);
		}
		if(professor.getProRoomOfficeId().equals("없음")){
			professor.setProRoomOfficeId(null);
		}
		if(professor.getProRoomLaboratoryId().equals("없음")){
			professor.setProRoomLaboratoryId(null);
		}
		professorDao.insertProfessor(professor);
		return 0;
	}

	@Override
	public int updateProfessor(Users users, Professor professor) {
		usersDao.updateUsersById(users);
		professor.setProId(users.getUsersId());
		if(professor.getMajorId() == 0){
			professor.setMajorId(null);
		}
		if(professor.getProRoomOfficeId().equals("없음")){
			professor.setProRoomOfficeId(null);
		}
		if(professor.getProRoomLaboratoryId().equals("없음")){
			professor.setProRoomLaboratoryId(null);
		}
		professorDao.updateProfessor(professor);
		return 0;
	}

	@Override
	public int deleteProfessor(String usersId) {
		professorDao.deleteProfessor(usersId);
		return 0;
	}

	@Override
	public List<Professor> selectProfessorByName(String usersName) {
		return professorDao.selectProfessorByName(usersName);
	}

	@Override
	public HashMap<String, Object> selectProfessorInfoById(String proId) {
		HashMap<String, Object> map = new HashMap<>();
		Professor info = professorDao.selectProfessorInfoById(proId);
		Professor major = professorDao.selectProfessorInfoForMajorById(proId);
		Professor office = professorDao.selectProfessorInfoForOfficeById(proId);
		Professor laboratory = professorDao.selectProfessorInfoForLaboratoryById(proId);
		map.put("info", info);
		map.put("major", major);
		map.put("office", office);
		map.put("laboratory", laboratory);
		return map;
	}
	
	@Override
	public Map<String,Object> selectForInsertProfessor() {
		Map<String,Object> map = new HashMap<>();
		List<Building> building = buildingDao.selectBuildingList();
		List<Room> room = roomDao.selectRoomList();
		List<College> college = collegeDao.selectCollegeList();
		List<Major> major = majorDao.selectMajorList();
		map.put("building", building);
		map.put("room", room);
		map.put("college", college);
		map.put("major", major);
		return map;
	}

	@Override
	public Map selectProfessorForupdate(String usersId) {
		HashMap<String, Object> map = new HashMap<>();
		Professor info = professorDao.selectProfessorInfoById(usersId);
		Professor major = professorDao.selectProfessorInfoForMajorById(usersId);
		Professor office = professorDao.selectProfessorInfoForOfficeById(usersId);
		Professor laboratory = professorDao.selectProfessorInfoForLaboratoryById(usersId);
		List<Building> building = buildingDao.selectBuildingList();
		List<Room> room = roomDao.selectRoomList();
		List<College> college = collegeDao.selectCollegeList();
		List<Major> majorList = majorDao.selectMajorList();
		map.put("info", info);
		map.put("major", major);
		map.put("office", office);
		map.put("laboratory", laboratory);
		map.put("building", building);
		map.put("room", room);
		map.put("college", college);
		map.put("majorList", majorList);
		return map;
	}
	
	

	
}
