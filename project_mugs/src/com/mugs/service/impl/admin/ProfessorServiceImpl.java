package com.mugs.service.impl.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mugs.dao.AuthoritiesDao;
import com.mugs.dao.BuildingDao;
import com.mugs.dao.CollegeDao;
import com.mugs.dao.MajorDao;
import com.mugs.dao.ProfessorDao;
import com.mugs.dao.UsersDao;
import com.mugs.service.admin.ProfessorService;
import com.mugs.vo.Authorities;
import com.mugs.vo.Building;
import com.mugs.vo.College;
import com.mugs.vo.Major;
import com.mugs.vo.Professor;
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
	private MajorDao majorDao;
	@Autowired
	private CollegeDao collegeDao;
	@Autowired
	private AuthoritiesDao authoritiesDao;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	@Transactional
	public int insertProfessor(Users users, Professor professor, String role) throws Exception{
		int index = users.getUsersRRN().indexOf("-");
		users.setUsersPassword(users.getUsersRRN().substring(index+1));
		users.setUsersPassword(passwordEncoder.encode(users.getUsersPassword()));
		usersDao.insertUsers(users);
		authoritiesDao.insertAuthorities(new Authorities(users.getUsersId(),role));
		professor.setProId(users.getUsersId());
		if(professor.getMajorId() == 0){
			professor.setMajorId(null);
		}
		if(professor.getProRoomOfficeId() == 0){
			professor.setProRoomOfficeId(null);
		}
		if(professor.getProRoomLaboratoryId() == 0){
			professor.setProRoomLaboratoryId(null);
		}
		professorDao.insertProfessor(professor);
		return 0;
	}

	@Override
	@Transactional
	public int updateProfessor(Users users, Professor professor) {
		usersDao.updateUsersById(users);
		professor.setProId(users.getUsersId());
		if(professor.getMajorId() == 0){
			professor.setMajorId(null);
		}
		if(professor.getProRoomOfficeId() == 0){
			professor.setProRoomOfficeId(null);
		}
		if(professor.getProRoomLaboratoryId() == 0){
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
		List<Building> laboratory = buildingDao.selectRoomListByLaboratory();
		List<Professor> olapLaboratory = professorDao.selectProfessorLabaratoryForoverlap();
		List<Professor> olapOffice = professorDao.selectProfessorOfficeForOverlap();
		List<Building> office = buildingDao.selectRoomListByOffice();
		List<College> college = collegeDao.selectCollegeList();
		List<Major> major = majorDao.selectMajorList();
		if(olapLaboratory == null){
			map.put("laboratory", laboratory);			
		}else{
			for(int i = 0; i<laboratory.size(); i++){
				for(int j = 0; j<olapLaboratory.size(); j++ ){
					if(laboratory.get(0).getRoomList().get(i).getRoomId() == olapLaboratory.get(j).getProRoomLaboratoryId()){
						laboratory.get(0).getRoomList().remove(i);
					}
				}
			}
			map.put("laboratory", laboratory);
		}
		if(olapOffice == null){
			map.put("office", office);		
		}else{
			for(int i = 0; i<office.size(); i++){
				for(int j = 0; j<olapOffice.size(); j++ ){
					if(office.get(0).getRoomList().get(i).getRoomId() == olapOffice.get(j).getProRoomOfficeId()){
						office.get(0).getRoomList().remove(i);
					}
				}
			}
			map.put("office", office);
		}
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
		List<Building> laboratoryList = buildingDao.selectRoomListByLaboratory();
		List<Professor> olapLaboratory = professorDao.selectProfessorLabaratoryForoverlap();
		List<Professor> olapOffice = professorDao.selectProfessorOfficeForOverlap();
		List<Building> officeList = buildingDao.selectRoomListByOffice();
		List<College> college = collegeDao.selectCollegeList();
		List<Major> majorList = majorDao.selectMajorList();
		if (olapOffice == null) {
			map.put("officeList", officeList);
		} else {
			if (office == null) {
				for (int i = 0; i < officeList.size(); i++) {
					for (int j = 0; j < olapOffice.size(); j++) {
						if (officeList.get(0).getRoomList().get(i).getRoomId() == olapOffice.get(j)
								.getProRoomOfficeId()) {
							officeList.get(0).getRoomList().remove(i);
						}
					}
				}
				map.put("officeList", officeList);
			} else {
				for (int i = 0; i < officeList.size(); i++) {
					for (int j = 0; j < olapOffice.size(); j++) {
						if (officeList.get(0).getRoomList().get(i).getRoomId() == olapOffice.get(j).getProRoomOfficeId()
								&& officeList.get(0).getRoomList().get(i).getRoomId() != office.getProRoomOfficeId()) {
							officeList.get(0).getRoomList().remove(i);
						}else{
							i++;
						}
					}
				}
				map.put("officeList", officeList);
			}
		}
		if (olapLaboratory == null) {
			map.put("laboratoryList", laboratoryList);
		} else {
			if (laboratory == null) {
				for (int i = 0; i < laboratoryList.size(); i++) {
					for (int j = 0; j < olapLaboratory.size(); j++) {
						if (laboratoryList.get(0).getRoomList().get(i).getRoomId() == olapLaboratory.get(j)
								.getProRoomLaboratoryId()) {
							laboratoryList.get(0).getRoomList().remove(i);
						}
					}
				}
				map.put("laboratoryList", laboratoryList);
			} else {
				for (int i = 0; i < laboratoryList.size(); i++) {
					for (int j = 0; j < olapLaboratory.size(); j++) {
						if (laboratoryList.get(0).getRoomList().get(i).getRoomId() == olapLaboratory.get(j)
								.getProRoomLaboratoryId()
								&& laboratoryList.get(0).getRoomList().get(i).getRoomId() != laboratory
										.getProRoomLaboratoryId()) {
							laboratoryList.get(0).getRoomList().remove(i);
						}else{
							i++;
						}
					}
				}
				map.put("laboratoryList", laboratoryList);
			}
		}
		map.put("info", info);
		map.put("major", major);
		map.put("office", office);
		map.put("laboratory", laboratory);
		map.put("college", college);
		map.put("majorList", majorList);
		return map;
	}
}
