package com.mugs.service.impl.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.GraduationCreditDao;
import com.mugs.service.admin.GraduationCreditService;
import com.mugs.vo.GraduationCredit;
@Service
public class GraduationCreditServiceImpl implements GraduationCreditService{
	
	@Autowired
	private GraduationCreditDao graduationCreditDao;
	
	@Override
	public int insertGraduationCredit(GraduationCredit graduationCredit) {
		int cnt = graduationCreditDao.insertGraduationCredit(graduationCredit);
		if(cnt == 0 ){
			return 0;
		}
		return cnt;
	}

	@Override
	public int updateGraduationCredit(GraduationCredit graduationCredit) {
		int cnt = graduationCreditDao.updateGraduationCreditById(graduationCredit);
		if(cnt == 0 ){
			return 0;
		}
		return cnt;
	}

	@Override
	public int deleteGraduationCredit(int majorId, int graduationCreditYear) {
		int cnt = graduationCreditDao.deleteGraduationCredit(majorId, graduationCreditYear);
		if(cnt == 0 ){
			return 0;
		}
		return cnt;
	}

	@Override
	public List<GraduationCredit> selectGraduationCreditList() {
		return graduationCreditDao.selectGraduationCreditList();
	}

	@Override
	public GraduationCredit selectGraduationCreditbyId(int majorId, int graduationCreditYear) {
		return graduationCreditDao.selectGraduationCreditById(majorId, graduationCreditYear);
	}

	@Override
	public List<GraduationCredit> selectGraduationCreditByMajorId(int majorId) {
		return graduationCreditDao.selectGraduationCreditByMajorId(majorId);
	}

}
