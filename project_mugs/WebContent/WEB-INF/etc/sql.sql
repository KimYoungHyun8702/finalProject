/* 1.사용자 */
CREATE TABLE USERS (
	USERS_ID VARCHAR2(20) NOT NULL, /* 사용자 ID */
	USERS_PASSWORD VARCHAR2(20) NOT NULL, /* 비밀번호 */
	USERS_NAME VARCHAR2(20) NOT NULL, /* 이름 */
	USERS_ENG_NAME VARCHAR2(20) NOT NULL, /* 영문성명 */
	USERS_RRN VARCHAR2(20) NOT NULL, /* 주민번호 */
	USERS_EMAIL VARCHAR2(50) NOT NULL, /* 이메일 */
	USERS_PHONE_NUM VARCHAR2(20) NOT NULL, /* 집 전화번호 */
	USERS_CELL_NUM VARCHAR2(20) NOT NULL, /* 핸드폰 번호 */
	USERS_NATIONAL VARCHAR2(50) NOT NULL, /* 국적 */
	USERS_CURRENT_ADDR VARCHAR2(300) NOT NULL, /* 현거주지 주소 */
	USERS_BORN_ADDR VARCHAR2(300) NOT NULL, /* 본적지 주소 */
	USERS_ENABLE NUMBER(1) NOT NULL, /* 인증가능상태 */
	USERS_PHOTO VARCHAR2(4000), /* 사진 */
	PRIMARY KEY(USERS_ID) /* 기본키 설정 */
);

