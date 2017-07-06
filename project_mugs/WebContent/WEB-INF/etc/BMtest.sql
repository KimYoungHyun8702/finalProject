		SELECT	   	s.stu_id,
			       	s.stu_course,
			   	   	s.stu_army,
			    	s.stu_admission_date,
			   		s.stu_graduation_date,
			   		s.stu_register_state,
				   	s.stu_student_state,
				  	s.stu_grade,
				   	s.stu_graduation_exam,
				   	s.stu_early_graduation,
				   	s.stu_semester,
				   	main.major_name,
				   	sub.major_name,
				   	multi.major_name				   	
		FROM 		student s, major main, major sub, major multi, users u
		WHERE		1 = s.major_id
		AND		    u.users_id ='s1'
		AND         u.users_id = s.stu_id;
		select distinct subject_type
		from subject
		WHERE major_id=1
		SELECT stu_id,
			   stu_course,
			   stu_army,
			   stu_admission_date,
			   stu_graduation_date,
			   stu_register_state,
			   stu_student_state,
			   stu_grade,
			   stu_graduation_exam,
			   stu_early_graduation,
			   stu_semester,
			   major_id,
			   major_dual_id,
			   major_minor_id
		FROM   STUDENT
		WHERE	stu_id = 's1'
		and		major_id is 1
		
		SELECT	   	s.stu_id,
			       	s.stu_course,
			   	   	s.stu_army,
			    	s.stu_admission_date,
			   		s.stu_graduation_date,
			   		s.stu_register_state,
				   	s.stu_student_state,
				  	s.stu_grade,
				   	s.stu_graduation_exam,
				   	s.stu_early_graduation,
				   	s.stu_semester,
				   	main.major_name,
				   	sub.major_name,
				   	multi.major_name				   	
		FROM 		student s, major main, major sub, major multi,users u
		WHERE		main.major_id = '1'
		AND			u.users_id = 's1'  
		AND			u.users_id = s.stu_id (+)
		
		SELECT		u.users_name,
			   		u.users_eng_name,
			   		u.users_rrn,
			  		u.users_email,
			   		u.users_phone_num,
		       		u.users_cell_num,
			   		u.users_national,
			   		u.users_current_addr,
			   		u.users_born_addr,
			   		u.users_enable,
			   		u.users_photo,
			       	s.stu_course,
			   	   	s.stu_army,
			    	s.stu_admission_date,
			   		s.stu_graduation_date,
			   		s.stu_register_state,
				   	s.stu_student_state,
				  	s.stu_grade,
				   	s.stu_graduation_exam,
				   	s.stu_early_graduation,
				   	s.stu_semester
		FROM 		users u,student s
		WHERE 		u.users_id = 's1'
		AND			u.users_id = s.stu_id(+)

		SELECT		s.stu_course,
			   	   	s.stu_army,
			    	s.stu_admission_date,
			   		s.stu_graduation_date,
			   		s.stu_register_state,
				   	s.stu_student_state,
				  	s.stu_grade,
				   	s.stu_graduation_exam,
				   	s.stu_early_graduation,
				   	s.stu_semester,
				   	u.users_name,
			   		u.users_eng_name,
			   		u.users_rrn,
			  		u.users_email,
			   		u.users_phone_num,
		       		u.users_cell_num,
			   		u.users_national,
			   		u.users_current_addr,
			   		u.users_born_addr,
			   		u.users_enable,
			   		u.users_photo,
				   	main.major_name,
				   	sub.major_name,
				   	multi.major_name				   	
		FROM 		student s, 
					major main, 
					major sub, 
					major multi, 
					users u					
		WHERE		main.major_id = 1
		AND			sub.major_id = 2
		AND			multi.major_id = 3
		AND			u.users_id = 's1'
		AND			u.users_id = s.stu_id 
		AND			main.major_id=s.major_id(+)
		
		
		
		SELECT		s.stu_course,
			   	   	s.stu_army,
			    	s.stu_admission_date,
			   		s.stu_graduation_date,
			   		s.stu_register_state,
				   	s.stu_student_state,
				  	s.stu_grade,
				   	s.stu_graduation_exam,
				   	s.stu_early_graduation,
				   	s.stu_semester,
				   	u.users_name,
			   		u.users_eng_name,
			   		u.users_rrn,
			  		u.users_email,
			   		u.users_phone_num,
		       		u.users_cell_num,
			   		u.users_national,
			   		u.users_current_addr,
			   		u.users_born_addr,
			   		u.users_enable,
			   		u.users_photo,
				   	main.major_name,
				   	sub.major_name,
				   	multi.major_name				   	
		FROM 		student s, 
					major main, 
					major sub, 
					major multi, 
					users u					
		WHERE		s.major_id = main.major_id
		AND			u.users_id = 's1'
		AND			u.users_id = s.stu_id(+)
		
		SELECT		s.stu_course,
			   	   	s.stu_army,
			    	s.stu_admission_date,
			   		s.stu_graduation_date,
			   		s.stu_register_state,
				   	s.stu_student_state,
				  	s.stu_grade,
				   	s.stu_graduation_exam,
				   	s.stu_early_graduation,
				   	s.stu_semester,
				   	u.users_name,
			   		u.users_eng_name,
			   		u.users_rrn,
			  		u.users_email,
			   		u.users_phone_num,
		       		u.users_cell_num,
			   		u.users_national,
			   		u.users_current_addr,
			   		u.users_born_addr,
			   		u.users_enable,
			   		u.users_photo,
				   	main.major_name ,
				   	sub.major_name,
				   	multi.major_name				   	
		FROM 		student s, 
					major main , 
					major sub subMajor, 
					major multi multiMajor, 
					users u					
		WHERE		s.major_id = main.major_id
		AND			s.major_dual_id = multi.major_id(+)
		AND			s.major_minor_id=sub.major_id(+)
		AND			u.users_id = s.stu_id 
		AND			u.users_id = 's1'
		
		
		UPDATE users
		SET

		users_password=123,
		users_name='병문',
		users_eng_name='lee',
		users_rrn='900823',
		users_email='leebeod@naver.com',
		users_phone_num='03174958471',
		users_cell_num='0104545781',
		users_national='영국',
		users_current_addr='고양',
		users_born_addr='인천',
		users_enable='1',
		users_photo='aaa/aaa/aaa'
		WHERE users_id='s1';
		
		select CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME
		from user_constraints
		where CONSTRAINT_NAME = 'SYS_C007952' 
		
		
	
		
		UPDATE users
		SET
		users_password='025631',
		users_email='leebeod@naver.com',
		users_phone_num='1234',
		users_cell_num='01041953614',
		users_current_addr='경기고양',
		users_born_addr='강원춘천',
		users_photo='사진'
		
		WHERE users_id='s1'
		
		SELECT * from users;
		
			SELECT college_id,  
		  college_name  
		FROM  college
		order by college_name asc
		
		SELECT subject_id,
		subject_name,
		subject_time,
		subject_type,
		subject_credit,
		subject_capacity,
		subject_request,
		subject_grade,
		subject_class,
		subject_close_class,
		subject_semester,
		major_id,
		lecture_id

		FROM subject
		WHERE major_id=1
		
		select distinct subject_type
		from subject
		
		SELECT ps.pro_subject_id ,
			   ps.pro_subject_semester ,
			   ps.pro_subject_year ,
			   ps.pro_id,
			   u.users_name professorName
		FROM   professor_subject ps, profersor p, users u
		WHERE  ps.subject_id=2
		AND	   ps.pro_id = p.pro_id
		AND	   p.pro_id= u.users_id
		
		SELECT ps.pro_subject_id ,
			   ps.pro_subject_semester ,
			   ps.pro_subject_year ,
			   ps.pro_id,
			   u.users_name professorName
		FROM   professor_subject ps, profersor p, users u
		WHERE  ps.major_id= 1
		AND	   ps.pro_id = p.pro_id
		AND	   p.pro_id= u.users_id
		
		SELECT 	subject_id subjectId,
				subject_name subjectName,
				subject_time subjectTime,
				subject_type subjectType,
				subject_credit subjectCredit,
				subject_capacity subjectCapacity,
				subject_grade subjectGrade,
				subject_class subjectClass,
				subject_semester subjectSemester,
				lecture_id lectureId				
		FROM    subject
		WHERE   subject_type ='전공필수'
		AND		major_id = '1'
		
		select distinct subject_type
		from subject
		WHERE major_id=4
		
		전공 ==> 관경, 호경 등등..
