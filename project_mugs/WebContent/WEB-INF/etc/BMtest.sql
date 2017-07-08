		SELECT		g.major_id,
					g.graduation_credit_year,
					g.grad_vital_edu_credit,
					g.grad_select_edu_credit,
					g.grad_vital_major_credit,
					g.grad_select_major_credit
		FROM 		graduation_credit g, users u, major m, student s
		WHERE 		u.users_id = '1'
		AND			u.users_id = s.stu_id
		AND			s.major_id = m.major_id
		AND			m.major_id = g.major_id
		AND			g.major_id = 1
		AND 		g.graduation_credit_year = '2015'
		
		-- 교수 (교수 ID, 졸업대, 졸업대학원, 전번, 전번, 소속학과, 교수실ID, 연구실ID)
		INSERT INTO	PROFESSOR VALUES ('9','서울대','서울대학원','031-555-5555','031-555-5555','1',1,3);
		INSERT INTO	PROFESSOR VALUES ('11','고려대','고려대학원','031-555-5555','031-555-5555','1',2,3);
		
		-- 과목 (과목코드, 과목이름, 교시, 이수구분, 학점, 정원, 신청인원, 학년, 분반여부, 폐강여부, 학기, 전공ID, 강의실ID
		insert into SUBJECT values(1, 'Java기초', '월(1, 2)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,1);
		insert into SUBJECT values(2, 'C언어기초', '화(3, 4)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,1);
		insert into SUBJECT values(3, '정보보안', '수(5, 6)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,2);
		insert into SUBJECT values(4, '데이터통신', '목(1, 2)', '필수전공', 3, 30, 10, 3, '1분반', 'N', '1학기', 1,3);
		insert into SUBJECT values(5, '데이터베이스', '금(3, 4)', '필수전공', 3, 30, 10, 4, '1분반', 'N', '1학기', 1,4);
		insert into SUBJECT values(16, '세계사산책', '월(1, 2)', '선택교양', 2, 50, 30, NULL, '1분반', 'N', '1학기', NULL,5);
		insert into SUBJECT values(17, '일본문화기행', '화(3, 4)', '선택교양', 2, 50, 30, NULL, '1분반', 'N', '1학기', NULL,6);
		insert into SUBJECT values(18, '당구의정석', '수(5, 6)', '선택교양', 2, 50, 30, NULL, '1분반', 'N', '1학기', NULL,1);
		insert into SUBJECT values(19, '볼링의정석', '목(1, 2)', '선택교양', 2, 50, 30, NULL, '1분반', 'N', '1학기', NULL,2);
		insert into SUBJECT values(20, '매너와교양', '금(3, 4)', '선택교양', 2, 50, 30, NULL, '1분반', 'N', '1학기', NULL,3);
	
		SELECT * FROM SUBJECT
		
		--교수 담당과목 (교담ID, 학기, 연도, 교수ID, 과목ID)
		INSERT INTO	PROFESSOR_SUBJECT VALUES ('1','1','2015',9,1);
		INSERT INTO	PROFESSOR_SUBJECT VALUES ('2','1','2015',9,2);
		INSERT INTO	PROFESSOR_SUBJECT VALUES ('3','1','2015',9,3);
		INSERT INTO	PROFESSOR_SUBJECT VALUES ('4','1','2015','11',4);
		INSERT INTO	PROFESSOR_SUBJECT VALUES ('5','1','2015','11',5);
		INSERT INTO	PROFESSOR_SUBJECT VALUES ('6','1','2015','11',16);
		
		--학생 (학생 ID, 과정구분, 병영구분, 입학일자, 졸업일자, 학적구분, 학생구분, 학년, 졸시패스여부, 조기졸업대상여부, 학기, 학과ID, 복수전공ID, 부전공ID
		INSERT INTO	STUDENT VALUES ('1','과정구분','미필','2015/01/01','2019/01/01','학적구분','학생구분','3','n','y','1','1','','');
		INSERT INTO	STUDENT VALUES ('2','과정구분','군필','2015/01/01','2019/01/01','학적구분','학생구분','3','n','n','1','1','','');
		INSERT INTO	STUDENT VALUES ('3','과정구분','군필','2015/01/01','2019/01/01','학적구분','학생구분','3','n','n','2','1','','');
		INSERT INTO	STUDENT VALUES ('4','과정구분','군필','2016/01/01','2020/01/01','학적구분','학생구분','2','n','n','1','1','','');
		INSERT INTO	STUDENT VALUES ('5','과정구분','공익','2016/01/01','2020/01/01','학적구분','학생구분','2','n','n','1','1','','');
		INSERT INTO	STUDENT VALUES ('6','과정구분','미필','2016/01/01','2020/01/01','학적구분','학생구분','2','n','y','2','1','','');
		INSERT INTO	STUDENT VALUES ('7','과정구분','군필','2017/01/01','2021/01/01','학적구분','학생구분','1','n','n','1','1','','');
		INSERT INTO	STUDENT VALUES ('8','과정구분','공익','2017/01/01','2021/01/01','학적구분','학생구분','1','n','n','1','1','','');
		INSERT INTO	STUDENT VALUES ('9','과정구분','공익','2017/01/01','2021/01/01','학적구분','학생구분','1','n','n','2','1','','');		
		INSERT INTO	STUDENT VALUES ('11','과정구분','미필','2015/01/01','2019/01/01','학적구분','학생구분','3','n','y','1','2','','');
		INSERT INTO	STUDENT VALUES ('12','과정구분','군필','2015/01/01','2019/01/01','학적구분','학생구분','3','n','n','1','2','','');
		INSERT INTO	STUDENT VALUES ('13','과정구분','군필','2015/01/01','2019/01/01','학적구분','학생구분','3','n','n','2','2','','');
		INSERT INTO	STUDENT VALUES ('14','과정구분','군필','2016/01/01','2020/01/01','학적구분','학생구분','2','n','n','1','2','','');
		INSERT INTO	STUDENT VALUES ('15','과정구분','공익','2016/01/01','2020/01/01','학적구분','학생구분','2','n','n','1','2','','');
		INSERT INTO	STUDENT VALUES ('16','과정구분','미필','2016/01/01','2020/01/01','학적구분','학생구분','2','n','y','2','2','','');
		INSERT INTO	STUDENT VALUES ('17','과정구분','군필','2017/01/01','2021/01/01','학적구분','학생구분','1','n','n','1','2','','');
		INSERT INTO	STUDENT VALUES ('18','과정구분','공익','2017/01/01','2021/01/01','학적구분','학생구분','1','n','n','1','2','','');
		INSERT INTO	STUDENT VALUES ('19','과정구분','공익','2017/01/01','2021/01/01','학적구분','학생구분','1','n','n','2','2','','');		
		INSERT INTO	STUDENT VALUES ('21','과정구분','미필','2015/01/01','2019/01/01','학적구분','학생구분','3','n','y','1','3','','');
		INSERT INTO	STUDENT VALUES ('22','과정구분','군필','2015/01/01','2019/01/01','학적구분','학생구분','3','n','n','1','3','','');
		INSERT INTO	STUDENT VALUES ('23','과정구분','군필','2015/01/01','2019/01/01','학적구분','학생구분','3','n','n','2','3','','');
		INSERT INTO	STUDENT VALUES ('24','과정구분','군필','2016/01/01','2020/01/01','학적구분','학생구분','2','n','n','1','3','','');
		INSERT INTO	STUDENT VALUES ('25','과정구분','공익','2016/01/01','2020/01/01','학적구분','학생구분','2','n','n','1','3','','');
		INSERT INTO	STUDENT VALUES ('26','과정구분','미필','2016/01/01','2020/01/01','학적구분','학생구분','2','n','y','2','3','','');
		INSERT INTO	STUDENT VALUES ('27','과정구분','군필','2017/01/01','2021/01/01','학적구분','학생구분','1','n','n','1','3','','');
		INSERT INTO	STUDENT VALUES ('28','과정구분','공익','2017/01/01','2021/01/01','학적구분','학생구분','1','n','n','1','3','','');
		INSERT INTO	STUDENT VALUES ('29','과정구분','공익','2017/01/01','2021/01/01','학적구분','학생구분','1','n','n','2','3','','');
		
		--사용자 (사용자ID, 비밀번호, 이름, 영문성명, 주민번호, 이메일, 집전번, 폰번, 국적,현거주지,본적지,인증가능상태,사진)
		INSERT INTO	USERS VALUES ('1','1111','백진현','aaaa','111101-111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('2','1111','김딘강','bbbb','111102-2222222','bcd@bcd.bcd','031-222-2222', '010-2222-2222','한국','경기도광주시','경기도 성남시',1,'c:/java');
		INSERT INTO	USERS VALUES ('3','1111','현동준','cccc','111103-1111111','efg@efg.efg','031-333-3333', '010-3333-3333','한국','경기도시흥시','경기도 광주시',0,'c:/java');
		INSERT INTO	USERS VALUES ('4','1111','김티겅듀','dddd','111104-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('5','1111','뤼병문','eeee','111105-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('6','1111','최미니','ffff','111106-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('7','1111','노현식','gggg','111107-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('8','1111','김형주','hhhh','111108-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('9','1111','돼지녕','iiii','111109-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('11','1111','손용훈','jjjj','111111-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('12','1111','이승헌','kkkk','111112-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('13','1111','미령이','llll','111113-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('14','1111','천누리','mmmm','111114-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('15','1111','김성환','nnnn','111115-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('16','1111','김경혜','oooo','111116-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('17','1111','서현화','pppp','111117-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('18','1111','왕주니','qqqq','111118-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('19','1111','김장규','rrrr','111119-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('21','1111','은영이','ssss','111121-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('22','1111','하연수','tttt','111122-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('23','1111','김구라','uuuu','111123-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('24','1111','노숙자','vvvv','111124-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('25','1111','황봉알','wwww','111125-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('26','1111','모모','xxxx','111126-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('27','1111','나연','yyyy','111127-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('28','1111','사나','zzzz','111128-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('29','1111','쯔위','zzwi','111129-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('10','1111','김교수','KimGabSu','111110-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('20','1111','이교수','KimGabSu','111120-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		INSERT INTO	USERS VALUES ('30','1111','박교수','KimGabSu','111130-1111111','abc@abc.abc','031-111-1111', '010-1111-1111','한국','경기도성남시','경기도 수원시',0,'c:/java');
		--건물TB
		INSERT INTO	BUILDING VALUES ('1','이공관');
		INSERT INTO	BUILDING VALUES ('2','교육관');
		INSERT INTO	BUILDING VALUES ('3','무슨상관');
		--방 TB
		INSERT INTO ROOM VALUES(1,'이공관 100호',1);
		INSERT INTO ROOM VALUES(2,'이공관 200호',1);
		INSERT INTO ROOM VALUES(3,'이공관 300호',1);
		INSERT INTO ROOM VALUES(4,'교육관 100호',2);
		INSERT INTO ROOM VALUES(5,'교육관 200호',2);
		INSERT INTO ROOM VALUES(6,'교육관 300호',2);
		
		--졸업학점 TB
		INSERT INTO GRADUATION_CREDIT VALUES(1, 2015, 35,25,45,25); -- 130
		INSERT INTO GRADUATION_CREDIT VALUES(1, 2016, 30,30,45,35); -- 140
		INSERT INTO GRADUATION_CREDIT VALUES(1, 2017, 30,30,35,35); -- 130
		INSERT INTO GRADUATION_CREDIT VALUES(2, 2015, 35,35,40,40); -- 150
		INSERT INTO GRADUATION_CREDIT VALUES(2, 2016, 25,35,35,45); -- 140 
		
		-- 수강 TB(수강 ID, 연도, 학기, 과목ID, 학생ID, 교수ID)
		INSERT INTO COURSE VALUES(1, 2015, '1', 1,4,9);
		INSERT INTO COURSE VALUES(2, 2015, '1', 2,4,9);
		INSERT INTO COURSE VALUES(3, 2015, '1', 3,4,9);
		INSERT INTO COURSE VALUES(4, 2015, '1', 4,4,11);
		INSERT INTO COURSE VALUES(5, 2015, '1', 5,4,11);
		
		-- 학점 TB(학점 id ,연도, 학기, 취득학점, 등급, 학점, 재수강여부, 과목id, 학생id, 학점열람시작일, 학점열람종료일)
		INSERT INTO CREDIT VALUES(1, 2015, '1', 3, 'A+', 3, 'N', 1, 4, '2015/06/16', '2015/07/01' );
		INSERT INTO CREDIT VALUES(2, 2015, '1', 2, 'F', 0, 'Y', 2,4, '2015/06/16', '2015/07/01' );
		INSERT INTO CREDIT VALUES(3, 2015, '1', 3, 'B+', 3, 'N', 3,4, '2015/06/16', '2015/07/01' );
		INSERT INTO CREDIT VALUES(4, 2015, '1', 3, 'C+', 3, 'N', 4,4, '2015/06/16', '2015/07/01' );
		INSERT INTO CREDIT VALUES(5, 2015, '1', 3, 'A+', 3, 'N', 5,4,'2015/06/16', '2015/07/01' );
		
		SELECT 	stu_graduation_exam
		FROM 	student
		WHERE 	stu_id ='1'
		
	
		