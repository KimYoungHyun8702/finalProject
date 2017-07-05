package com.mugs.etc;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mugs.dao.StudentDao;
import com.mugs.dao.impl.StudentDaoImpl;
import com.mugs.vo.Student;

public class BMtest {
	public static void main(String[] args) {
		ApplicationContext container = 
				new ClassPathXmlApplicationContext("com/mugs/config/spring/model-context.xml");
		
		StudentDao dao = (StudentDaoImpl)container.getBean("studentDaoImpl");
		Student stu = dao.selectStudentMajorName();
		ArrayList<String> list = (ArrayList)stu.getList();
		for(String majorName : list ){
			System.out.println(majorName);
		}
		
		
	}
}
