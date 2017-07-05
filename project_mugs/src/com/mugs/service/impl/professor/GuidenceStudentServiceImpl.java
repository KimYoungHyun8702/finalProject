package com.mugs.service.impl.professor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mugs.dao.GuidanceStudentDao;
import com.mugs.dao.studentDao;
import com.mugs.service.professor.GuidenceStudentService;
import com.mugs.vo.GuidanceStudent;
import com.mugs.vo.Student;

@Service
public class GuidenceStudentServiceImpl implements GuidenceStudentService{

	@Autowired
	private GuidanceStudentDao dao;
	@Autowired
	private studentDao dao2;
	
	@Override
	public GuidanceStudent getGuidanceStudentListByJoin(String proId) {
		return dao.selectguidanceStudentListByJoin(proId);
	}

	@Override
	public Student getStudentInfoByJoin(String stuId) {
		
		return dao2.selectStudentInfoByJoin(stuId);
	}

}
