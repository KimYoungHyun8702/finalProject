package com.mugs.service.impl.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.GraduationCreditDao;
import com.mugs.dao.MajorDao;
import com.mugs.dao.StandardDao;
import com.mugs.service.admin.MajorService;
import com.mugs.vo.Major;
@Service
public class MajorServiceImpl implements MajorService {
	
	@Autowired
	private MajorDao majorDao;
	@Autowired
	private StandardDao standardDao;
	@Autowired
	private GraduationCreditDao graduationCreditDao;
	
	@Override
	public int insertMajor(Major major) {
		int cnt = majorDao.insertMajor(major);
		if(cnt == 0 ){
			return 0;
		}
		return major.getMajorId();
	}

	@Override
	public int updateMajor(Major major) {
		int cnt = majorDao.updateMajorById(major);
		if(cnt == 0){
			return 0;
		}
		return major.getMajorId();
	}

	@Override
	public int deleteMajor(int majorId) {
		int cnt = majorDao.deleteMajor(majorId);
		if(cnt == 0){
			return 0;
		}
		return majorId;
	}

	@Override
	public List<Major> selectMajorList() {
		return majorDao.selectMajorList();
	}

	@Override
	public Major selectMajorById(int majorId) {
		return majorDao.selectMajorById(majorId);
	}

	@Override
	public List<Major> selectMajorBycollegeId(int collegeId) {
		return majorDao.selectMajorByCollegeId(collegeId);
	}

	@Override
	public Map selectMajorGraduationCreditByMajorId(int majorId) {
		Map map = new HashMap();
		map.put("major", majorDao.selectMajorById(majorId));
		map.put("graduationcredit", graduationCreditDao.selectGraduationCreditByMajorId(majorId));
		map.put("standard", standardDao.selectListByMajorId(majorId));
		return map;
	}
}