/* 2.권한 */
CREATE TABLE AUTHORITIES (
	USERS_ID VARCHAR2(20) NOT NULL, /* 사용자 ID */
	AUTHORITIES_ROLE VARCHAR2(20) NOT NULL, /* 권한 */
	PRIMARY KEY(USERS_ID), /* 기본키 설정 */
	FOREIGN KEY (USERS_ID) REFERENCES USERS (USERS_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 3.공지사항 */
CREATE TABLE NOTICE (
	NOTICE_ID NUMBER NOT NULL, /* 공지사항 ID */
	NOTICE_CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
	NOTICE_DATE DATE NOT NULL, /* 글쓴날짜 */
	USERS_ID VARCHAR2(20) NOT NULL, /* 관리자 ID */
	PRIMARY KEY(NOTICE_ID), /* 기본키 설정 */
	FOREIGN KEY (USERS_ID) REFERENCES USERS(USERS_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 4.대학(학부) */
CREATE TABLE COLLEGE (
	COLLEGE_ID NUMBER NOT NULL, /* 단과대학 ID */
	COLLEGE_NAME VARCHAR2(30) NOT NULL, /* 단과대학명 */
	PRIMARY KEY(COLLEGE_ID) /* 기본키 설정 */
);

insert into COLLEGE values(1, '이공대학');
insert into COLLEGE values(2, '예술대학');
insert into COLLEGE values(3, '체육대학');
insert into COLLEGE values(4, '사회대학');
insert into COLLEGE values(5, '인문대학');
update COLLEGE set COLLEGE_NAME = '사회대학' where COLLEGE_ID = 4;
/* 5.학과 */
CREATE TABLE MAJOR (
	MAJOR_ID NUMBER NOT NULL, /* 학과 ID */
	MAJOR_NAME VARCHAR2(30) NOT NULL, /* 학과이름 */
	COLLEGE_ID NUMBER NOT NULL, /* 단과대학 ID */
	PRIMARY KEY(MAJOR_ID), /* 기본키 설정 */
	FOREIGN KEY (COLLEGE_ID) REFERENCES COLLEGE(COLLEGE_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

insert into MAJOR values(1, '컴퓨터공학과', 1);
insert into MAJOR values(2, '정보통신학과', 1);
insert into MAJOR values(3, '전기공학과', 1);
insert into MAJOR values(4, '전자공학과', 1);
insert into MAJOR values(5, '전파공학과', 1);

insert into MAJOR values(6, '연극영화학과', 2);
insert into MAJOR values(7, '공연예술학과', 2);
insert into MAJOR values(8, '방송예술학과', 2);
insert into MAJOR values(9, '무용학과', 2);
insert into MAJOR values(10, '극작과', 2);

insert into MAJOR values(11, '경호학과', 3);
insert into MAJOR values(12, '무도학과', 3);
insert into MAJOR values(13, '스포츠의학과', 3);
insert into MAJOR values(14, '체육산업학과', 3);
insert into MAJOR values(15, '체육학과', 3);

insert into MAJOR values(16, '법학과', 4);
insert into MAJOR values(17, '북한학과', 4);
insert into MAJOR values(18, '행정학과', 4);
insert into MAJOR values(19, '정치외교학과', 4);
insert into MAJOR values(20, '지리학과', 4);

insert into MAJOR values(21, '고고학과', 5);
insert into MAJOR values(22, '미술사학과', 5);
insert into MAJOR values(23, '사학과', 5);
insert into MAJOR values(24, '종교학과', 5);
insert into MAJOR values(25, '철학과', 5);

/* 6.건물 */
CREATE TABLE BUILDING (
	BUILDING_ID NUMBER NOT NULL, /* 건물 ID */
	BUILDING_NAME VARCHAR2(50) NOT NULL, /* 건물이름 */
	PRIMARY KEY(BUILDING_ID) /* 기본키 설정 */
);

insert into BUILDING values(1, '이공대학 신관');
insert into BUILDING values(2, '예술대학');
insert into BUILDING values(3, '체육대학');
insert into BUILDING values(4, '사회대학');
insert into BUILDING values(5, '인문대학');

/* 7.방 */
CREATE TABLE ROOM (
	ROOM_ID VARCHAR2(20) NOT NULL, /* 방 ID */
	BUILDING_ID NUMBER NOT NULL, /* 건물 ID */
	PRIMARY KEY(ROOM_ID), /* 기본키 설정 */
	FOREIGN KEY (BUILDING_ID) REFERENCES BUILDING(BUILDING_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

insert into ROOM values('1-101', 1);
insert into ROOM values('1-102', 1);
insert into ROOM values('1-103', 1);
insert into ROOM values('1-104', 1);
insert into ROOM values('1-105', 1);

insert into ROOM values('2-101', 2);
insert into ROOM values('2-102', 2);
insert into ROOM values('2-103', 2);
insert into ROOM values('2-104', 2);
insert into ROOM values('2-105', 2);

insert into ROOM values('3-101', 3);
insert into ROOM values('3-102', 3);
insert into ROOM values('3-103', 3);
insert into ROOM values('3-104', 3);
insert into ROOM values('3-105', 3);

insert into ROOM values('4-101', 4);
insert into ROOM values('4-102', 4);
insert into ROOM values('4-103', 4);
insert into ROOM values('4-104', 4);
insert into ROOM values('4-105', 4);

insert into ROOM values('5-101', 5);
insert into ROOM values('5-102', 5);
insert into ROOM values('5-103', 5);
insert into ROOM values('5-104', 5);
insert into ROOM values('5-105', 5);

/* 8.졸업학점 */
CREATE TABLE GRADUATION_CREDIT (
	MAJOR_ID NUMBER NOT NULL, /* 학과 ID */
	GRADUATION_CREDIT_YEAR NUMBER NOT NULL, /* 입학연도 */
	GRADUATION_CREDIT_SCORE NUMBER NOT NULL, /* 졸업학점 */
	PRIMARY KEY(MAJOR_ID, GRADUATION_CREDIT_YEAR), /* 기본키 설정 */
	FOREIGN KEY (MAJOR_ID) REFERENCES MAJOR(MAJOR_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 9.학점기준 */
CREATE TABLE STANDARD (
	STANDARD_YEAR NUMBER NOT NULL, /* 입학년도 */
	MAJOR_ID NUMBER NOT NULL, /* 학과 ID */
	STANDARD_MIN_CREDIT NUMBER NOT NULL, /* 최소학점 */
	STANDARD_MAX_CREDIT NUMBER NOT NULL, /* 최대학점 */
	STANDARD_MIN_SCHOLARSHIP NUMBER NOT NULL, /* 장학금최소학점 */
	STANDARD_DELAY_MIN_CREDIT NUMBER NOT NULL, /* 유예최소학점 */
	STANDARD_DELAY_MAX_CREDIT NUMBER NOT NULL, /* 유예최대학점 */
	PRIMARY KEY(STANDARD_YEAR, MAJOR_ID), /* 기본키 설정 */
	FOREIGN KEY (MAJOR_ID) REFERENCES MAJOR(MAJOR_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);


/* 10.학생 */
CREATE TABLE STUDENT (
	STU_ID VARCHAR2(20) NOT NULL, /* 학생 ID */
	STU_COURSE VARCHAR2(20) NOT NULL, /* 과정구분 */
	STU_ARMY VARCHAR2(20), /* 병영구분 */
	STU_ADMISSION_DATE DATE NOT NULL, /* 입학일자 */
	STU_GRADUATION_DATE DATE, /* 졸업일자 */
	STU_REGISTER_STATE VARCHAR2(20) NOT NULL, /* 학적구분 */
	STU_STUDENT_STATE VARCHAR2(20) NOT NULL, /* 학생구분 */
	STU_GRADE NUMBER NOT NULL, /* 학년 */
	STU_GRADUATION_EXAM CHAR(1), /* 졸업시험 패스여부 */
	STU_EARLY_GRADUATION CHAR(1) NOT NULL, /* 조기졸업 대상여부 */
	STU_SEMESTER VARCHAR2(20) NOT NULL, /* 학기 */
	MAJOR_ID NUMBER NOT NULL, /* 학과 ID */
	MAJOR_DUAL_ID NUMBER, /* 복수전공 ID */
	MAJOR_MINOR_ID NUMBER, /* 부전공 ID */
	PRIMARY KEY(STU_ID), /* 기본키 설정 */
	FOREIGN KEY (STU_ID) REFERENCES USERS(USERS_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (MAJOR_ID) REFERENCES MAJOR(MAJOR_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (MAJOR_DUAL_ID) REFERENCES MAJOR(MAJOR_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (MAJOR_MINOR_ID) REFERENCES MAJOR(MAJOR_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 11.교수 */
CREATE TABLE PROFESSOR (
	PRO_ID VARCHAR2(20) NOT NULL, /* 교수 ID */
	PRO_UNIVERSITY VARCHAR2(50) NOT NULL, /* 졸업대학 */
	PRO_GRAD_SCHOOL VARCHAR2(50) NOT NULL, /* 졸업대학원 */
	PRO_OFFICE_PHONE_NUM VARCHAR2(30), /* 교수실전화번호 */
	PRO_LABORATORY_PHONE_NUM VARCHAR2(30), /* 연구실전화번호 */
	MAJOR_ID NUMBER, /* 소속학과 ID */
	OFFICE_ID VARCHAR2(20), /* 교수실 ID */
	LABORATORY_ID VARCHAR2(20), /* 연구실 ID */
	PRIMARY KEY(PRO_ID), /* 기본키 설정 */
	FOREIGN KEY (PRO_ID) REFERENCES USERS(USERS_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (MAJOR_ID) REFERENCES MAJOR(MAJOR_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (OFFICE_ID) REFERENCES ROOM(ROOM_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (LABORATORY_ID) REFERENCES ROOM(ROOM_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 12.과목 */
CREATE TABLE SUBJECT (
	SUBJECT_ID NUMBER NOT NULL, /* 과목 ID */
	SUBJECT_NAME VARCHAR2(50) NOT NULL, /* 과목이름 */
	SUBJECT_TIME VARCHAR2(100) NOT NULL, /* 강의시간 */
	SUBJECT_TYPE VARCHAR2(20) NOT NULL, /* 이수구분 */
	SUBJECT_CREDIT NUMBER NOT NULL, /* 학점 */
	SUBJECT_CAPACITY NUMBER NOT NULL, /* 정원 */
	SUBJECT_REQUEST NUMBER NOT NULL, /* 신청인원 */
	SUBJECT_GRADE NUMBER, /* 학년 */
	SUBJECT_CLASS VARCHAR2(20) NOT NULL, /* 분반 */
	SUBJECT_CLOSE_CLASS CHAR(1) NOT NULL, /* 폐강여부 */
	SUBJECT_SEMESTER VARCHAR2(20) NOT NULL, /* 학기 */
	MAJOR_ID NUMBER, /* 학과 ID */
	LECTURE_ID VARCHAR2(20), /* 강의실 ID */
	PRIMARY KEY(SUBJECT_ID), /* 기본키 설정 */
	FOREIGN KEY (MAJOR_ID) REFERENCES MAJOR(MAJOR_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (LECTURE_ID) REFERENCES ROOM(ROOM_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

insert into SUBJECT values(1, 'Java기초', '월(1, 2)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-101');
insert into SUBJECT values(2, 'C언어기초', '화(3, 4)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-102');
insert into SUBJECT values(3, '정보보안', '수(5, 6)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-103');
insert into SUBJECT values(4, '데이터통신', '목(1, 2)', '필수전공', 3, 30, 10, 3, '1분반', 'N', '1학기', 1,'1-104');
insert into SUBJECT values(5, '데이터베이스', '금(3, 4)', '필수전공', 3, 30, 10, 4, '1분반', 'N', '1학기', 1,'1-105');

insert into SUBJECT values(6, '임베디드', '월(1, 2)', '선택전공', 2, 50, 30, 3, '1분반', 'N', '1학기', 1,'1-105');
insert into SUBJECT values(7, '웹애니메이션', '화(3, 4)', '선택전공', 2, 50, 30, 1, '1분반', 'N', '1학기', 1,'1-104');
insert into SUBJECT values(8, '포토샵기초', '수(5, 6)', '선택전공', 2, 50, 30, 2, '1분반', 'N', '1학기', 1,'1-103');
insert into SUBJECT values(9, 'IT서비스', '목(1, 2)', '선택전공', 2, 50, 30, 3, '1분반', 'N', '1학기', 1,'1-102');
insert into SUBJECT values(10, '이산수학', '금(3, 4)', '선택전공', 2, 50, 30, 2, '1분반', 'N', '1학기', 1,'1-101');


insert into SUBJECT values(11, '영어1', '월(1, 2)', '필수교양', 2, 50, 30, 3, '1분반', 'N', '1학기', NULL,'2-105');
insert into SUBJECT values(12, '일본어1', '화(3, 4)', '필수교양', 2, 50, 30, 1, '1분반', 'N', '1학기', NULL,'2-104');
insert into SUBJECT values(13, '중국어1', '수(5, 6)', '필수교양', 2, 50, 30, 2, '1분반', 'N', '1학기', NULL,'2-103');
insert into SUBJECT values(14, '고급영어', '목(1, 2)', '필수교양', 2, 50, 30, 3, '1분반', 'N', '1학기', NULL,'3-102');
insert into SUBJECT values(15, '중국어2', '금(3, 4)', '필수교양', 2, 50, 30, 2, '1분반', 'N', '1학기', NULL,'4-101');


insert into SUBJECT values(16, '세계사산책', '월(1, 2)', '선택교양', 2, 50, 30, NULL, '1분반', 'N', '1학기', NULL,'5-105');
insert into SUBJECT values(17, '일본문화기행', '화(3, 4)', '선택교양', 2, 50, 30, NULL, '1분반', 'N', '1학기', NULL,'1-104');
insert into SUBJECT values(18, '당구의정석', '수(5, 6)', '선택교양', 2, 50, 30, NULL, '1분반', 'N', '1학기', NULL,'2-103');
insert into SUBJECT values(19, '볼링의정석', '목(1, 2)', '선택교양', 2, 50, 30, NULL, '1분반', 'N', '1학기', NULL,'3-102');
insert into SUBJECT values(20, '매너와교양', '금(3, 4)', '선택교양', 2, 50, 30, NULL, '1분반', 'N', '1학기', NULL,'4-101');


/*********************************************************************************************************/

insert into SUBJECT values(1, 'Java기초', '월(1, 2)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-101');
insert into SUBJECT values(2, 'C언어기초', '화(3, 4)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-102');
insert into SUBJECT values(3, '정보보안', '수(5, 6)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-103');
insert into SUBJECT values(4, '데이터통신', '목(1, 2)', '필수전공', 3, 30, 10, 3, '1분반', 'N', '1학기', 1,'1-104');
insert into SUBJECT values(5, '데이터베이스', '금(3, 4)', '필수전공', 3, 30, 10, 4, '1분반', 'N', '1학기', 1,'1-105');

insert into SUBJECT values(1, '임베디드', '월(1, 2)', '선택전공', 2, 50, 30, 3, '1분반', 'N', '1학기', 1,'1-105');
insert into SUBJECT values(2, '웹애니메이션', '화(3, 4)', '선택전공', 2, 50, 30, 1, '1분반', 'N', '1학기', 1,'1-104');
insert into SUBJECT values(3, '포토샵기초', '수(5, 6)', '선택전공', 2, 50, 30, 2, '1분반', 'N', '1학기', 1,'1-103');
insert into SUBJECT values(4, 'IT서비스', '목(1, 2)', '선택전공', 2, 50, 30, 3, '1분반', 'N', '1학기', 1,'1-102');
insert into SUBJECT values(5, '이산수학', '금(3, 4)', '선택전공', 2, 50, 30, 2, '1분반', 'N', '1학기', 1,'1-101');




insert into SUBJECT values(1, 'Java기초', '월(1, 2)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-101');
insert into SUBJECT values(2, 'C언어기초', '화(3, 4)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-102');
insert into SUBJECT values(3, '정보보안', '수(5, 6)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-103');
insert into SUBJECT values(4, '데이터통신', '목(1, 2)', '필수전공', 3, 30, 10, 3, '1분반', 'N', '1학기', 1,'1-104');
insert into SUBJECT values(5, '데이터베이스', '금(3, 4)', '필수전공', 3, 30, 10, 4, '1분반', 'N', '1학기', 1,'1-105');

insert into SUBJECT values(1, '임베디드', '월(1, 2)', '선택전공', 2, 50, 30, 3, '1분반', 'N', '1학기', 1,'1-105');
insert into SUBJECT values(2, '웹애니메이션', '화(3, 4)', '선택전공', 2, 50, 30, 1, '1분반', 'N', '1학기', 1,'1-104');
insert into SUBJECT values(3, '포토샵기초', '수(5, 6)', '선택전공', 2, 50, 30, 2, '1분반', 'N', '1학기', 1,'1-103');
insert into SUBJECT values(4, 'IT서비스', '목(1, 2)', '선택전공', 2, 50, 30, 3, '1분반', 'N', '1학기', 1,'1-102');
insert into SUBJECT values(5, '이산수학', '금(3, 4)', '선택전공', 2, 50, 30, 2, '1분반', 'N', '1학기', 1,'1-101');




insert into SUBJECT values(1, 'Java기초', '월(1, 2)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-101');
insert into SUBJECT values(2, 'C언어기초', '화(3, 4)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-102');
insert into SUBJECT values(3, '정보보안', '수(5, 6)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-103');
insert into SUBJECT values(4, '데이터통신', '목(1, 2)', '필수전공', 3, 30, 10, 3, '1분반', 'N', '1학기', 1,'1-104');
insert into SUBJECT values(5, '데이터베이스', '금(3, 4)', '필수전공', 3, 30, 10, 4, '1분반', 'N', '1학기', 1,'1-105');

insert into SUBJECT values(1, '임베디드', '월(1, 2)', '선택전공', 2, 50, 30, 3, '1분반', 'N', '1학기', 1,'1-105');
insert into SUBJECT values(2, '웹애니메이션', '화(3, 4)', '선택전공', 2, 50, 30, 1, '1분반', 'N', '1학기', 1,'1-104');
insert into SUBJECT values(3, '포토샵기초', '수(5, 6)', '선택전공', 2, 50, 30, 2, '1분반', 'N', '1학기', 1,'1-103');
insert into SUBJECT values(4, 'IT서비스', '목(1, 2)', '선택전공', 2, 50, 30, 3, '1분반', 'N', '1학기', 1,'1-102');
insert into SUBJECT values(5, '이산수학', '금(3, 4)', '선택전공', 2, 50, 30, 2, '1분반', 'N', '1학기', 1,'1-101');



insert into SUBJECT values(1, 'Java기초', '월(1, 2)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-101');
insert into SUBJECT values(2, 'C언어기초', '화(3, 4)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-102');
insert into SUBJECT values(3, '정보보안', '수(5, 6)', '필수전공', 3, 30, 10, 1, '1분반', 'N', '1학기', 1,'1-103');
insert into SUBJECT values(4, '데이터통신', '목(1, 2)', '필수전공', 3, 30, 10, 3, '1분반', 'N', '1학기', 1,'1-104');
insert into SUBJECT values(5, '데이터베이스', '금(3, 4)', '필수전공', 3, 30, 10, 4, '1분반', 'N', '1학기', 1,'1-105');

insert into SUBJECT values(1, '임베디드', '월(1, 2)', '선택전공', 2, 50, 30, 3, '1분반', 'N', '1학기', 1,'1-105');
insert into SUBJECT values(2, '웹애니메이션', '화(3, 4)', '선택전공', 2, 50, 30, 1, '1분반', 'N', '1학기', 1,'1-104');
insert into SUBJECT values(3, '포토샵기초', '수(5, 6)', '선택전공', 2, 50, 30, 2, '1분반', 'N', '1학기', 1,'1-103');
insert into SUBJECT values(4, 'IT서비스', '목(1, 2)', '선택전공', 2, 50, 30, 3, '1분반', 'N', '1학기', 1,'1-102');
insert into SUBJECT values(5, '이산수학', '금(3, 4)', '선택전공', 2, 50, 30, 2, '1분반', 'N', '1학기', 1,'1-101');




/* 13.교수담당과목 */
CREATE TABLE PROFESSOR_SUBJECT (
	PRO_SUBJECT_ID NUMBER NOT NULL, /* 교수담당과목 ID */
	PRO_SUBJECT_SEMESTER VARCHAR2(20) NOT NULL, /* 학기 */
	PRO_SUBJECT_YEAR NUMBER NOT NULL, /* 연도 */
	PRO_ID VARCHAR2(20) NOT NULL, /* 교수 ID */
	SUBJECT_ID NUMBER NOT NULL, /* 과목 ID */
	PRIMARY KEY(PRO_SUBJECT_ID), /* 기본키 설정 */
	FOREIGN KEY (PRO_ID) REFERENCES PROFESSOR(PRO_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECT(SUBJECT_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 14.강의계획서 */
CREATE TABLE SUBJECT_PLAN (
	PLAN_ID NUMBER NOT NULL, /* 강의계획서 ID */
	PLAN_SUMMARY VARCHAR2(100) NOT NULL, /* 교과목개요 */
	PLAN_MARKING_METHOD VARCHAR2(4000) NOT NULL, /* 채점방식 */
	PLAN_LESSON_GOAL VARCHAR2(4000) NOT NULL, /* 학습목표 */
	PLAN_WEEK_CONTENT VARCHAR2(4000) NOT NULL, /* 주차별 내용 */
	PLAN_BOOKINFO VARCHAR2(4000) NOT NULL, /* 교재정보 */
	PLAN_BIBLIOGRAPHY VARCHAR2(4000) NOT NULL, /* 참고문헌 */
	PLAN_YEAR NUMBER NOT NULL, /* 연도 */
	PLAN_SEMESTER VARCHAR2(20) NOT NULL, /* 학기 */
	PLAN_NOTE VARCHAR2(4000), /* 비고 */
	PRO_ID VARCHAR2(20) NOT NULL, /* 교수 ID */
	SUBJECT_ID NUMBER NOT NULL, /* 과목 ID */
	PRIMARY KEY(PLAN_ID), /* 기본키 설정 */
	FOREIGN KEY (PRO_ID) REFERENCES PROFESSOR(PRO_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECT(SUBJECT_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 15.지도학생 */
CREATE TABLE GUIDENCE_STUDENT (
	GUIDENCE_STUDENT_ID NUMBER NOT NULL, /* 지도학생 ID */
	CONSULTANT_CONTENT VARCHAR2(4000), /* 상담내용 */
	CONSULTANT_DATE DATE, /* 상담일자 */
	PRO_ID VARCHAR2(20) NOT NULL, /* 교수 ID */
	STU_ID VARCHAR2(20) NOT NULL, /* 학생 ID */
	PRIMARY KEY(GUIDENCE_STUDENT_ID), /* 기본키 설정 */
	FOREIGN KEY (PRO_ID) REFERENCES PROFESSOR(PRO_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (STU_ID) REFERENCES STUDENT(STU_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 16.수강 */
CREATE TABLE COURSE (
	COURSE_ID NUMBER NOT NULL, /* 수강 ID */
	COURSE_YEAR NUMBER NOT NULL, /* 연도 */
	COURSE_SEMESTER VARCHAR2(20) NOT NULL, /* 학기 */
	SUBJECT_ID NUMBER NOT NULL, /* 과목 ID */
	STU_ID VARCHAR2(20) NOT NULL, /* 학생 ID */
	PRO_ID VARCHAR2(20) NOT NULL, /* 교수 ID */
	PRIMARY KEY(COURSE_ID), /* 기본키 설정 */
	FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECT(SUBJECT_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (PRO_ID) REFERENCES PROFESSOR(PRO_ID) ON DELETE CASCADE,/* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (STU_ID) REFERENCES STUDENT(STU_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 17.학점 */
CREATE TABLE CREDIT (
	CREDIT_ID NUMBER NOT NULL, /* 학점 ID */
	CREDIT_YEAR NUMBER NOT NULL, /* 연도 */
	CREDIT_SEMESTER VARCHAR2(20) NOT NULL, /* 학기 */
	CREDIT_ACQUIRE NUMBER NOT NULL, /* 취득학점 */
	CREDIT_GRADE VARCHAR2(20) NOT NULL, /* 등급 */
	CREDIT_SCORE NUMBER NOT NULL, /* 학점 */
	CREDIT_RECOURCE CHAR(1) NOT NULL, /* 재수강여부 */
	SUBJECT_ID NUMBER NOT NULL, /* 과목 ID */
	STU_ID VARCHAR2(20) NOT NULL, /* 학생 ID */
	CREDIT_READ_START DATE NOT NULL, /* 학점열람시작일 */
	CREDIT_READ_END DATE NOT NULL, /* 학점열람종료일 */
	PRIMARY KEY(CREDIT_ID), /* 기본키 설정 */
	FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECT(SUBJECT_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (STU_ID) REFERENCES STUDENT(STU_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 18.평가응답 */
CREATE TABLE EVALUATION_ANSWER (
	EVALUATION_ANSWER_ID NUMBER NOT NULL, /* 평가응답 ID */
	EVALUATION_ANSWER_STATE CHAR(1) NOT NULL, /* 평가응답여부 */
	EVALUATION_ANSWER_YEAR NUMBER NOT NULL, /* 연도 */
	EVALUATION_ANSWER_SEMESTER VARCHAR2(20) NOT NULL, /* 학기 */
	STU_ID VARCHAR2(20) NOT NULL, /* 학생 ID */
	SUBJECT_ID NUMBER NOT NULL, /* 과목 ID */
	PRIMARY KEY(EVALUATION_ANSWER_ID), /* 기본키 설정 */
	FOREIGN KEY (STU_ID) REFERENCES STUDENT(STU_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECT(SUBJECT_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 19.평가 */
CREATE TABLE EVALUATION (
	EVALUATION_ID NUMBER NOT NULL, /* 평가 ID */
	EVALUATION_YEAR NUMBER NOT NULL, /* 연도 */
	EVALUATION_SEMESTER VARCHAR2(20) NOT NULL, /* 학기 */
	EVALUATION_TASK NUMBER NOT NULL, /* 과제(평점) */
	EVALUATION_EXAM NUMBER NOT NULL, /* 시험(평점) */
	EVALUATION_READY NUMBER NOT NULL, /* 수업준비도(평점) */
	EVALUATION_PASSION NUMBER NOT NULL, /* 수업열정도(평점) */
	EVALUATION_QUESTION NUMBER NOT NULL, /* 질의응답(평점 */
	PRO_ID VARCHAR2(20) NOT NULL, /* 교수 ID */
	SUBJECT_ID NUMBER NOT NULL, /* 과목 ID */
	EVALUATION_START DATE NOT NULL, /* 평가시작일 */
	EVALUATION_END DATE NOT NULL, /* 평가종료일 */
	EVALUATION_READ_START DATE NOT NULL, /* 평가열람시작일 */
	EVALUATION_READ_END DATE NOT NULL, /* 평가열람종료일 */
	PRIMARY KEY(EVALUATION_ID), /* 기본키 설정 */
	FOREIGN KEY (PRO_ID) REFERENCES PROFESSOR(PRO_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECT(SUBJECT_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 각 테이블의 삭제 */

DROP TABLE EVALUATION;
DROP TABLE EVALUATION_ANSWER;
DROP TABLE CREDIT;
DROP TABLE COURSE;
DROP TABLE GUIDENCE_STUDENT;
DROP TABLE SUBJECT_PLAN;
DROP TABLE PROFESSOR_SUBJECT;
DROP TABLE SUBJECT;
DROP TABLE PROFESSOR;
DROP TABLE STUDENT;
DROP TABLE STANDARD;
DROP TABLE GRADUATION_CREDIT;
DROP TABLE ROOM;
DROP TABLE BUILDING;
DROP TABLE MAJOR;
DROP TABLE COLLEGE;
DROP TABLE NOTICE;
DROP TABLE AUTHORTIES;
DROP TABLE USERS;

/* 각 테이블의 기본키에 대한 필요 시퀀스 생성 */
CREATE SEQUENCE EVALUATION_ANSWER_ID_SEQ; /* 평가응답 테이블의 기본키에 대한 시퀀스 생성 */
CREATE SEQUENCE GUIDENCE_STUDENT_ID_SEQ; /* 지도학생 테이블의 기본키에 대한 시퀀스 생성 */
CREATE SEQUENCE SUBJECT_ID_SEQ; /* 과목 테이블의 기본키에 대한 시퀀스 생성 */
CREATE SEQUENCE PLAN_ID_SEQ; /* 강의계획서 테이블의 기본키에 대한 시퀀스 생성 */
CREATE SEQUENCE NOTICE_ID_SEQ; /* 공지사항 테이블의 기본키에 대한 시퀀스 생성 */
CREATE SEQUENCE PRO_SUBJECT_ID_SEQ; /* 교수담당과목 테이블의 기본키에 대한 시퀀스 생성 */
CREATE SEQUENCE EVALUATION_ID_SEQ; /* 평가 테이블의 기본키에 대한 시퀀스 생성 */
CREATE SEQUENCE MAJOR_ID_SEQ; /* 학과 테이블의 기본키에 대한 시퀀스 생성 */
CREATE SEQUENCE COLLEGE_ID_SEQ; /* 대학(학부) 테이블의 기본키에 대한 시퀀스 생성 */
CREATE SEQUENCE COURSE_ID_SEQ; /* 수강 테이블의 기본키에 대한 시퀀스 생성 */
CREATE SEQUENCE CREDIT_ID_SEQ; /* 학점 테이블의 기본키에 대한 시퀀스 생성 */

/* 각 테이블의 기본키에 대한 필요 시퀀스 삭제 */

DROP SEQUENCE EVALUATION_ANSWER_ID_SEQ; /* 평가응답 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE GUIDENCE_STUDENT_ID_SEQ; /* 지도학생 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE SUBJECT_ID_SEQ; /* 과목 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE PLAN_ID_SEQ; /* 강의계획서 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE NOTICE_ID_SEQ; /* 공지사항 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE PRO_SUBJECT_ID_SEQ; /* 교수담당과목 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE EVALUATION_ID_SEQ; /* 평가 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE MAJOR_ID_SEQ; /* 학과 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE COLLEGE_ID_SEQ; /* 대학(학부) 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE COURSE_ID_SEQ; /* 수강 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE CREDIT_ID_SEQ;

SELECT		major_id,
				major_name,
				college_id
	FROM 		major
	where college_id=4;