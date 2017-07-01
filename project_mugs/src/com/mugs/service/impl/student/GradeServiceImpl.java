package com.mugs.service.impl.student;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.CreditDao;
import com.mugs.service.student.GradeService;


@Service
public class GradeServiceImpl implements GradeService {
	@Autowired
	private CreditDao dao;

	@Override
	public List<Integer> getYear(String id) {
		// TODO Auto-generated method stub
		return dao.selectYearByStuId(id);
	}

	@Override
	public List<String> getSemester(int year) {
		return dao.selec;
	}
	
}
