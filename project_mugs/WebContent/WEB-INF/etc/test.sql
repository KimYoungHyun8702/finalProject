		SELECT 
		s.plan_id,
		s.plan_summary,
		s.plan_marking_method,
		s.plan_lesson_goal,
		s.plan_week_content,
		s.plan_bookinfo,
		s.plan_bibliography,
		s.plan_year,
		s.plan_semester,
		s.plan_note,
		s.pro_id,
		s.subject_id,
		p.pro_subject_id, 
		p.pro_subject_semester, 
		p.pro_subject_year,
		p.pro_id,
		p.subject_id
	
	FROM subject_plan s, professor_subject p
	WHERE s.plan_semester = p.pro_subject_semester
	AND   s.plan_year = p.pro_subject_year
	AND   s.subject_id = p.subject_id
	AND   s.subject_id = '1'
	
	