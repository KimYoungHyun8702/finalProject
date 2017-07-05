package com.mugs.service.impl.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.MajorDao;
import com.mugs.service.admin.MajorService;
import com.mugs.vo.Major;
@Service
public class MajorServiceImpl implements MajorService {
	
	@Autowired
	private MajorDao majorDao;
	
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
	public List<Major> selectMajorGraduationCreditByMajorId(int majorId) {
		if(majorDao.selectMajorGraduationCreditByMajorId(majorId).size() == 0 ){
			List<Major> list = new ArrayList<>();
			list.add(majorDao.selectMajorById(majorId));
			return list;
		}
		return majorDao.selectMajorGraduationCreditByMajorId(majorId);
	}
	
	
}
