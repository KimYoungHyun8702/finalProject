SELECT ps.pro_subject_id ,
			   ps.pro_subject_semester ,
			   ps.pro_subject_year ,
			   ps.pro_id,
			   u.users_name professorName
		FROM   professor_subject ps, professor p, users u
		WHERE  ps.subject_id= '1'
		AND	   ps.pro_id = p.pro_id
		AND	   p.pro_id= u.users_id

UPDATE credit

SET		
credit_year= '2017',
credit_semester= '1학기',
credit_acquire= '3',
credit_grade= 'A+',
credit_score= '4.5',
credit_recource= 'Y',
subject_id= '1',
stu_id= '3'

WHERE credit_year= '2017'
AND credit_semester= '1학기'
AND subject_id = '1'
AND stu_id = '3'

SELECT avg(credit_score)
FROM CREDIT
WHERE credit_year = '2017'
AND credit_semester = '1학기'
AND stu_id = '3'
SELECT ps.pro_subject_id ,
			   ps.pro_subject_semester ,
			   ps.pro_subject_year ,
			   ps.pro_id,
			   u.users_name professorName
		FROM   professor_subject ps, professor p, users u
		WHERE  ps.subject_id= #{subId}
		AND	   ps.pro_id = p.pro_id
		AND	   p.pro_id= u.users_id
	
		INSERT INTO academic_probation 
		VALUES(
		100,
		2017,
		'1학기', 
		0.0, 
		'3')

		select AVG(achieve) from tblGroup; -- 개인당평균
[출처] [MS-SQL] 집계함수(count, sum, avg, min, max), Group by, Having, Compute, Datetime|작성자 진정남