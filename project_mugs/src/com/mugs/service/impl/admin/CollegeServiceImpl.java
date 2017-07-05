package com.mugs.service.impl.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.CollegeDao;
import com.mugs.service.admin.CollegeService;
import com.mugs.vo.College;

@Service
public class CollegeServiceImpl implements CollegeService {
	
	@Autowired
	private CollegeDao collegeDao;
	
	@Override
	public int insertCollege(College college) {
		int cnt = collegeDao.insertCollege(college);
		if(cnt == 0){
			return 0;
		}else{
			return college.getCollegeId();
		}
	}

	@Override
	public int updateCollegeById(College college) {
		int cnt = collegeDao.updateCollegeById(college);
		if(cnt == 0){
			return 0;
		}else{
			return college.getCollegeId();
		}
	}

	@Override
	public int deleteCollege(int collegeId) {
		int cnt = collegeDao.deleteCollege(collegeId);
		if(cnt == 0){
			return 0;
		}else{
			return cnt;
		}
	}

	@Override
	public List<College> selectCollegeList() {
		return collegeDao.selectCollegeList();
	}

	@Override
	public College selectCollegeById(int collegeId) {
		return collegeDao.selectCollegeById(collegeId);
	}
	
}
