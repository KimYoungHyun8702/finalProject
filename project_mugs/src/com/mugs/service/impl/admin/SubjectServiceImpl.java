package com.mugs.service.impl.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.BuildingDao;
import com.mugs.dao.CollegeDao;
import com.mugs.dao.MajorDao;
import com.mugs.dao.RoomDao;
import com.mugs.dao.SubjectDao;
import com.mugs.service.admin.SubjectService;
import com.mugs.vo.Building;
import com.mugs.vo.College;
import com.mugs.vo.Major;
import com.mugs.vo.Room;
import com.mugs.vo.Subject;
@Service
public class SubjectServiceImpl implements SubjectService {
	
	@Autowired
	private SubjectDao subjectDao;
	@Autowired
	private BuildingDao buildingDao;
	@Autowired
	private RoomDao roomDao;
	@Autowired
	private MajorDao majorDao;
	@Autowired
	private CollegeDao collegeDao;
	
	@Override
	public int insertSubject(Subject subject) {
		if(subject.getMajorId() == 0){
			subject.setMajorId(null);
		}
		int cnt = subjectDao.insertSubject(subject);
		if(cnt == 0 ){
			return 0;
		}
		return subject.getSubjectId();
	}

	@Override
	public int updateSubject(Subject subject) {
		if(subject.getLectureId() == 0){
			subject.setLectureId(null);
		}
		int cnt = subjectDao.updateSubjectById(subject);
		if(cnt ==0 ){
			return 0;
		}
		return subject.getSubjectId();
	}

	@Override
	public int deleteSubject(int subjectId) {
		int cnt = subjectDao.deleteSubject(subjectId);
		if(cnt == 0){
			return 0;
		}
		return cnt;
	}

	@Override
	public List<Subject> selectSubject() {
		return subjectDao.selectSubjectList();
	}

	@Override
	public Subject selectSubjectInfo(int subjectId) {
		return subjectDao.selectSubjectById(subjectId);
	}

	@Override
	public List<String> selectSubjectType() {
		return subjectDao.selectSubjectTypeList();
	}

	@Override
	public List<Subject> selectCollegeIdBySubjectType(String subjectType) {
		return subjectDao.selectCollegeIdBySubjectType(subjectType);
	}

	@Override
	public List<Subject> selectMajorIdByCollegeId(int collegeId, String subjectType) {
		return subjectDao.selectMajorIdByCollegeId(collegeId, subjectType);
	}

	@Override
	public List<Subject> selectSubjectByMajorId(int majorId, int collegeId, String subjectType) {
		return subjectDao.selectSubjectByMajorId(majorId, collegeId, subjectType);
	}

	@Override
	public Subject selectSubjectInfoBySubjectName(int subjectId) {
		return subjectDao.selectSubjectInfoBySubjectName(subjectId);
	}

	@Override
	public Map<String,Object> selectForInsertSubject() {
		Map<String,Object> map = new HashMap<>();
		List<Building> building = buildingDao.selectBuildingList();
		List<Room> room = roomDao.selectRoomList();
		List<College> college = collegeDao.selectCollegeList();
		List<Major> major = majorDao.selectMajorList();
		for(int i = 0; i<building.size(); i++){
			if(building.get(i).getBuildingName().equals("교수연구동")){
				building.remove(i);
			}
			if(building.get(i).getBuildingName().equals("광교관")){
				building.remove(i);
			}
		}
		map.put("building", building);
		map.put("room", room);
		map.put("college", college);
		map.put("major", major);
		return map;
	}

	@Override
	public Map<String,Object> selectSubjectInfoBySubjectIdForUpdate(int subjectId) {
		Map<String,Object> map = new HashMap<>();
		List<Building> building = buildingDao.selectBuildingList();
		List<Room> room = roomDao.selectRoomList();
		Subject subject = subjectDao.selectSubjectInfoBySubjectIdForUpdate(subjectId);
		for(int i = 0; i<building.size(); i++){
			if(building.get(i).getBuildingName().equals("교수연구동")){
				building.remove(i);
			}
			if(building.get(i).getBuildingName().equals("광교관")){
				building.remove(i);
			}
		}
		map.put("room", room);
		map.put("subject",subject);
		map.put("building", building);
		return map;
	}

	@Override
	public List<Subject> selectCollegeIdBySubjectTypeMinor(String subjectType) {
		return subjectDao.selectCollegeIdBySubjectTypeMinor(subjectType);
	}

	@Override
	public List<Subject> selectSubjectInfoBySubjectTime(String subjectTime, String subjectType) {
		return subjectDao.selectSubjectInfoBySubjectTime(subjectType, subjectTime);
	}

	@Override
	public Map<String,Object> selectSubjectInfoBySubjectIdForMinorUpdate(int subjectId) {
		Map<String,Object> map = new HashMap<>();
		List<Building> building = buildingDao.selectBuildingList();
		List<Room> room = roomDao.selectRoomList();
		Subject subject = subjectDao.selectSubjectInfoBySubjectIdForMinorUpdate(subjectId);
		for(int i = 0; i<building.size(); i++){
			if(building.get(i).getBuildingName().equals("교수연구동")){
				building.remove(i);
			}
			if(building.get(i).getBuildingName().equals("광교관")){
				building.remove(i);
			}
		}
		map.put("room", room);
		map.put("subject",subject);
		map.put("building", building);
		return map;
	}

	@Override
	public List<Room> selectForOverlap(String subjectTime, String subjectSemester, int buildingId) {
		List<Subject> overlap = subjectDao.selectForOverlap(subjectTime, subjectSemester, buildingId);
		List<Room> room = roomDao.selectRoomByReference(buildingId);
		if(overlap == null){
			return room;
		}else{
		for(int i = 0; i<room.size(); i++){
			for(int j =0; j<overlap.size(); j++){
				if(room.get(i).getRoomId() == overlap.get(j).getLectureId()){
					room.remove(i);
				}
			}
		}
		return 	room;
		}
	}
	
	@Override
	public List<Room> selectForOverlapUpdate(String subjectTime, String subjectSemester, int buildingId, int subjectId) {
		List<Subject> overlap = subjectDao.selectForOverlap(subjectTime, subjectSemester, buildingId);
		List<Room> room = roomDao.selectRoomByReference(buildingId);
		Subject subject = subjectDao.selectSubjectInfoBySubjectIdForMinorUpdate(subjectId);
		if(overlap == null){
			return room;
		}else{
			if(subject.getLectureId() == null){
				for(int i = 0; i<room.size(); i++){
					for(int j = 0; j<overlap.size(); j++){
						if(room.get(i).getRoomId() == overlap.get(j).getLectureId()){
							room.remove(i);
						}
					}
				}
				return room;
			}else{
				for(int i = 0; i<room.size(); i++){
					for(int j =0; j<overlap.size(); j++){
						if(room.get(i).getRoomId() == overlap.get(j).getLectureId() && 
								subject.getLectureId() != room.get(i).getRoomId()){
							room.remove(i);
						}
					}
				}
				return 	room;
			}
			}
	}
}
