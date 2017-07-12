package com.mugs.service.impl.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.StandardDao;
import com.mugs.service.admin.StandardService;
import com.mugs.vo.Standard;
@Service
public class StandardServiceImpl implements StandardService{

	@Autowired
	private StandardDao standardDao;
	
	@Override
	public String insertStandard(Standard standard) {
		int cnt = standardDao.insertStandard(standard);
		if(cnt == 0 ){
			return "실패";
		}
		return "성공";
	}

	@Override
	public String updateStandard(Standard standard) {
		int cnt = standardDao.updateStandard(standard);
		if(cnt == 0 ){
			return "실패";
		}
		return "성공";
	}

	@Override
	public String deleteStandard(int standardYear, int majorId) {
		int cnt = standardDao.deleteStandard(standardYear, majorId);
		if(cnt == 0){
			return "실패";
		}
		return "성공";
	}

	@Override
	public List<Standard> selectStandardList() {
		return standardDao.selectStandardList();
	}

	@Override
	public Standard selectStandardInfo(int standardYear, int majorId) {
		return standardDao.selectStandardById(standardYear, majorId);
	}

	@Override
	public List<Standard> selectStandardByMajorId(int majorId) {
		return standardDao.selectListByMajorId(majorId);
	}

}
