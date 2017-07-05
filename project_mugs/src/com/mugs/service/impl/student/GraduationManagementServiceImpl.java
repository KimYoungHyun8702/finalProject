package com.mugs.service.impl.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.dao.standardDao;
import com.mugs.service.student.GraduationManagementService;

@Service
public class GraduationManagementServiceImpl implements GraduationManagementService{

	@Autowired
	private standardDao standardDaoImpl;
	@Override
	public List<String> getMajorList() {
		List<String> majorList = standardDaoImpl.selectMajorList();
		System.out.println(majorList);
		return majorList;
	}
	

}

