/* 1.사용자 */
CREATE TABLE USERS (
   USERS_ID VARCHAR2(20) NOT NULL, /* 사용자 ID */
   USERS_PASSWORD VARCHAR2(300) NOT NULL, /* 비밀번호 */
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

/* 5.학과 */
CREATE TABLE MAJOR (
	MAJOR_ID NUMBER NOT NULL, /* 학과 ID */
	MAJOR_NAME VARCHAR2(30) NOT NULL, /* 학과이름 */
	COLLEGE_ID NUMBER NOT NULL, /* 단과대학 ID */
	PRIMARY KEY(MAJOR_ID), /* 기본키 설정 */
	FOREIGN KEY (COLLEGE_ID) REFERENCES COLLEGE(COLLEGE_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);


/* 6.건물 */
CREATE TABLE BUILDING (
   BUILDING_ID NUMBER PRIMARY KEY, /* 건물 ID *//* 기본키 설정 */
   BUILDING_NAME VARCHAR2(50) UNIQUE NOT NULL, /* 건물이름 */
   BUILDING_IMG VARCHAR2(4000) UNIQUE NOT NULL, /* 사진 URL경로 */
   BUILDING_X NUMBER UNIQUE NOT NULL, /*건물 X좌표*/
   BUILDING_Y NUMBER UNIQUE NOT NULL, /*건물 Y좌표*/
   BUILDING_PHONE_NUM VARCHAR2(20) UNIQUE NOT NULL, /*건물 전화번호*/
   BUILDING_ADDR VARCHAR2(300) UNIQUE NOT NULL /*건물 주소*/
);


/* 7.방 */
CREATE TABLE ROOM (
	ROOM_ID NUMBER NOT NULL, /* 방 ID */
	ROOM_NAME VARCHAR2(20) NOT NULL, /* 방 이름 */
	BUILDING_ID NUMBER NOT NULL, /* 건물 ID */
	PRIMARY KEY(ROOM_ID), /* 기본키 설정 */
	FOREIGN KEY (BUILDING_ID) REFERENCES BUILDING(BUILDING_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);


/* 8.졸업학점 */
CREATE TABLE GRADUATION_CREDIT (
	MAJOR_ID NUMBER NOT NULL, /* 학과 ID */
	GRADUATION_CREDIT_YEAR NUMBER NOT NULL, /* 입학연도 */
	GRAD_VITAL_EDU_CREDIT NUMBER NOT NULL, /* 교양필수 졸업학점 */
	GRAD_SELECT_EDU_CREDIT NUMBER NOT NULL, /* 교양선택 졸업학점 */
	GRAD_VITAL_MAJOR_CREDIT NUMBER NOT NULL, /* 전공필수 졸업학점 */
	GRAD_SELECT_MAJOR_CREDIT NUMBER NOT NULL, /* 전공선택 졸업학점 */
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

/* 11. 휴복학신청 */
CREATE TABLE LEAVERETURNAPPLICATION (
   LRAPPLICATION_ID NUMBER NOT NULL, /* 휴복학신청ID */
   LRAPPLICATION_TYPE VARCHAR2(20) NOT NULL, /* 휴복학종류 */
   LRAPPLICATION_START_DATE DATE NOT NULL, /* 신청일자 */
   LRAPPLICATION_FINISH_DATE DATE, /* 승인일자 */
   LRAPPLICATION_STATE VARCHAR2(20) NOT NULL, /* 신청상태 */
   STU_ID VARCHAR2(20), /* 학생 ID */
   PRIMARY KEY(LRAPPLICATION_ID), /* 기본키 설정 */
   FOREIGN KEY(STU_ID) REFERENCES STUDENT(STU_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 12.교수 */
CREATE TABLE PROFESSOR (
	PRO_ID VARCHAR2(20) NOT NULL, /* 교수 ID */
	PRO_UNIVERSITY VARCHAR2(50) NOT NULL, /* 졸업대학 */
	PRO_GRAD_SCHOOL VARCHAR2(50) NOT NULL, /* 졸업대학원 */
	PRO_OFFICE_PHONE_NUM VARCHAR2(30), /* 교수실전화번호 */
	PRO_LABORATORY_PHONE_NUM VARCHAR2(30), /* 연구실전화번호 */
	MAJOR_ID NUMBER, /* 소속학과 ID */
	OFFICE_ID NUMBER, /* 교수실 ID */
	LABORATORY_ID NUMBER, /* 연구실 ID */
	PRIMARY KEY(PRO_ID), /* 기본키 설정 */
	FOREIGN KEY (PRO_ID) REFERENCES USERS(USERS_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (MAJOR_ID) REFERENCES MAJOR(MAJOR_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (OFFICE_ID) REFERENCES ROOM(ROOM_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (LABORATORY_ID) REFERENCES ROOM(ROOM_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 13.과목 */
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
	LECTURE_ID NUMBER, /* 강의실 ID */
	PRIMARY KEY(SUBJECT_ID), /* 기본키 설정 */
	FOREIGN KEY (MAJOR_ID) REFERENCES MAJOR(MAJOR_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (LECTURE_ID) REFERENCES ROOM(ROOM_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 14.교수담당과목 */
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

/* 15.강의계획서 */
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

/* 16.지도학생 */
CREATE TABLE GUIDANCE_STUDENT (
	GUIDANCE_STUDENT_ID NUMBER NOT NULL, /* 지도학생 ID */
	CONSULTANT_CONTENT VARCHAR2(4000), /* 상담내용 */
	CONSULTANT_DATE DATE, /* 상담일자 */
	PRO_ID VARCHAR2(20) NOT NULL, /* 교수 ID */
	STU_ID VARCHAR2(20) NOT NULL, /* 학생 ID */
	PRIMARY KEY(GUIDANCE_STUDENT_ID), /* 기본키 설정 */
	FOREIGN KEY (PRO_ID) REFERENCES PROFESSOR(PRO_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (STU_ID) REFERENCES STUDENT(STU_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 17.수강 */
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

/* 18.학점 */
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
	PRIMARY KEY(CREDIT_ID), /* 기본키 설정 */
	FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECT(SUBJECT_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (STU_ID) REFERENCES STUDENT(STU_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 19.학점포기 */
CREATE TABLE CREDIT_GIVE_UP (
   CGU_ID NUMBER NOT NULL, /* 학점 포기 ID */
   CGU_YEAR NUMBER NOT NULL, /* 신청 연도 */
   CGU_SEMESTER VARCHAR2(20) NOT NULL, /* 신청 학기 */
   CGU_START_DATE DATE NOT NULL, /* 신청 일자 */
   CGU_FINISH_DATE DATE, /* 승인 일자 */
   CGU_STATE VARCHAR2(20) NOT NULL, /* 신청 상태 */
   CREDIT_ID NUMBER NOT NULL, /* 학점 ID */
   PRIMARY KEY(CGU_ID), /* 기본키 설정 */  
   FOREIGN KEY(CREDIT_ID) REFERENCES CREDIT(CREDIT_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);

/* 20.평가응답 */
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

/* 21.평가 */
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
	PRIMARY KEY(EVALUATION_ID), /* 기본키 설정 */
	FOREIGN KEY (PRO_ID) REFERENCES PROFESSOR(PRO_ID) ON DELETE CASCADE, /* 외래키 제약조건 및 DELETE 제약조건 설정 */
	FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECT(SUBJECT_ID) ON DELETE CASCADE /* 외래키 제약조건 및 DELETE 제약조건 설정 */
);



/* 22.학사경고 */
CREATE TABLE ACADEMIC_PROBATION(
	PROBATION_ID NUMBER NOT NULL, --학사경고 ID
	PROBATION_YEAR NUMBER NOT NULL, -- 학사경고 받은 연도
	PROBATION_SEMESTER VARCHAR2(20) NOT NULL, -- 학사경고 받은 학기
	PROBATION_CREDIT_AVERAGE NUMBER NOT NULL, -- 학사경고을 받은 평균 학점.
	STU_ID VARCHAR2(20) NOT NULL, -- 학생 ID
	PRIMARY KEY(PROBATION_ID), -- 기본키 설정
	FOREIGN KEY(STU_ID) REFERENCES STUDENT(STU_ID) ON DELETE CASCADE
);

/* 23.학사일정 */
CREATE TABLE ACADEMIC_CALENDAR (
   CALENDAR_ID NUMBER NOT NULL, /* 학사일정 ID */	
   CALENDAR_YEAR NUMBER NOT NULL, /* 학사연도 */  
   CALENDAR_START DATE NOT NULL, /* 일정시작일 */
   CALENDAR_FINISH DATE NOT NULL, /* 일정종료일 */
   CALENDAR_NAME VARCHAR2(4000) NOT NULL, /* 학사일정명 */
   PRIMARY KEY(CALENDAR_ID) /* 기본키 설정 */
);

--학점포기는 학점 아래, 휴복학 신청은 학생테이블 아래에



/* 각 테이블의 삭제 */
DROP TABLE ACADEMIC_CALENDAR;
DROP TABLE ACADEMIC_PROBATION;
DROP TABLE EVALUATION;
DROP TABLE EVALUATION_ANSWER;
DROP TABLE CREDIT_GIVE_UP;
DROP TABLE CREDIT;
DROP TABLE COURSE;
DROP TABLE GUIDANCE_STUDENT;
DROP TABLE SUBJECT_PLAN;
DROP TABLE PROFESSOR_SUBJECT;
DROP TABLE SUBJECT;
DROP TABLE PROFESSOR;
DROP TABLE LEAVERETURNAPPLICATION;
DROP TABLE STUDENT;
DROP TABLE STANDARD;
DROP TABLE GRADUATION_CREDIT;
DROP TABLE ROOM;
DROP TABLE BUILDING;
DROP TABLE MAJOR;
DROP TABLE COLLEGE;
DROP TABLE NOTICE;
DROP TABLE AUTHORITIES;
DROP TABLE USERS;






/* 각 테이블의 기본키에 대한 필요 시퀀스 생성 */

CREATE SEQUENCE EVALUATION_ANSWER_ID_SEQ; /* 평가응답 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE GUIDENCE_STUDENT_ID_SEQ; /* 지도학생 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE SUBJECT_ID_SEQ; /* 과목 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE PLAN_ID_SEQ; /* 강의계획서 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE NOTICE_ID_SEQ; /* 공지사항 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE PRO_SUBJECT_ID_SEQ; /* 교수담당과목 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE EVALUATION_ID_SEQ; /* 평가 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE MAJOR_ID_SEQ; /* 학과 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE COLLEGE_ID_SEQ; /* 대학(학부) 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE COURSE_ID_SEQ; /* 수강 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE CREDIT_ID_SEQ;/* 학점 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE PROBATION_ID_SEQ;/* 학사경고 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE CALENDAR_ID_SEQ;/* 학사일정 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE BUILDING_ID_SEQ;/* 건물 테이블의 기본키에 대한 시퀀스 삭제 */
CREATE SEQUENCE ROOM_ID_SEQ;/* 방 테이블의 기본키에 대한 시퀀스 삭제*/
CREATE SEQUENCE LRAPPLICATION_ID_SEQ;
CREATE SEQUENCE CGU_ID_SEQ;

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
DROP SEQUENCE CREDIT_ID_SEQ;/* 학점 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE PROBATION_ID_SEQ;/* 학사경고 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE CALENDAR_ID_SEQ;/* 학사일정 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE BUILDING_ID_SEQ;/* 건물 테이블의 기본키에 대한 시퀀스 삭제 */
DROP SEQUENCE ROOM_ID_SEQ;/* 방 테이블의 기본키에 대한 시퀀스 삭제*/
DROP SEQUENCE LRAPPLICATION_ID_SEQ;
DROP SEQUENCE CGU_ID_SEQ;



 -- 유저 데이터 삽입 (학생 - 13년~17년 기준으로 EX-20130001 
--				     교수 - 숫자 네자리 EX-0001 )
INSERT INTO USERS VALUES 
( '0','$2a$10$6xOJ8ucrzotA7KlJYy.tV./pPyMFYVJ826PEXafe1.b4XDQEKSgdy','관리자','1','1',
'1','1','1','1',
'1', 
'1',1, null);
-- 김성환 (건축학과교수)
INSERT INTO USERS VALUES  
( '1001','$2a$10$rT4WgJmrWDULsWr..2YuruNKM69mFfijjsskYJgtfTElGkzzYRU/u','김성환','kimseunghwan','750872-1989424',
'hwan@naver.com','02-654-6548','010-6547-1269','한국',
'인천 중구 용우서로 272', 
'인천 중구 차이나타운 879-5',1, null);
--김장규 (영어영문학과 교수)
INSERT INTO USERS VALUES 
( '1002','$2a$10$BxlcrG3ZsKsxmh/ln3GuEeNT.pTmb.gfGNW7dbPgXc5/3SR0np9jC','김장규','kimjanggyu','610572-1547872',
'jang@naver.com','02-647-6481','010-6154-8756','한국',
'서울 용산구 이태원로 15길 123-234', 
'서울 강남구 봉은사로 5',1, null);
--정은지 (문예창작학과 교수)
INSERT INTO USERS VALUES 
( '1003','$2a$10$wS2JrTssfU6IzWnme2G4Yu1Lu9CA5tzOAWBDfDvR76GT6a3a61PUa','정은지','jungjunji','678115-2567874',
'jung@naver.com','02-615-6549','010-9654-9648','한국',
'서울 마포구 성미산로 161-8', 
'서울 중수 세종대로 1길',1, null);
INSERT INTO USERS VALUES 
( '1004','$2a$10$sCaeqyV4npc8EJ2NmrMaZe3teWIsodxYY311nWQSj9k1rMw51Cnli','노현식','nohyunsik','7105497-1678726',
'sik@naver.com','02-974-9875','010-9687-1891','한국',
'서울 중구 창경궁로 62-29', 
'서울 관악구 낙성대역길 8',1, null);
INSERT INTO USERS VALUES 
( '1005','$2a$10$.YpQ..ksPEjLAxHbD77aBOUpwhBt4kDhIJB5nrmWk0CWm1q49AyN6','김형주','kimhyungjoo','754607-1897421',
'joo@naver.com','02-987-5647','010-4954-8124','한국',
'서울 강남구 강남대로 452', 
'서울 강남구 논현로 175',1, null);
INSERT INTO USERS VALUES 
( '1006','$2a$10$QgWLsV7dcutTYEYScd9u4OR02pTzEKLdnqp5Xhnml0XuKcNkmIUxK','조인성','joinsung','830978-1987452',
'insung@naver.com','02-874-9857','010-5569-4658','한국',
'서울 서초구 사평대로 205 CENTRALCITY 반포천 874', 
'서울 중구 을지로 30',1, null);

INSERT INTO USERS VALUES 
( '20130001','$2a$10$5Q2/t5diBRDfYvjXT96nhOJz1v9hxeHoZ1f.KEE4RmEzNH90N6i92','이병문','leebyungmun','900823-1579887',
'lee@naver.com','02-756-2479','010-3838-7229','한국',
'경기 고양시 일산동구 장항동 달빛마을 701동 801호', 
'경기 고양시 덕양구 화정동 798-21',1, null);
INSERT INTO USERS VALUES 
( '20140001','$2a$10$3doe.4YunhhBlsvgq1bsXuoFsvA/v0SG4D2zZXws.uRMykCltSU4K','현동준','hyundongjun','915421-1313227',
'hyun@naver.com','02-910-3439','010-1324-3124','한국',
'부산광역시 마두동 283-8', 
'부산광역시 가좌동 132-2',1, null);
INSERT INTO USERS VALUES 
( '20150001','$2a$10$I4A9iAGghFzrgrLz0Pn7nOT7F4XsP67AMBoGMuTHG3WSkBN60IbI2','김영현','kimyuonghyun','870451-1546782',
'kim@naver.com','02-324-2479','010-4213-1243','한국',
'경기 성남시 분당구 대왕판교로 29-234', 
'경기 성남시 덕양구 일산동 48-2341',1, null);
INSERT INTO USERS VALUES 
( '20160002','$2a$10$.SQCSVmRcDQ.HsAVSjZTeeOzL.wgJSQEcZybxT/h0kDQnFUU4uNNO','백진현','beckjinhyun','914234-1655472',
'beck@naver.com','02-156-3465','010-1647-5967','한국',
'경기 성남시 분당구 야탑로 111번길', 
'경기 성남시 분당구 야탑로 111번길',1, null);
INSERT INTO USERS VALUES 
( '20160001','$2a$10$br1YUKfl/HnLwIQjeN0q3.x0VGRCZqVI6lAYWVdg98ArlYFnfLzea','김새롬','kimsearom','930875-2645184',
'sea@naver.com','02-342-4325','010-3644-5234','한국',
'경기 성남시 분당구 황새울로 312-6547', 
'인천 중구 차이나타운로 36',1, null);
INSERT INTO USERS VALUES 
( '20150002','$2a$10$9mMlQZY7SnB7Sy/zE9M5He50OG.RQ4KZ9UYu1E5LiS.kk7s5eAMI.','김진광','kimjingwang','920574-156784',
'jin@naver.com','02-975-5979','010-6798-6784','한국',
'인천 중구 차이나타운로 36', 
'인천 부평구 시장로 898-1',1, null);
INSERT INTO USERS VALUES 
( '20150003','$2a$10$ZKRLBR6vN8TFBXu54mOh5u8yQJbA/TTMtNqIeXWenWkP0RKo1zg1y','이승헌','leesrunghun','910487-198745',
'ss@naver.com','02-949-6478','010-4872-7614','한국',
'경기 구리시 삼청동 56', 
'경기 이천시 마두동 854-1',1, null);

-- 수강 학생으로 사용할 데이터
INSERT INTO USERS VALUES ('20140002','$2a$10$dZr7kqwVvZ0JdUr7/Ww.xedhakFN2uc/sgUa3cM2anofPSip73Ig2','손용훈','younghoon','910574-1234567','lee@naver.com','031-928-4897','010-1657-1564','한국','경기도 구리시 정읍897-1','경기도 구리시 정읍897-1','1',NULL);
INSERT INTO USERS VALUES ('20140003','$2a$10$shQdO0aPWHbsiZ2f3QTKKOpSnKUwI52vlinZd3a/5jou9zLatPnOG','손여림','sonyuirim','920574-1234568','lee@naver.com','031-928-4898','010-1657-1565','한국','경기도 구리시 정읍897-2','경기도 구리시 정읍897-2','1',NULL);
INSERT INTO USERS VALUES ('20140004','$2a$10$yYCYLxBuOEkS7to72ZrRCOk1QZtOk5Dz76Q./9GiAU1wX4lDq/Bva','장규현','janggyuhyun','910574-1234569','lee@naver.com','031-928-4899','010-1657-1566','한국','경기도 구리시 정읍897-3','경기도 구리시 정읍897-3','1',NULL);
INSERT INTO USERS VALUES ('20140005','$2a$10$xstp6t8m/UhmqC7J0eOpq.LHefph78qFZBcN2B2hmINPrRFeMeLim','왕준','wangjun','910574-1234570','lee@naver.com','031-928-4900','010-1657-1567','한국','경기도 구리시 정읍897-4','경기도 구리시 정읍897-4','1',NULL);
INSERT INTO USERS VALUES ('20140006','$2a$10$3J9KwZmlzvVT3xKLPJTD9uZkotDonyVjBMGZH1zyX1P6wqTIkB4X.','김구라','kimgura','910574-1234571','lee@naver.com','031-928-4901','010-1657-1568','한국','경기도 구리시 정읍897-5','경기도 구리시 정읍897-5','1',NULL);
INSERT INTO USERS VALUES ('20140007','$2a$10$ep3xpENQtStV7Tn/T3OsXOdaafLGWPRlCAtwT2tee8z81vnI5Y0gG','김국진','kimgukjin','910574-1234572','lee@naver.com','031-928-4902','010-1657-1569','한국','경기도 구리시 정읍897-6','경기도 구리시 정읍897-6','1',NULL);
INSERT INTO USERS VALUES ('20140008','$2a$10$ZflwBmIfrkdQ8V7cNkvs5.I4j6Wa3N.tGSt1lTxZ7/0Vo/vnpegfW','황정음','whangjungum','910574-1234573','lee@naver.com','031-928-4903','010-1657-1570','한국','경기도 구리시 정읍897-7','경기도 구리시 정읍897-7','1',NULL);
INSERT INTO USERS VALUES ('20140009','$2a$10$6tM2i5MfAqiHEPm5EZjtbeRzhdWgdJloYvKNcTJr2hHVwJbJmcLRa','황정민','whangjungmin','910574-1234574','lee@naver.com','031-928-4904','010-1657-1571','한국','경기도 구리시 정읍897-8','경기도 구리시 정읍897-8','1',NULL);
INSERT INTO USERS VALUES ('20140010','$2a$10$/3YpMDFBzax1emaaVZni0ujBOP530yBIFpr5HD.vb15H4euZfU7HK','서현화','seohyunhwa','910574-1234575','lee@naver.com','031-928-4905','010-1657-1572','한국','경기도 구리시 정읍897-9','경기도 구리시 정읍897-9','1',NULL);
INSERT INTO USERS VALUES ('20140011','$2a$10$XGZ1OWAPjDteOkcCs8RU8usJ2yfCWYScE7LDlgAEgXtcIGX6jz996','성은영','sungenyung','910574-1234576','lee@naver.com','031-928-4906','010-1657-1573','한국','경기도 구리시 정읍897-10','경기도 구리시 정읍897-10','1',NULL);
INSERT INTO USERS VALUES ('20140012','$2a$10$ITRtF5rSr9U6qsAUjK9nE.rnjy5KJ/HZDmfLSRkCzyK6LLYgWoTjK','김경혜','kimkeyunghye','910574-1234577','lee@naver.com','031-928-4907','010-1657-1574','한국','경기도 구리시 정읍897-11','경기도 구리시 정읍897-11','1',NULL);
INSERT INTO USERS VALUES ('20140013','$2a$10$wDbrxpj20vzB.9UCfcO.I.8UNo0K4h1SE7Eyfg3d8KzxZ8LckGsci','이진영','leejinyoun','910574-1234578','lee@naver.com','031-928-4908','010-1657-1575','한국','경기도 구리시 정읍897-12','경기도 구리시 정읍897-12','1',NULL);
INSERT INTO USERS VALUES('20140014','$2a$10$RxDCiATPPRnHOvQ1cvxrT.kRhRMtKQLEM3ScwFu55pt5T0jXM2XVa','유희선','dooyoungrok','910548-1234887','doo13@naver.com','031-945-2526','010-1524-2626','한국','강원도 춘천시 행신동 898-13','강원도 춘천시 행신동 898-13','1',NULL);
INSERT INTO USERS VALUES('20140015','$2a$10$9491HIXEoTcMLMxAsSWmAu..TGN8e2.tY57MCDWtNwKNg1Ktl7P/u','전경헌','beakgi','910548-1234888','doo14@naver.com','031-945-2527','010-1524-2627','한국','강원도 춘천시 행신동 898-14','강원도 춘천시 행신동 898-14','1',NULL);
INSERT INTO USERS VALUES('20140016','$2a$10$.6TIEYEKksflkjY.PWu1mehhIX3YXczPigdwm7akvb5K3iXmaBoLy','정정환','nayee','910548-1234889','doo15@naver.com','031-945-2528','010-1524-2628','한국','강원도 춘천시 행신동 898-15','강원도 춘천시 행신동 898-15','1',NULL);
INSERT INTO USERS VALUES('20140017','$2a$10$ZGP465TucqnqVe.eFc1BWOYMfePLDFdn17KoTzlKtuhOxC3fvx5KC','문상태','pangyun','910548-1234890','doo16@naver.com','031-945-2529','010-1524-2629','한국','강원도 춘천시 행신동 898-16','강원도 춘천시 행신동 898-16','1',NULL);
INSERT INTO USERS VALUES('20140018','$2a$10$jA7f/8cHJg/x9tynTV/CEuI06kW/6pKohIyO8tzCx.6z/434hL8Cq','강혜슬','beabohee','910548-1234891','doo17@naver.com','031-945-2530','010-1524-2630','한국','강원도 춘천시 행신동 898-17','강원도 춘천시 행신동 898-17','1',NULL);
INSERT INTO USERS VALUES('20140019','$2a$10$jtzp7gpNpEyKEFC0oH7LvOiEK7APqtTZtQqWQHB//1aDJiaqG67qC','장수종','anwoo','910548-1234892','doo18@naver.com','031-945-2531','010-1524-2631','한국','강원도 춘천시 행신동 898-18','강원도 춘천시 행신동 898-18','1',NULL);
INSERT INTO USERS VALUES('20140020','$2a$10$03GLVhck5Kzg22tLgnrra.MYhvrofMUIT3IA/bY1sbLbz3Pn4IyFa','배승현','oohsungsea','910548-1234893','doo19@naver.com','031-945-2532','010-1524-2632','한국','강원도 춘천시 행신동 898-19','강원도 춘천시 행신동 898-19','1',NULL);
INSERT INTO USERS VALUES('20140021','$2a$10$08zBOPdGqudDG2Q7d0hzV.Iz04eRR1m8/o/hHaTL9nImDlOONoe/.','탁경애','jooyub','910548-1234894','doo20@naver.com','031-945-2533','010-1524-2633','한국','강원도 춘천시 행신동 898-20','강원도 춘천시 행신동 898-20','1',NULL);
INSERT INTO USERS VALUES('20140022','$2a$10$GQ3J41z3ZUnQh2vS0IgBC.kFM53zZX77Rpel7HSXbm74MLx9AjFku','장정연','bangyurii','910548-1234895','doo21@naver.com','031-945-2534','010-1524-2634','한국','강원도 춘천시 행신동 898-21','강원도 춘천시 행신동 898-21','1',NULL);
INSERT INTO USERS VALUES('20140023','$2a$10$M.kxZMn5Gqg3pI8DYlefy..PD7m.sOjnVlnjQTr0s/82NoD7jFDFi','권시내','whangsoochul','910548-1234896','doo22@naver.com','031-945-2535','010-1524-2635','한국','강원도 춘천시 행신동 898-22','강원도 춘천시 행신동 898-22','1',NULL);
INSERT INTO USERS VALUES('20140024','$2a$10$JieL5CBH1dsJhIOA4IXKZOyDwXLB2v/W4SyDI5qQfzy8SoGx4LrNi','한경헌','takgyuhwa','910548-1234897','doo23@naver.com','031-945-2536','010-1524-2636','한국','강원도 춘천시 행신동 898-23','강원도 춘천시 행신동 898-23','1',NULL);
INSERT INTO USERS VALUES('20140025','$2a$10$/fDGMmXwDTW7EdMhlDyFg.LnVVh2p569fj0gOBIBd1F68I83Xnks2','오혜리','jinnamjoo','910548-1234898','doo24@naver.com','031-945-2537','010-1524-2637','한국','강원도 춘천시 행신동 898-24','강원도 춘천시 행신동 898-24','1',NULL);
INSERT INTO USERS VALUES('20140026','$2a$10$RxDCiATPPRnHOvQ1cvxrT.kRhRMtKQLEM3ScwFu55pt5T0jXM2XVa','지현주','dooyoungrok','910548-1234899','doo25@naver.com','031-945-2538','010-1524-2638','한국','강원도 춘천시 행신동 898-25','강원도 춘천시 행신동 898-25','1',NULL);
INSERT INTO USERS VALUES('20140027','$2a$10$9491HIXEoTcMLMxAsSWmAu..TGN8e2.tY57MCDWtNwKNg1Ktl7P/u','강성민','beakgi','910548-1234900','doo26@naver.com','031-945-2539','010-1524-2639','한국','강원도 춘천시 행신동 898-26','강원도 춘천시 행신동 898-26','1',NULL);
INSERT INTO USERS VALUES('20140028','$2a$10$.6TIEYEKksflkjY.PWu1mehhIX3YXczPigdwm7akvb5K3iXmaBoLy','구재찬','nayee','910548-1234901','doo27@naver.com','031-945-2540','010-1524-2640','한국','강원도 춘천시 행신동 898-27','강원도 춘천시 행신동 898-27','1',NULL);
INSERT INTO USERS VALUES('20140029','$2a$10$ZGP465TucqnqVe.eFc1BWOYMfePLDFdn17KoTzlKtuhOxC3fvx5KC','손지만','pangyun','910548-1234902','doo28@naver.com','031-945-2541','010-1524-2641','한국','강원도 춘천시 행신동 898-28','강원도 춘천시 행신동 898-28','1',NULL);
INSERT INTO USERS VALUES('20140030','$2a$10$jA7f/8cHJg/x9tynTV/CEuI06kW/6pKohIyO8tzCx.6z/434hL8Cq','윤경혜','beabohee','910548-1234903','doo29@naver.com','031-945-2542','010-1524-2642','한국','강원도 춘천시 행신동 898-29','강원도 춘천시 행신동 898-29','1',NULL);
INSERT INTO USERS VALUES('20140031','$2a$10$jtzp7gpNpEyKEFC0oH7LvOiEK7APqtTZtQqWQHB//1aDJiaqG67qC','허아솔','anwoo','910548-1234904','doo30@naver.com','031-945-2543','010-1524-2643','한국','강원도 춘천시 행신동 898-30','강원도 춘천시 행신동 898-30','1',NULL);
INSERT INTO USERS VALUES('20140032','$2a$10$03GLVhck5Kzg22tLgnrra.MYhvrofMUIT3IA/bY1sbLbz3Pn4IyFa','차성민','oohsungsea','910548-1234905','doo31@naver.com','031-945-2544','010-1524-2644','한국','강원도 춘천시 행신동 898-31','강원도 춘천시 행신동 898-31','1',NULL);
INSERT INTO USERS VALUES('20140033','$2a$10$08zBOPdGqudDG2Q7d0hzV.Iz04eRR1m8/o/hHaTL9nImDlOONoe/.','황도현','jooyub','910548-1234906','doo32@naver.com','031-945-2545','010-1524-2645','한국','강원도 춘천시 행신동 898-32','강원도 춘천시 행신동 898-32','1',NULL);
INSERT INTO USERS VALUES('20140034','$2a$10$GQ3J41z3ZUnQh2vS0IgBC.kFM53zZX77Rpel7HSXbm74MLx9AjFku','박정순','bangyurii','910548-1234907','doo33@naver.com','031-945-2546','010-1524-2646','한국','강원도 춘천시 행신동 898-33','강원도 춘천시 행신동 898-33','1',NULL);
INSERT INTO USERS VALUES('20140035','$2a$10$M.kxZMn5Gqg3pI8DYlefy..PD7m.sOjnVlnjQTr0s/82NoD7jFDFi','하선영','whangsoochul','910548-1234908','doo34@naver.com','031-945-2547','010-1524-2647','한국','강원도 춘천시 행신동 898-34','강원도 춘천시 행신동 898-34','1',NULL);
INSERT INTO USERS VALUES('20140036','$2a$10$JieL5CBH1dsJhIOA4IXKZOyDwXLB2v/W4SyDI5qQfzy8SoGx4LrNi','마소은','takgyuhwa','910548-1234909','doo35@naver.com','031-945-2548','010-1524-2648','한국','강원도 춘천시 행신동 898-35','강원도 춘천시 행신동 898-35','1',NULL);
INSERT INTO USERS VALUES('20140037','$2a$10$/fDGMmXwDTW7EdMhlDyFg.LnVVh2p569fj0gOBIBd1F68I83Xnks2','민진','jinnamjoo','910548-1234910','doo36@naver.com','031-945-2549','010-1524-2649','한국','강원도 춘천시 행신동 898-36','강원도 춘천시 행신동 898-36','1',NULL);
INSERT INTO USERS VALUES('20140038','$2a$10$RxDCiATPPRnHOvQ1cvxrT.kRhRMtKQLEM3ScwFu55pt5T0jXM2XVa','나수혜','dooyoungrok','910548-1234911','doo37@naver.com','031-945-2550','010-1524-2650','한국','강원도 춘천시 행신동 898-37','강원도 춘천시 행신동 898-37','1',NULL);
INSERT INTO USERS VALUES('20140039','$2a$10$9491HIXEoTcMLMxAsSWmAu..TGN8e2.tY57MCDWtNwKNg1Ktl7P/u','백영실','beakgi','910548-1234912','doo38@naver.com','031-945-2551','010-1524-2651','한국','강원도 춘천시 행신동 898-38','강원도 춘천시 행신동 898-38','1',NULL);
INSERT INTO USERS VALUES('20140040','$2a$10$.6TIEYEKksflkjY.PWu1mehhIX3YXczPigdwm7akvb5K3iXmaBoLy','서미연','nayee','910548-1234913','doo39@naver.com','031-945-2552','010-1524-2652','한국','강원도 춘천시 행신동 898-39','강원도 춘천시 행신동 898-39','1',NULL);
INSERT INTO USERS VALUES('20140041','$2a$10$ZGP465TucqnqVe.eFc1BWOYMfePLDFdn17KoTzlKtuhOxC3fvx5KC','신성훈','pangyun','910548-1234914','doo40@naver.com','031-945-2553','010-1524-2653','한국','강원도 춘천시 행신동 898-40','강원도 춘천시 행신동 898-40','1',NULL);
INSERT INTO USERS VALUES('20140042','$2a$10$jA7f/8cHJg/x9tynTV/CEuI06kW/6pKohIyO8tzCx.6z/434hL8Cq','지인영','beabohee','910548-1234915','doo41@naver.com','031-945-2554','010-1524-2654','한국','강원도 춘천시 행신동 898-41','강원도 춘천시 행신동 898-41','1',NULL);
INSERT INTO USERS VALUES('20140043','$2a$10$jtzp7gpNpEyKEFC0oH7LvOiEK7APqtTZtQqWQHB//1aDJiaqG67qC','반주래','anwoo','910548-1234916','doo42@naver.com','031-945-2555','010-1524-2655','한국','강원도 춘천시 행신동 898-42','강원도 춘천시 행신동 898-42','1',NULL);
INSERT INTO USERS VALUES('20140044','$2a$10$03GLVhck5Kzg22tLgnrra.MYhvrofMUIT3IA/bY1sbLbz3Pn4IyFa','마슬기','oohsungsea','910548-1234917','doo43@naver.com','031-945-2556','010-1524-2656','한국','강원도 춘천시 행신동 898-43','강원도 춘천시 행신동 898-43','1',NULL);
INSERT INTO USERS VALUES('20140045','$2a$10$08zBOPdGqudDG2Q7d0hzV.Iz04eRR1m8/o/hHaTL9nImDlOONoe/.','배영록','jooyub','910548-1234918','doo44@naver.com','031-945-2557','010-1524-2657','한국','강원도 춘천시 행신동 898-44','강원도 춘천시 행신동 898-44','1',NULL);
INSERT INTO USERS VALUES('20140046','$2a$10$GQ3J41z3ZUnQh2vS0IgBC.kFM53zZX77Rpel7HSXbm74MLx9AjFku','최재범','bangyurii','910548-1234919','doo45@naver.com','031-945-2558','010-1524-2658','한국','강원도 춘천시 행신동 898-45','강원도 춘천시 행신동 898-45','1',NULL);
INSERT INTO USERS VALUES('20140047','$2a$10$M.kxZMn5Gqg3pI8DYlefy..PD7m.sOjnVlnjQTr0s/82NoD7jFDFi','오바라','whangsoochul','910548-1234920','doo46@naver.com','031-945-2559','010-1524-2659','한국','강원도 춘천시 행신동 898-46','강원도 춘천시 행신동 898-46','1',NULL);
INSERT INTO USERS VALUES('20140048','$2a$10$JieL5CBH1dsJhIOA4IXKZOyDwXLB2v/W4SyDI5qQfzy8SoGx4LrNi','전익현','takgyuhwa','910548-1234921','doo47@naver.com','031-945-2560','010-1524-2660','한국','강원도 춘천시 행신동 898-47','강원도 춘천시 행신동 898-47','1',NULL);
INSERT INTO USERS VALUES('20140049','$2a$10$/fDGMmXwDTW7EdMhlDyFg.LnVVh2p569fj0gOBIBd1F68I83Xnks2','서례은','jinnamjoo','910548-1234922','doo48@naver.com','031-945-2561','010-1524-2661','한국','강원도 춘천시 행신동 898-48','강원도 춘천시 행신동 898-48','1',NULL);
INSERT INTO USERS VALUES('20140050','$2a$10$GQ3J41z3ZUnQh2vS0IgBC.kFM53zZX77Rpel7HSXbm74MLx9AjFku','정승연','bangyurii','910548-1234923','doo49@naver.com','031-945-2562','010-1524-2662','한국','강원도 춘천시 행신동 898-49','강원도 춘천시 행신동 898-49','1',NULL);
INSERT INTO USERS VALUES('20140051','$2a$10$03GLVhck5Kzg22tLgnrra.MYhvrofMUIT3IA/bY1sbLbz3Pn4IyFa','차성민','oohsungsea','910548-1234924','doo50@naver.com','031-945-2563','010-1524-2663','한국','강원도 춘천시 행신동 898-50','강원도 춘천시 행신동 898-50','1',NULL);
INSERT INTO USERS VALUES('20140052','$2a$10$08zBOPdGqudDG2Q7d0hzV.Iz04eRR1m8/o/hHaTL9nImDlOONoe/.','황도현','jooyub','910548-1234925','doo51@naver.com','031-945-2564','010-1524-2664','한국','강원도 춘천시 행신동 898-51','강원도 춘천시 행신동 898-51','1',NULL);
INSERT INTO USERS VALUES('20140053','$2a$10$GQ3J41z3ZUnQh2vS0IgBC.kFM53zZX77Rpel7HSXbm74MLx9AjFku','박정순','bangyurii','910548-1234926','doo52@naver.com','031-945-2565','010-1524-2665','한국','강원도 춘천시 행신동 898-52','강원도 춘천시 행신동 898-52','1',NULL);
INSERT INTO USERS VALUES('20140054','$2a$10$M.kxZMn5Gqg3pI8DYlefy..PD7m.sOjnVlnjQTr0s/82NoD7jFDFi','하선영','whangsoochul','910548-1234927','doo53@naver.com','031-945-2566','010-1524-2666','한국','강원도 춘천시 행신동 898-53','강원도 춘천시 행신동 898-53','1',NULL);
INSERT INTO USERS VALUES('20140055','$2a$10$JieL5CBH1dsJhIOA4IXKZOyDwXLB2v/W4SyDI5qQfzy8SoGx4LrNi','마소은','takgyuhwa','910548-1234928','doo54@naver.com','031-945-2567','010-1524-2667','한국','강원도 춘천시 행신동 898-54','강원도 춘천시 행신동 898-54','1',NULL);
INSERT INTO USERS VALUES('20140056','$2a$10$/fDGMmXwDTW7EdMhlDyFg.LnVVh2p569fj0gOBIBd1F68I83Xnks2','민진','jinnamjoo','910548-1234929','doo55@naver.com','031-945-2568','010-1524-2668','한국','강원도 춘천시 행신동 898-55','강원도 춘천시 행신동 898-55','1',NULL);
INSERT INTO USERS VALUES('20140057','$2a$10$RxDCiATPPRnHOvQ1cvxrT.kRhRMtKQLEM3ScwFu55pt5T0jXM2XVa','나수혜','dooyoungrok','910548-1234930','doo56@naver.com','031-945-2569','010-1524-2669','한국','강원도 춘천시 행신동 898-56','강원도 춘천시 행신동 898-56','1',NULL);
INSERT INTO USERS VALUES('20140058','$2a$10$9491HIXEoTcMLMxAsSWmAu..TGN8e2.tY57MCDWtNwKNg1Ktl7P/u','백영실','beakgi','910548-1234931','doo57@naver.com','031-945-2570','010-1524-2670','한국','강원도 춘천시 행신동 898-57','강원도 춘천시 행신동 898-57','1',NULL);
INSERT INTO USERS VALUES('20140059','$2a$10$.6TIEYEKksflkjY.PWu1mehhIX3YXczPigdwm7akvb5K3iXmaBoLy','서미연','nayee','910548-1234932','doo58@naver.com','031-945-2571','010-1524-2671','한국','강원도 춘천시 행신동 898-58','강원도 춘천시 행신동 898-58','1',NULL);
INSERT INTO USERS VALUES('20140060','$2a$10$ZGP465TucqnqVe.eFc1BWOYMfePLDFdn17KoTzlKtuhOxC3fvx5KC','신성훈','pangyun','910548-1234933','doo59@naver.com','031-945-2572','010-1524-2672','한국','강원도 춘천시 행신동 898-59','강원도 춘천시 행신동 898-59','1',NULL);



INSERT INTO USERS VALUES('20130002','$2a$10$RxDCiATPPRnHOvQ1cvxrT.kRhRMtKQLEM3ScwFu55pt5T0jXM2XVa','도영록','dooyoungrok','910548-1234875','doo1@naver.com','031-945-2514','010-1524-2614','영국','강원도 춘천시 행신동 898-1','강원도 춘천시 행신동 898-1','1',NULL);
INSERT INTO USERS VALUES('20130003','$2a$10$9491HIXEoTcMLMxAsSWmAu..TGN8e2.tY57MCDWtNwKNg1Ktl7P/u','이백기','beakgi','910548-1234876','doo2@naver.com','031-945-2515','010-1524-2615','한국','강원도 춘천시 행신동 898-2','강원도 춘천시 행신동 898-2','1',NULL);
INSERT INTO USERS VALUES('20130004','$2a$10$.6TIEYEKksflkjY.PWu1mehhIX3YXczPigdwm7akvb5K3iXmaBoLy','나승이','nayee','910548-1234877','doo3@naver.com','031-945-2516','010-1524-2616','한국','강원도 춘천시 행신동 898-3','강원도 춘천시 행신동 898-3','1',NULL);
INSERT INTO USERS VALUES('20130005','$2a$10$ZGP465TucqnqVe.eFc1BWOYMfePLDFdn17KoTzlKtuhOxC3fvx5KC','박판규','pangyun','910548-1234878','doo4@naver.com','031-945-2517','010-1524-2617','한국','강원도 춘천시 행신동 898-4','강원도 춘천시 행신동 898-4','1',NULL);
INSERT INTO USERS VALUES('20130006','$2a$10$jA7f/8cHJg/x9tynTV/CEuI06kW/6pKohIyO8tzCx.6z/434hL8Cq','배보희','beabohee','910548-1234879','doo5@naver.com','031-945-2518','010-1524-2618','한국','강원도 춘천시 행신동 898-5','강원도 춘천시 행신동 898-5','1',NULL);
INSERT INTO USERS VALUES('20130007','$2a$10$jtzp7gpNpEyKEFC0oH7LvOiEK7APqtTZtQqWQHB//1aDJiaqG67qC','안형우','anwoo','910548-1234880','doo6@naver.com','031-945-2519','010-1524-2619','한국','강원도 춘천시 행신동 898-6','강원도 춘천시 행신동 898-6','1',NULL);
INSERT INTO USERS VALUES('20130008','$2a$10$03GLVhck5Kzg22tLgnrra.MYhvrofMUIT3IA/bY1sbLbz3Pn4IyFa','오성새','oohsungsea','910548-1234881','doo7@naver.com','031-945-2520','010-1524-2620','한국','강원도 춘천시 행신동 898-7','강원도 춘천시 행신동 898-7','1',NULL);
INSERT INTO USERS VALUES('20130009','$2a$10$08zBOPdGqudDG2Q7d0hzV.Iz04eRR1m8/o/hHaTL9nImDlOONoe/.','지주엽','jooyub','910548-1234882','doo8@naver.com','031-945-2521','010-1524-2621','한국','강원도 춘천시 행신동 898-8','강원도 춘천시 행신동 898-8','1',NULL);
INSERT INTO USERS VALUES('20130010','$2a$10$GQ3J41z3ZUnQh2vS0IgBC.kFM53zZX77Rpel7HSXbm74MLx9AjFku','반규리','bangyurii','910548-1234883','doo9@naver.com','031-945-2522','010-1524-2622','한국','강원도 춘천시 행신동 898-9','강원도 춘천시 행신동 898-9','1',NULL);
INSERT INTO USERS VALUES('20130011','$2a$10$M.kxZMn5Gqg3pI8DYlefy..PD7m.sOjnVlnjQTr0s/82NoD7jFDFi','왕수철','whangsoochul','910548-1234884','doo10@naver.com','031-945-2523','010-1524-2623','한국','강원도 춘천시 행신동 898-10','강원도 춘천시 행신동 898-10','1',NULL);
INSERT INTO USERS VALUES('20130012','$2a$10$JieL5CBH1dsJhIOA4IXKZOyDwXLB2v/W4SyDI5qQfzy8SoGx4LrNi','탁규화','takgyuhwa','910548-1234885','doo11@naver.com','031-945-2524','010-1524-2624','한국','강원도 춘천시 행신동 898-11','강원도 춘천시 행신동 898-11','1',NULL);
INSERT INTO USERS VALUES('20130013','$2a$10$/fDGMmXwDTW7EdMhlDyFg.LnVVh2p569fj0gOBIBd1F68I83Xnks2','진남주','jinnamjoo','910548-1234886','doo12@naver.com','031-945-2525','010-1524-2625','한국','강원도 춘천시 행신동 898-12','강원도 춘천시 행신동 898-12','1',NULL);
INSERT INTO USERS VALUES('20130014','$2a$10$RxDCiATPPRnHOvQ1cvxrT.kRhRMtKQLEM3ScwFu55pt5T0jXM2XVa','유희선','dooyoungrok','910548-1234887','doo13@naver.com','031-945-2526','010-1524-2626','한국','강원도 춘천시 행신동 898-13','강원도 춘천시 행신동 898-13','1',NULL);
INSERT INTO USERS VALUES('20130015','$2a$10$9491HIXEoTcMLMxAsSWmAu..TGN8e2.tY57MCDWtNwKNg1Ktl7P/u','전경헌','beakgi','910548-1234888','doo14@naver.com','031-945-2527','010-1524-2627','한국','강원도 춘천시 행신동 898-14','강원도 춘천시 행신동 898-14','1',NULL);
INSERT INTO USERS VALUES('20130016','$2a$10$.6TIEYEKksflkjY.PWu1mehhIX3YXczPigdwm7akvb5K3iXmaBoLy','정정환','nayee','910548-1234889','doo15@naver.com','031-945-2528','010-1524-2628','한국','강원도 춘천시 행신동 898-15','강원도 춘천시 행신동 898-15','1',NULL);
INSERT INTO USERS VALUES('20130017','$2a$10$ZGP465TucqnqVe.eFc1BWOYMfePLDFdn17KoTzlKtuhOxC3fvx5KC','문상태','pangyun','910548-1234890','doo16@naver.com','031-945-2529','010-1524-2629','한국','강원도 춘천시 행신동 898-16','강원도 춘천시 행신동 898-16','1',NULL);
INSERT INTO USERS VALUES('20130018','$2a$10$jA7f/8cHJg/x9tynTV/CEuI06kW/6pKohIyO8tzCx.6z/434hL8Cq','강혜슬','beabohee','910548-1234891','doo17@naver.com','031-945-2530','010-1524-2630','한국','강원도 춘천시 행신동 898-17','강원도 춘천시 행신동 898-17','1',NULL);
INSERT INTO USERS VALUES('20130019','$2a$10$jtzp7gpNpEyKEFC0oH7LvOiEK7APqtTZtQqWQHB//1aDJiaqG67qC','장수종','anwoo','910548-1234892','doo18@naver.com','031-945-2531','010-1524-2631','한국','강원도 춘천시 행신동 898-18','강원도 춘천시 행신동 898-18','1',NULL);
INSERT INTO USERS VALUES('20130020','$2a$10$03GLVhck5Kzg22tLgnrra.MYhvrofMUIT3IA/bY1sbLbz3Pn4IyFa','배승현','oohsungsea','910548-1234893','doo19@naver.com','031-945-2532','010-1524-2632','한국','강원도 춘천시 행신동 898-19','강원도 춘천시 행신동 898-19','1',NULL);
INSERT INTO USERS VALUES('20130021','$2a$10$08zBOPdGqudDG2Q7d0hzV.Iz04eRR1m8/o/hHaTL9nImDlOONoe/.','탁경애','jooyub','910548-1234894','doo20@naver.com','031-945-2533','010-1524-2633','한국','강원도 춘천시 행신동 898-20','강원도 춘천시 행신동 898-20','1',NULL);
INSERT INTO USERS VALUES('20130022','$2a$10$GQ3J41z3ZUnQh2vS0IgBC.kFM53zZX77Rpel7HSXbm74MLx9AjFku','장정연','bangyurii','910548-1234895','doo21@naver.com','031-945-2534','010-1524-2634','한국','강원도 춘천시 행신동 898-21','강원도 춘천시 행신동 898-21','1',NULL);
INSERT INTO USERS VALUES('20130023','$2a$10$M.kxZMn5Gqg3pI8DYlefy..PD7m.sOjnVlnjQTr0s/82NoD7jFDFi','권시내','whangsoochul','910548-1234896','doo22@naver.com','031-945-2535','010-1524-2635','한국','강원도 춘천시 행신동 898-22','강원도 춘천시 행신동 898-22','1',NULL);
INSERT INTO USERS VALUES('20130024','$2a$10$JieL5CBH1dsJhIOA4IXKZOyDwXLB2v/W4SyDI5qQfzy8SoGx4LrNi','한경헌','takgyuhwa','910548-1234897','doo23@naver.com','031-945-2536','010-1524-2636','한국','강원도 춘천시 행신동 898-23','강원도 춘천시 행신동 898-23','1',NULL);
INSERT INTO USERS VALUES('20130025','$2a$10$/fDGMmXwDTW7EdMhlDyFg.LnVVh2p569fj0gOBIBd1F68I83Xnks2','오혜리','jinnamjoo','910548-1234898','doo24@naver.com','031-945-2537','010-1524-2637','한국','강원도 춘천시 행신동 898-24','강원도 춘천시 행신동 898-24','1',NULL);
INSERT INTO USERS VALUES('20130026','$2a$10$RxDCiATPPRnHOvQ1cvxrT.kRhRMtKQLEM3ScwFu55pt5T0jXM2XVa','지현주','dooyoungrok','910548-1234899','doo25@naver.com','031-945-2538','010-1524-2638','한국','강원도 춘천시 행신동 898-25','강원도 춘천시 행신동 898-25','1',NULL);
INSERT INTO USERS VALUES('20130027','$2a$10$9491HIXEoTcMLMxAsSWmAu..TGN8e2.tY57MCDWtNwKNg1Ktl7P/u','강성민','beakgi','910548-1234900','doo26@naver.com','031-945-2539','010-1524-2639','한국','강원도 춘천시 행신동 898-26','강원도 춘천시 행신동 898-26','1',NULL);
INSERT INTO USERS VALUES('20130028','$2a$10$.6TIEYEKksflkjY.PWu1mehhIX3YXczPigdwm7akvb5K3iXmaBoLy','구재찬','nayee','910548-1234901','doo27@naver.com','031-945-2540','010-1524-2640','한국','강원도 춘천시 행신동 898-27','강원도 춘천시 행신동 898-27','1',NULL);
INSERT INTO USERS VALUES('20130029','$2a$10$ZGP465TucqnqVe.eFc1BWOYMfePLDFdn17KoTzlKtuhOxC3fvx5KC','손지만','pangyun','910548-1234902','doo28@naver.com','031-945-2541','010-1524-2641','한국','강원도 춘천시 행신동 898-28','강원도 춘천시 행신동 898-28','1',NULL);
INSERT INTO USERS VALUES('20130030','$2a$10$jA7f/8cHJg/x9tynTV/CEuI06kW/6pKohIyO8tzCx.6z/434hL8Cq','윤경혜','beabohee','910548-1234903','doo29@naver.com','031-945-2542','010-1524-2642','한국','강원도 춘천시 행신동 898-29','강원도 춘천시 행신동 898-29','1',NULL);
INSERT INTO USERS VALUES('20130031','$2a$10$jtzp7gpNpEyKEFC0oH7LvOiEK7APqtTZtQqWQHB//1aDJiaqG67qC','허아솔','anwoo','910548-1234904','doo30@naver.com','031-945-2543','010-1524-2643','한국','강원도 춘천시 행신동 898-30','강원도 춘천시 행신동 898-30','1',NULL);
INSERT INTO USERS VALUES('20130032','$2a$10$03GLVhck5Kzg22tLgnrra.MYhvrofMUIT3IA/bY1sbLbz3Pn4IyFa','차성민','oohsungsea','910548-1234905','doo31@naver.com','031-945-2544','010-1524-2644','한국','강원도 춘천시 행신동 898-31','강원도 춘천시 행신동 898-31','1',NULL);
INSERT INTO USERS VALUES('20130033','$2a$10$08zBOPdGqudDG2Q7d0hzV.Iz04eRR1m8/o/hHaTL9nImDlOONoe/.','황도현','jooyub','910548-1234906','doo32@naver.com','031-945-2545','010-1524-2645','한국','강원도 춘천시 행신동 898-32','강원도 춘천시 행신동 898-32','1',NULL);
INSERT INTO USERS VALUES('20130034','$2a$10$GQ3J41z3ZUnQh2vS0IgBC.kFM53zZX77Rpel7HSXbm74MLx9AjFku','박정순','bangyurii','910548-1234907','doo33@naver.com','031-945-2546','010-1524-2646','한국','강원도 춘천시 행신동 898-33','강원도 춘천시 행신동 898-33','1',NULL);
INSERT INTO USERS VALUES('20130035','$2a$10$M.kxZMn5Gqg3pI8DYlefy..PD7m.sOjnVlnjQTr0s/82NoD7jFDFi','하선영','whangsoochul','910548-1234908','doo34@naver.com','031-945-2547','010-1524-2647','한국','강원도 춘천시 행신동 898-34','강원도 춘천시 행신동 898-34','1',NULL);
INSERT INTO USERS VALUES('20130036','$2a$10$JieL5CBH1dsJhIOA4IXKZOyDwXLB2v/W4SyDI5qQfzy8SoGx4LrNi','마소은','takgyuhwa','910548-1234909','doo35@naver.com','031-945-2548','010-1524-2648','한국','강원도 춘천시 행신동 898-35','강원도 춘천시 행신동 898-35','1',NULL);
INSERT INTO USERS VALUES('20130037','$2a$10$/fDGMmXwDTW7EdMhlDyFg.LnVVh2p569fj0gOBIBd1F68I83Xnks2','민진','jinnamjoo','910548-1234910','doo36@naver.com','031-945-2549','010-1524-2649','한국','강원도 춘천시 행신동 898-36','강원도 춘천시 행신동 898-36','1',NULL);
INSERT INTO USERS VALUES('20130038','$2a$10$RxDCiATPPRnHOvQ1cvxrT.kRhRMtKQLEM3ScwFu55pt5T0jXM2XVa','나수혜','dooyoungrok','910548-1234911','doo37@naver.com','031-945-2550','010-1524-2650','한국','강원도 춘천시 행신동 898-37','강원도 춘천시 행신동 898-37','1',NULL);
INSERT INTO USERS VALUES('20130039','$2a$10$9491HIXEoTcMLMxAsSWmAu..TGN8e2.tY57MCDWtNwKNg1Ktl7P/u','백영실','beakgi','910548-1234912','doo38@naver.com','031-945-2551','010-1524-2651','한국','강원도 춘천시 행신동 898-38','강원도 춘천시 행신동 898-38','1',NULL);
INSERT INTO USERS VALUES('20130040','$2a$10$.6TIEYEKksflkjY.PWu1mehhIX3YXczPigdwm7akvb5K3iXmaBoLy','서미연','nayee','910548-1234913','doo39@naver.com','031-945-2552','010-1524-2652','한국','강원도 춘천시 행신동 898-39','강원도 춘천시 행신동 898-39','1',NULL);
INSERT INTO USERS VALUES('20130041','$2a$10$ZGP465TucqnqVe.eFc1BWOYMfePLDFdn17KoTzlKtuhOxC3fvx5KC','신성훈','pangyun','910548-1234914','doo40@naver.com','031-945-2553','010-1524-2653','한국','강원도 춘천시 행신동 898-40','강원도 춘천시 행신동 898-40','1',NULL);
INSERT INTO USERS VALUES('20130042','$2a$10$jA7f/8cHJg/x9tynTV/CEuI06kW/6pKohIyO8tzCx.6z/434hL8Cq','지인영','beabohee','910548-1234915','doo41@naver.com','031-945-2554','010-1524-2654','한국','강원도 춘천시 행신동 898-41','강원도 춘천시 행신동 898-41','1',NULL);
INSERT INTO USERS VALUES('20130043','$2a$10$jtzp7gpNpEyKEFC0oH7LvOiEK7APqtTZtQqWQHB//1aDJiaqG67qC','반주래','anwoo','910548-1234916','doo42@naver.com','031-945-2555','010-1524-2655','한국','강원도 춘천시 행신동 898-42','강원도 춘천시 행신동 898-42','1',NULL);
INSERT INTO USERS VALUES('20130044','$2a$10$03GLVhck5Kzg22tLgnrra.MYhvrofMUIT3IA/bY1sbLbz3Pn4IyFa','마슬기','oohsungsea','910548-1234917','doo43@naver.com','031-945-2556','010-1524-2656','한국','강원도 춘천시 행신동 898-43','강원도 춘천시 행신동 898-43','1',NULL);
INSERT INTO USERS VALUES('20130045','$2a$10$08zBOPdGqudDG2Q7d0hzV.Iz04eRR1m8/o/hHaTL9nImDlOONoe/.','배영록','jooyub','910548-1234918','doo44@naver.com','031-945-2557','010-1524-2657','한국','강원도 춘천시 행신동 898-44','강원도 춘천시 행신동 898-44','1',NULL);
INSERT INTO USERS VALUES('20130046','$2a$10$GQ3J41z3ZUnQh2vS0IgBC.kFM53zZX77Rpel7HSXbm74MLx9AjFku','최재범','bangyurii','910548-1234919','doo45@naver.com','031-945-2558','010-1524-2658','한국','강원도 춘천시 행신동 898-45','강원도 춘천시 행신동 898-45','1',NULL);
INSERT INTO USERS VALUES('20130047','$2a$10$M.kxZMn5Gqg3pI8DYlefy..PD7m.sOjnVlnjQTr0s/82NoD7jFDFi','오바라','whangsoochul','910548-1234920','doo46@naver.com','031-945-2559','010-1524-2659','한국','강원도 춘천시 행신동 898-46','강원도 춘천시 행신동 898-46','1',NULL);
INSERT INTO USERS VALUES('20130048','$2a$10$JieL5CBH1dsJhIOA4IXKZOyDwXLB2v/W4SyDI5qQfzy8SoGx4LrNi','전익현','takgyuhwa','910548-1234921','doo47@naver.com','031-945-2560','010-1524-2660','한국','강원도 춘천시 행신동 898-47','강원도 춘천시 행신동 898-47','1',NULL);
INSERT INTO USERS VALUES('20130049','$2a$10$/fDGMmXwDTW7EdMhlDyFg.LnVVh2p569fj0gOBIBd1F68I83Xnks2','서례은','jinnamjoo','910548-1234922','doo48@naver.com','031-945-2561','010-1524-2661','한국','강원도 춘천시 행신동 898-48','강원도 춘천시 행신동 898-48','1',NULL);
INSERT INTO USERS VALUES('20130050','$2a$10$GQ3J41z3ZUnQh2vS0IgBC.kFM53zZX77Rpel7HSXbm74MLx9AjFku','정승연','bangyurii','910548-1234923','doo49@naver.com','031-945-2562','010-1524-2662','한국','강원도 춘천시 행신동 898-49','강원도 춘천시 행신동 898-49','1',NULL);
INSERT INTO USERS VALUES('20130051','$2a$10$03GLVhck5Kzg22tLgnrra.MYhvrofMUIT3IA/bY1sbLbz3Pn4IyFa','차성민','oohsungsea','910548-1234924','doo50@naver.com','031-945-2563','010-1524-2663','한국','강원도 춘천시 행신동 898-50','강원도 춘천시 행신동 898-50','1',NULL);
INSERT INTO USERS VALUES('20130052','$2a$10$08zBOPdGqudDG2Q7d0hzV.Iz04eRR1m8/o/hHaTL9nImDlOONoe/.','황도현','jooyub','910548-1234925','doo51@naver.com','031-945-2564','010-1524-2664','한국','강원도 춘천시 행신동 898-51','강원도 춘천시 행신동 898-51','1',NULL);
INSERT INTO USERS VALUES('20130053','$2a$10$GQ3J41z3ZUnQh2vS0IgBC.kFM53zZX77Rpel7HSXbm74MLx9AjFku','박정순','bangyurii','910548-1234926','doo52@naver.com','031-945-2565','010-1524-2665','한국','강원도 춘천시 행신동 898-52','강원도 춘천시 행신동 898-52','1',NULL);
INSERT INTO USERS VALUES('20130054','$2a$10$M.kxZMn5Gqg3pI8DYlefy..PD7m.sOjnVlnjQTr0s/82NoD7jFDFi','하선영','whangsoochul','910548-1234927','doo53@naver.com','031-945-2566','010-1524-2666','한국','강원도 춘천시 행신동 898-53','강원도 춘천시 행신동 898-53','1',NULL);
INSERT INTO USERS VALUES('20130055','$2a$10$JieL5CBH1dsJhIOA4IXKZOyDwXLB2v/W4SyDI5qQfzy8SoGx4LrNi','마소은','takgyuhwa','910548-1234928','doo54@naver.com','031-945-2567','010-1524-2667','한국','강원도 춘천시 행신동 898-54','강원도 춘천시 행신동 898-54','1',NULL);
INSERT INTO USERS VALUES('20130056','$2a$10$/fDGMmXwDTW7EdMhlDyFg.LnVVh2p569fj0gOBIBd1F68I83Xnks2','민진','jinnamjoo','910548-1234929','doo55@naver.com','031-945-2568','010-1524-2668','한국','강원도 춘천시 행신동 898-55','강원도 춘천시 행신동 898-55','1',NULL);
INSERT INTO USERS VALUES('20130057','$2a$10$RxDCiATPPRnHOvQ1cvxrT.kRhRMtKQLEM3ScwFu55pt5T0jXM2XVa','나수혜','dooyoungrok','910548-1234930','doo56@naver.com','031-945-2569','010-1524-2669','한국','강원도 춘천시 행신동 898-56','강원도 춘천시 행신동 898-56','1',NULL);
INSERT INTO USERS VALUES('20130058','$2a$10$9491HIXEoTcMLMxAsSWmAu..TGN8e2.tY57MCDWtNwKNg1Ktl7P/u','백영실','beakgi','910548-1234931','doo57@naver.com','031-945-2570','010-1524-2670','한국','강원도 춘천시 행신동 898-57','강원도 춘천시 행신동 898-57','1',NULL);
INSERT INTO USERS VALUES('20130059','$2a$10$.6TIEYEKksflkjY.PWu1mehhIX3YXczPigdwm7akvb5K3iXmaBoLy','서미연','nayee','910548-1234932','doo58@naver.com','031-945-2571','010-1524-2671','한국','강원도 춘천시 행신동 898-58','강원도 춘천시 행신동 898-58','1',NULL);
INSERT INTO USERS VALUES('20130060','$2a$10$ZGP465TucqnqVe.eFc1BWOYMfePLDFdn17KoTzlKtuhOxC3fvx5KC','신성훈','pangyun','910548-1234933','doo59@naver.com','031-945-2572','010-1524-2672','한국','강원도 춘천시 행신동 898-59','강원도 춘천시 행신동 898-59','1',NULL);

INSERT INTO USERS VALUES ('1007','$2a$10$dZr7kqwVvZ0JdUr7/Ww.xedhakFN2uc/sgUa3cM2anofPSip73Ig2','차윤도','younghoon','910574-1234567','lee@naver.com','031-928-4897','010-1657-1564','한국','경기도 구리시 정읍897-1','경기도 구리시 정읍897-1','1',NULL);
INSERT INTO USERS VALUES ('1008','$2a$10$shQdO0aPWHbsiZ2f3QTKKOpSnKUwI52vlinZd3a/5jou9zLatPnOG','엄안영','sonyuirim','920574-1234568','lee@naver.com','031-928-4898','010-1657-1565','한국','경기도 구리시 정읍897-2','경기도 구리시 정읍897-2','1',NULL);
INSERT INTO USERS VALUES ('1009','$2a$10$yYCYLxBuOEkS7to72ZrRCOk1QZtOk5Dz76Q./9GiAU1wX4lDq/Bva','강백기','janggyuhyun','910574-1234569','lee@naver.com','031-928-4899','010-1657-1566','한국','경기도 구리시 정읍897-3','경기도 구리시 정읍897-3','1',NULL);
INSERT INTO USERS VALUES ('1010','$2a$10$xstp6t8m/UhmqC7J0eOpq.LHefph78qFZBcN2B2hmINPrRFeMeLim','엄채영','wangjun','910574-1234570','lee@naver.com','031-928-4900','010-1657-1567','한국','경기도 구리시 정읍897-4','경기도 구리시 정읍897-4','1',NULL);
INSERT INTO USERS VALUES ('1011','$2a$10$3J9KwZmlzvVT3xKLPJTD9uZkotDonyVjBMGZH1zyX1P6wqTIkB4X.','유진섭','kimgura','910574-1234571','lee@naver.com','031-928-4901','010-1657-1568','한국','경기도 구리시 정읍897-5','경기도 구리시 정읍897-5','1',NULL);
INSERT INTO USERS VALUES ('1012','$2a$10$ep3xpENQtStV7Tn/T3OsXOdaafLGWPRlCAtwT2tee8z81vnI5Y0gG','장지아','kimgukjin','910574-1234572','lee@naver.com','031-928-4902','010-1657-1569','한국','경기도 구리시 정읍897-6','경기도 구리시 정읍897-6','1',NULL);
INSERT INTO USERS VALUES ('1013','$2a$10$ZflwBmIfrkdQ8V7cNkvs5.I4j6Wa3N.tGSt1lTxZ7/0Vo/vnpegfW','마지헌','whangjungum','910574-1234573','lee@naver.com','031-928-4903','010-1657-1570','한국','경기도 구리시 정읍897-7','경기도 구리시 정읍897-7','1',NULL);
INSERT INTO USERS VALUES ('1014','$2a$10$6tM2i5MfAqiHEPm5EZjtbeRzhdWgdJloYvKNcTJr2hHVwJbJmcLRa','백미경','whangjungmin','910574-1234574','lee@naver.com','031-928-4904','010-1657-1571','한국','경기도 구리시 정읍897-8','경기도 구리시 정읍897-8','1',NULL);
INSERT INTO USERS VALUES ('1015','$2a$10$/3YpMDFBzax1emaaVZni0ujBOP530yBIFpr5HD.vb15H4euZfU7HK','송솔희','seohyunhwa','910574-1234575','lee@naver.com','031-928-4905','010-1657-1572','한국','경기도 구리시 정읍897-9','경기도 구리시 정읍897-9','1',NULL);
INSERT INTO USERS VALUES ('1016','$2a$10$XGZ1OWAPjDteOkcCs8RU8usJ2yfCWYScE7LDlgAEgXtcIGX6jz996','전상수','sungenyung','910574-1234576','lee@naver.com','031-928-4906','010-1657-1573','한국','경기도 구리시 정읍897-10','경기도 구리시 정읍897-10','1',NULL);
INSERT INTO USERS VALUES ('1017','$2a$10$ITRtF5rSr9U6qsAUjK9nE.rnjy5KJ/HZDmfLSRkCzyK6LLYgWoTjK','배정옥','kimkeyunghye','910574-1234577','lee@naver.com','031-928-4907','010-1657-1574','한국','경기도 구리시 정읍897-11','경기도 구리시 정읍897-11','1',NULL);
INSERT INTO USERS VALUES ('1018','$2a$10$wDbrxpj20vzB.9UCfcO.I.8UNo0K4h1SE7Eyfg3d8KzxZ8LckGsci','송태종','leejinyoun','910574-1234578','lee@naver.com','031-928-4908','010-1657-1575','한국','경기도 구리시 정읍897-12','경기도 구리시 정읍897-12','1',NULL);
INSERT INTO USERS VALUES ('1019','$2a$10$sFM67fv5vUJ3QhNR66OB4enK3fsPenXkaRh0YoaCjC8GGOeeM0XBO','오민균','sonmi','910574-1234579','lee@naver.com','031-928-4909','010-1657-1576','한국','경기도 구리시 정읍897-13','경기도 구리시 정읍897-13','1',NULL);


-- 권한 데이터 삽입 (사용자ID, 권한)
INSERT INTO AUTHORITIES VALUES('0','ROLE_ADMIN');
INSERT INTO AUTHORITIES VALUES('1001','ROLE_PROFESSOR');-- 인문대 교수1
INSERT INTO AUTHORITIES VALUES('1002','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES('1003','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES('1004','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES('1005','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES('1006','ROLE_PROFESSOR');-- 이공대 교수6
INSERT INTO AUTHORITIES VALUES ('1007','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES ('1008','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES ('1009','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES ('1010','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES ('1011','ROLE_PROFESSOR');-- 교양 교수11
INSERT INTO AUTHORITIES VALUES ('1012','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES ('1013','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES ('1014','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES ('1015','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES ('1016','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES ('1017','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES ('1018','ROLE_PROFESSOR');
INSERT INTO AUTHORITIES VALUES ('1019','ROLE_PROFESSOR');

INSERT INTO AUTHORITIES VALUES ('20140001','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140002','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140003','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140004','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140005','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140006','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140007','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140008','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140009','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140010','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140011','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140012','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140013','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140014','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140015','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140016','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140017','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140018','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140019','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140020','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140021','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140022','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140023','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140024','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140025','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140026','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140027','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140028','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140029','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140030','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140031','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140032','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140033','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140034','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140035','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140036','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140037','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140038','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140039','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140040','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140041','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140042','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140043','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140044','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140045','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140046','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140047','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140048','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140049','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140050','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140051','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140052','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140053','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140054','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140055','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140056','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140057','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140058','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140059','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20140060','ROLE_STU');


INSERT INTO AUTHORITIES VALUES('20150001','ROLE_STU');
INSERT INTO AUTHORITIES VALUES('20150002','ROLE_STU');
INSERT INTO AUTHORITIES VALUES('20150003','ROLE_STU');

INSERT INTO AUTHORITIES VALUES('20160001','ROLE_STU');
INSERT INTO AUTHORITIES VALUES('20160002','ROLE_STU');

INSERT INTO AUTHORITIES VALUES ('20130001','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130002','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130003','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130004','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130005','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130006','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130007','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130008','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130009','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130010','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130011','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130012','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130013','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130014','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130015','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130016','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130017','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130018','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130019','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130020','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130021','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130022','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130023','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130024','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130025','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130026','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130027','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130028','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130029','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130030','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130031','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130032','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130033','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130034','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130035','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130036','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130037','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130038','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130039','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130040','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130041','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130042','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130043','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130044','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130045','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130046','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130047','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130048','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130049','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130050','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130051','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130052','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130053','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130054','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130055','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130056','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130057','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130058','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130059','ROLE_STU');
INSERT INTO AUTHORITIES VALUES ('20130060','ROLE_STU');



--건물 삽입 (건물 id, 건물이름)++ 예학관 - 인문대학 강의실(7)
--							 ++ 제2공학관 - 이공대학 강의실(5)
--							 ++ 광교관 - 연구실 (2)
--							 ++ 교수연구동 - 교수실(1)
INSERT INTO BUILDING VALUES (building_id_seq.nextval, '교수연구동', 'http://www.kyonggi.ac.kr/web/images/kgu/contents/sub03_img05.gif', 37.301926235559236, 127.03658138147823, '031-249-8815', '경기 수원시 영통구 이의동 산94-6');
INSERT INTO BUILDING VALUES (building_id_seq.nextval, '광교관', 'http://www.kyonggi.ac.kr/web/images/kgu/contents/sub02_img00.gif', 37.30108544952339, 127.03837999226404, '031-250-2821', '경기 수원시 영통구 이의동 산90-2');
INSERT INTO BUILDING VALUES (building_id_seq.nextval, '종합강의동', 'http://www.kyonggi.ac.kr/web/images/kgu/contents/sub03_img04.gif', 37.30142366474769, 127.03735940012322, '031-251-3015', '경기 수원시 영통구 이의동 산87-6');
INSERT INTO BUILDING VALUES (building_id_seq.nextval, '예지관', 'http://www.kyonggi.ac.kr/web/images/kgu/contents/sub03_img13.gif', 37.30081123274915, 127.03648496935729, '031-252-1279', '경기 수원시 영통구 이의동 산91-2');
INSERT INTO BUILDING VALUES (building_id_seq.nextval, '제2공학관', 'http://www.kyonggi.ac.kr/web/images/kgu/contents/sub02_img01.gif', 37.30032803923929, 127.04000942240694, '031-230-2316', '경기 수원시 영통구 이의동 산99-1');
INSERT INTO BUILDING VALUES (building_id_seq.nextval, '육영관', 'http://www.kyonggi.ac.kr/web/images/kgu/contents/sub02_img05.gif', 37.300841865241324, 127.03930757227228, '031-255-2153', '경기 수원시 영통구 이의동 산88-7');
INSERT INTO BUILDING VALUES (building_id_seq.nextval, '예학관', 'http://www.kyonggi.ac.kr/web/images/kgu/contents/sub02_img08.gif', 37.30303749625641, 127.03412583008026, '031-229-1231', '경기 수원시 영통구 이의동 산77-6');
INSERT INTO BUILDING VALUES (building_id_seq.nextval, '호연관', 'http://www.kyonggi.ac.kr/web/images/kgu/contents/sub02_img10.gif', 37.304289978431434, 127.03397976138771, '031-254-4215', '경기 수원시 영통구 이의동 산91-3');

--방 삽입( 방ID, 방 이름, 건물 ID)
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문100호',7);--인문대학 강의실1
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문200호',7);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문300호',7);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문400호',7);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문500호',7);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문600호',7);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문700호',7);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문800호',7);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문900호',7);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문1000호',7);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문1100호',7);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문1200호',7);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문1300호','7');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문1400호','7');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문1500호','7');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문1600호','7');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문1700호','7');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문1800호','7');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문1900호','7');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'인문2000호','7');

INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공100호',5);--이공대학 강의실21
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공200호',5);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공300호',5);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공400호',5);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공500호',5);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공600호',5);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공700호',5);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공800호',5);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공900호',5);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공1000호',5);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공1100호',5);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공1200호',5);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공1300호','5');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공1400호','5');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공1500호','5');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공1600호','5');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공1700호','5');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공1800호','5');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공1900호','5');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'이공2000호','5');

INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구100호',2);-- 연구실41
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구200호',2);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구300호',2);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구400호',2);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구500호',2);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구600호',2);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구700호',2);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구800호',2);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구900호',2);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구1000호',2);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구1100호',2);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구1200호',2);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구1300호','2');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구1400호','2');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구1500호','2');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구1600호','2');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구1700호','2');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구1800호','2');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구1900호','2');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'연구2000호','2');

INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수100호',1);-- 교수실61
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수200호',1);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수300호',1);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수400호',1);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수500호',1);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수600호',1);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수700호',1);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수800호',1);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수900호',1);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수1000호',1);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수1100호',1);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수1200호',1);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수1300호','1');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수1400호','1');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수1500호','1');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수1600호','1');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수1700호','1');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수1800호','1');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수1900호','1');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교수2000호','1');

INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양100호',3);-- 교양강의동81
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양200호',3);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양300호',3);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양400호',3);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양500호',3);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양600호',3);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양700호',3);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양800호',3);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양900호',3);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양1000호',3);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양1100호',3);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양1200호',3);
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양1300호','3');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양1400호','3');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양1500호','3');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양1600호','3');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양1700호','3');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양1800호','3');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양1900호','3');
INSERT INTO ROOM VALUES(ROOM_ID_SEQ.NEXTVAL,'교양2000호','3');


--단과대학 (단과대학ID, 단과대학명)
INSERT INTO COLLEGE VALUES(COLLEGE_ID_SEQ.NEXTVAL,'인문사회대학');
INSERT INTO COLLEGE VALUES(COLLEGE_ID_SEQ.NEXTVAL,'이공대학');

--학과 (학과ID, 학과이름, 단과대학 ID)
INSERT INTO MAJOR VALUES(MAJOR_ID_SEQ.NEXTVAL, '국어국문학과', 1);--인문대학
INSERT INTO MAJOR VALUES(MAJOR_ID_SEQ.NEXTVAL, '영어영문학과', 1);
INSERT INTO MAJOR VALUES(MAJOR_ID_SEQ.NEXTVAL, '문예창작학과', 1);

INSERT INTO MAJOR VALUES(MAJOR_ID_SEQ.NEXTVAL, '건축학과', 2);--공과대학
INSERT INTO MAJOR VALUES(MAJOR_ID_SEQ.NEXTVAL, '토목공학과', 2);
INSERT INTO MAJOR VALUES(MAJOR_ID_SEQ.NEXTVAL, '화학과', 2);


--졸업학점 (학과ID, 입학연도, 교양필수, 교양선택, 전공필수, 전공선택 졸업학점)
INSERT INTO GRADUATION_CREDIT VALUES(1,2013,34,26,50,40);--국어국문학과
INSERT INTO GRADUATION_CREDIT VALUES(1,2014,36,24,46,44);
INSERT INTO GRADUATION_CREDIT VALUES(1,2015,32,28,48,42);
INSERT INTO GRADUATION_CREDIT VALUES(1,2016,32,28,52,38);
INSERT INTO GRADUATION_CREDIT VALUES(1,2017,37,23,50,40);

INSERT INTO GRADUATION_CREDIT VALUES(2,2013,40,30,60,30);--영어영문학과
INSERT INTO GRADUATION_CREDIT VALUES(2,2014,40,20,47,43);
INSERT INTO GRADUATION_CREDIT VALUES(2,2015,50,40,55,35);
INSERT INTO GRADUATION_CREDIT VALUES(2,2016,36,24,57,33);
INSERT INTO GRADUATION_CREDIT VALUES(2,2017,34,26,60,40);

INSERT INTO GRADUATION_CREDIT VALUES(3,2013,30,30,40,40);--문예창작학과
INSERT INTO GRADUATION_CREDIT VALUES(3,2014,30,20,55,45);
INSERT INTO GRADUATION_CREDIT VALUES(3,2015,38,22,40,60);
INSERT INTO GRADUATION_CREDIT VALUES(3,2016,30,20,55,45);
INSERT INTO GRADUATION_CREDIT VALUES(3,2017,38,22,40,60);

INSERT INTO GRADUATION_CREDIT VALUES(4,2013,40,30,46,44);--건축학과
INSERT INTO GRADUATION_CREDIT VALUES(4,2014,40,30,46,44);
INSERT INTO GRADUATION_CREDIT VALUES(4,2015,45,35,50,40);
INSERT INTO GRADUATION_CREDIT VALUES(4,2016,55,45,46,44);
INSERT INTO GRADUATION_CREDIT VALUES(4,2017,55,35,45,55);

INSERT INTO GRADUATION_CREDIT VALUES(5,2013,40,30,46,44);--토목공학과
INSERT INTO GRADUATION_CREDIT VALUES(5,2014,56,24,46,44);
INSERT INTO GRADUATION_CREDIT VALUES(5,2015,36,24,46,44);
INSERT INTO GRADUATION_CREDIT VALUES(5,2016,36,24,46,44);
INSERT INTO GRADUATION_CREDIT VALUES(5,2017,36,24,46,44);

INSERT INTO GRADUATION_CREDIT VALUES(6,2013,40,30,46,44);--화학과
INSERT INTO GRADUATION_CREDIT VALUES(6,2014,36,24,46,44);
INSERT INTO GRADUATION_CREDIT VALUES(6,2015,36,24,46,44);
INSERT INTO GRADUATION_CREDIT VALUES(6,2016,36,24,46,44);
INSERT INTO GRADUATION_CREDIT VALUES(6,2017,36,24,46,44);

--학점기준 (입학년도, 학과ID, 최소학점, 최대학점, 장학금 최소학점,
--  	    유예최소학점, 유예최대학점)
INSERT INTO STANDARD VALUES(2013,1,12,21,16,1,21);--국어국문학과
INSERT INTO STANDARD VALUES(2014,1,12,21,16,3,21);
INSERT INTO STANDARD VALUES(2015,1,10,21,14,1,21);
INSERT INTO STANDARD VALUES(2016,1,12,21,16,3,21);
INSERT INTO STANDARD VALUES(2017,1,10,21,16,1,21);

INSERT INTO STANDARD VALUES(2013,2,12,20,18,1,20);--영어영문학과
INSERT INTO STANDARD VALUES(2014,2,10,21,16,1,21);
INSERT INTO STANDARD VALUES(2015,2,10,21,16,1,21);
INSERT INTO STANDARD VALUES(2016,2,12,21,16,2,21);
INSERT INTO STANDARD VALUES(2017,2,10,20,16,1,20);

INSERT INTO STANDARD VALUES(2013,3,12,20,18,1,20);--문예창작학과
INSERT INTO STANDARD VALUES(2014,3,10,21,16,1,21);
INSERT INTO STANDARD VALUES(2015,3,10,21,16,1,21);
INSERT INTO STANDARD VALUES(2016,3,12,21,16,2,21);
INSERT INTO STANDARD VALUES(2017,3,10,20,16,1,20);

INSERT INTO STANDARD VALUES(2013,4,12,20,18,1,20);--건축학과 
INSERT INTO STANDARD VALUES(2014,4,10,21,16,1,21);
INSERT INTO STANDARD VALUES(2015,4,10,21,16,1,21);
INSERT INTO STANDARD VALUES(2016,4,12,21,16,2,21);
INSERT INTO STANDARD VALUES(2017,4,10,20,16,1,20);

INSERT INTO STANDARD VALUES(2013,5,10,21,18,1,20);--토목공학과 
INSERT INTO STANDARD VALUES(2014,5,10,21,16,1,21);
INSERT INTO STANDARD VALUES(2015,5,10,21,16,1,21);
INSERT INTO STANDARD VALUES(2016,5,12,21,16,2,21);
INSERT INTO STANDARD VALUES(2017,5,10,20,16,1,20);

INSERT INTO STANDARD VALUES(2013,6,12,20,18,1,20);--화학과 
INSERT INTO STANDARD VALUES(2014,6,10,21,16,1,21);
INSERT INTO STANDARD VALUES(2015,6,10,21,16,1,21);
INSERT INTO STANDARD VALUES(2016,6,12,21,16,2,21);
INSERT INTO STANDARD VALUES(2017,6,10,20,16,1,20);



/**
 * 1 : 국어국문
 * 2 : 영어영문
 * 3 : 문예창작
 * 4 : 건축학과
 * 5 : 토목공학과
 * 6 : 화학과
 */
--학생 (학생 ID, 과정구분, 병영구분, 입학일자, 
--   졸업일자,학적구분, 학생구분, 학년,
--   졸업시험 패스여부, 조기졸업 대상여부, 학기, 
--	  학과ID, 복수전공 ID, 부전공 ID)
--병문
INSERT INTO STUDENT VALUES('20130001','학사','군필','2013-03-10','2016-02-20','졸업','정규학생',4, 'y', 'n','2학기', 1, 2,null);
INSERT INTO STUDENT VALUES('20130002','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130003','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130004','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130005','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130006','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130007','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130008','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130009','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130010','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130011','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130012','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130013','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130014','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130015','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130016','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130017','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130018','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130019','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130020','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130021','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130022','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130023','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130024','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130025','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130026','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130027','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130028','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130029','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130030','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130031','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130032','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130033','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130034','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130035','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130036','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130037','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130038','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130039','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130040','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130041','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130042','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130043','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130044','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130045','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130046','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130047','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130048','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130049','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130050','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130051','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130052','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130053','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130054','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130055','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130056','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130057','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130058','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130059','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);
INSERT INTO STUDENT VALUES('20130060','학사','군필','2013-03-10',NULL,'재학','정규학생','4','N','N','1학기','4',NULL,NULL);


--동준
INSERT INTO STUDENT VALUES('20140001','학사','군필','2014-03-09',NULL,'재학','편입학생',4, 'y' , 'n' ,'1학기', 4, 1,6);

INSERT INTO STUDENT VALUES('20140002','학사','군필','2014-03-09',NULL,'재학','정규학생',3, 'y' , 'n' ,'1학기', 4, 1,6);
INSERT INTO STUDENT VALUES('20140003','학사','군필','2014-03-09',NULL,'재학','정규학생',3, 'y' , 'n' ,'1학기', 4, 1,6);
INSERT INTO STUDENT VALUES('20140004','학사','군필','2014-03-09',NULL,'재학','정규학생',3, 'y' , 'n' ,'1학기', 4, 1,6);
INSERT INTO STUDENT VALUES('20140005','학사','군필','2014-03-09',NULL,'재학','정규학생',3, 'y' , 'n' ,'1학기', 4, 1,6);
INSERT INTO STUDENT VALUES('20140006','학사','군필','2014-03-09',NULL,'재학','정규학생',3, 'y' , 'n' ,'1학기', 4, 1,6);
INSERT INTO STUDENT VALUES('20140007','학사','군필','2014-03-09',NULL,'재학','정규학생',3, 'y' , 'n' ,'1학기', 4, 1,6);
INSERT INTO STUDENT VALUES('20140008','학사','군필','2014-03-09',NULL,'재학','편입학생',3, 'y' , 'n' ,'1학기', 4, 1,6);
INSERT INTO STUDENT VALUES('20140009','학사','군필','2014-03-09',NULL,'재학','편입학생',3, 'y' , 'n' ,'1학기', 4, 1,6);
INSERT INTO STUDENT VALUES('20140010','학사','군필','2014-03-09',NULL,'재학','편입학생',3, 'y' , 'n' ,'1학기', 4, 1,6);
INSERT INTO STUDENT VALUES('20140011','학사','군필','2014-03-09',NULL,'재학','편입학생',3, 'y' , 'n' ,'1학기', 4, 1,6);
INSERT INTO STUDENT VALUES('20140012','학사','군필','2014-03-09',NULL,'재학','편입학생',3, 'y' , 'n' ,'1학기', 4, 1,6);
INSERT INTO STUDENT VALUES('20140013','학사','군필','2014-03-09',NULL,'재학','편입학생',3, 'y' , 'n' ,'1학기', 4, 1,6);
INSERT INTO STUDENT VALUES('20140014','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140015','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140016','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140017','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140018','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140019','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140020','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140021','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140022','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140023','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140024','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140025','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140026','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140027','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140028','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140029','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140030','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140031','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140032','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140033','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140034','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140035','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140036','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140037','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140038','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140039','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140040','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140041','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140042','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140043','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140044','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140045','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140046','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140047','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140048','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140049','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140050','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140051','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140052','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140053','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140054','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140055','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140056','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140057','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140058','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140059','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);
INSERT INTO STUDENT VALUES('20140060','학사','군필','2014-03-09',NULL,'재학','정규학생',3,'N','N','1학기','3',NULL,NULL);


--영현
INSERT INTO STUDENT VALUES('20150001','학사',NULL ,'2015-03-11',NULL,'휴학','정규학생',3, NULL , 'n' ,'2학기', 2, NULL,NULL);
--진광
INSERT INTO STUDENT VALUES('20150002','학사','군필','2015-03-11',NULL,'휴학','편입학생',3, NULL , 'n' ,'2학기', 3, 2,1);
--승헌
INSERT INTO STUDENT VALUES('20150003','학사','군필','2015-03-11',NULL,'재학','정규학생',3, NULL , 'n' ,'1학기', 3, NULL,NULL);
--새롬
INSERT INTO STUDENT VALUES('20160001','학사',NULL,'2016-03-09',NULL,'재학','정규학생',1, NULL , 'n' ,'2학기', 2, NULL,4);
--진현
INSERT INTO STUDENT VALUES('20160002','학사','군필','2016-03-09',NULL,'재학','정규학생',2, NULL , 'n' ,'1학기', 4, NULL,NULL);






-- 교수 (교수 id, 졸업대학, 졸업대학원, 교수실전화번호, 연구실전화번호,
-- 		소속학과 id, 교수실id, 연구실 id) 61, 41

INSERT INTO PROFESSOR VALUES('1001','경희대학교','경희대학원','02-165-2647','02-964-1478',1,61,41);
INSERT INTO PROFESSOR VALUES('1002','경기대학교','경기대학원','02-564-6107','02-489-6147',1,62,42);
INSERT INTO PROFESSOR VALUES('1003','서울대학교','서울대학원','02-194-9724','02-645-4567',1,63,43);
INSERT INTO PROFESSOR VALUES('1004','서강대학교','서강대학원','02-987-1855','02-945-1781',1,64,44);
INSERT INTO PROFESSOR VALUES('1005','한성대학교','한성대학원','02-487-5913','02-516-7498',1,65,45);
INSERT INTO PROFESSOR VALUES('1006','경희대학교','경희대학원','02-617-5758','02-156-1647',4,66,46);
INSERT INTO PROFESSOR VALUES('1007','경희대학교','경희대학원','02-165-2647','02-964-1478',4,67,47);
INSERT INTO PROFESSOR VALUES('1008','경기대학교','경기대학원','02-564-6107','02-489-6147',4,68,48);
INSERT INTO PROFESSOR VALUES('1009','서울대학교','서울대학원','02-194-9724','02-645-4567',4,69,49);
INSERT INTO PROFESSOR VALUES('1010','서강대학교','서강대학원','02-987-1855','02-945-1781',4,60,50);
INSERT INTO PROFESSOR VALUES('1011','한성대학교','한성대학원','02-487-5913','02-516-7498',NULL,61,51);
INSERT INTO PROFESSOR VALUES('1012','경희대학교','경희대학원','02-617-5758','02-156-1647',NULL,62,52);
INSERT INTO PROFESSOR VALUES('1013','경기대학교','경기대학원','02-564-6107','02-489-6147',NULL,63,53);
INSERT INTO PROFESSOR VALUES('1014','서울대학교','서울대학원','02-194-9724','02-645-4567',NULL,64,54);
INSERT INTO PROFESSOR VALUES('1015','서강대학교','서강대학원','02-987-1855','02-945-1781',NULL,65,55);
INSERT INTO PROFESSOR VALUES('1016','한성대학교','한성대학원','02-487-5913','02-516-7498',NULL,66,56);
INSERT INTO PROFESSOR VALUES('1017','경희대학교','경희대학원','02-617-5758','02-156-1647',NULL,67,57);	
INSERT INTO PROFESSOR VALUES('1018','한성대학교','한성대학원','02-487-5913','02-516-7498',NULL,68,58);
INSERT INTO PROFESSOR VALUES('1019','경희대학교','경희대학원','02-617-5758','02-156-1647',NULL,69,59);	
		
--과목( 과목 ID, 과목이름, 강의시간, 이수구분, 학점,
--     정원, 신청인원, 학년, 분반, 폐강여부, 1학기,
--     학과ID, 강의실 ID) 수강했던 과목1~6(학점 테이블), 수강하는 과목(수강 테이블)

/**
 * 1 : 국어국문
 * 2 : 영어영문
 * 3 : 문예창작
 * 4 : 건축학과
 * 5 : 토목공학과
 * 6 : 화학과
 */
/***************************************************국어국문학과********************************************/
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'국어학개론','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','1학기'					,1,6);--1학기 1 ----A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'국문학개론','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','1학기'					,1,7);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'국어문법론','화<1&2>_화<3&4>','필수전공',3,60, 55, 3,'1분반','n','1학기'					,1,8);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'국어사','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','1학기'						,1,9);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'한국현대시론','수<1&2>_수<3&4>','선택전공',3,60, 55, 3,'1분반','n','1학기'					,1,10);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'한국문학사','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','1학기'					,1,6);--1학기 6 ------B 
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'국어정서법','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','1학기'					,1,7);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'구비문학론','화<1&2>_화<3&4>','필수전공',3,60, 55, 3,'1분반','n','1학기'					,1,8);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'국어의미론','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','1학기'					,1,9);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'한국학문학','수<1&2>_수<3&4>','선택전공',3,60, 55, 3,'1분반','n','1학기'					,1,10);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'국민윤리','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'						,1,11);--2학기 11----A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'한국현대소설론','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','2학기'				,1,12);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'고전소설론','화<1&2>_화<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'					,1,13);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'한국현대희곡론','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','2학기'				,1,14);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'국어음운론','수<1&2>_수<3&4>','선택전공',3,60, 55, 3,'1분반','n','2학기'					,1,15);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'언어와여성','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'					,1,11);--2학기 16----B
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'한국어형태론','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','2학기'					,1,12);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'한국고전소설읽기','화<1&2>_화<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'				,1,13);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'창작의이론과실기','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','2학기'				,1,14);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'시의 모든 구성요소','수<1&2>_수<3&4>','선택전공',3,60, 55, 3,'1분반','n','2학기'			,1,15);
/***************************************************영어영문학과*********************************************/
--1학기
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영국문학개관','월<1&2>_월<3&4>','필수전공',3,40, 40, 3,'1분반','n','1학기'				,2,11);--1학기21----A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'고급영문법','월<5&6>_월<7&8>','선택전공',3,60, 53, 1,'1분반','n','1학기'				,2,12);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'중급영어','화<1&2>_화<3&4>','선택전공',3,60, 50, 2,'1분반','n','1학기'					,2,13);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영어학개론','화<5&6>_화<7&8>','필수전공',3,55, 50, 3,'1분반','n','1학기'				,2,14);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'19세기영미소설','수<1&2>_수<3&4>','필수전공',3,65, 52, 3,'1분반','n','1학기'			,2,15);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영미문화의 이해','월<1&2>_월<3&4>','필수전공',3,40, 40, 3,'1분반','n','1학기'			,2,11);--1학기26----B
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영어음성학','월<5&6>_월<7&8>','선택전공',3,60, 53, 1,'1분반','n','1학기'				,2,12);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영어낱말분석','화<1&2>_화<3&4>','선택전공',3,60, 50, 2,'1분반','n','1학기'				,2,13);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영어구조론','화<5&6>_화<7&8>','필수전공',3,55, 50, 3,'1분반','n','1학기'				,2,14);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영어담화분석','수<1&2>_수<3&4>','필수전공',3,65, 52, 3,'1분반','n','1학기'				,2,15);
--2학기
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영어발달사','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'				,2,11);--1학기31--A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영어글쓰기','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','2학기'				,2,12);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'미국문화개관','화<1&2>_화<3&4>','선택전공',3,60, 55, 3,'1분반','n','2학기'				,2,13);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'미국문화','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','2학기'					,2,14);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영국사상','수<1&2>_수<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'					,2,15);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영어화용론','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'				,2,11);--1학기36--B
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'응용언어학의이해','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','2학기'			,2,12);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영어속담의 이해','화<1&2>_화<3&4>','선택전공',3,60, 55, 3,'1분반','n','2학기'			,2,13);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영문소설 원문으로 읽기','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','2학기'		,2,14);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'영어명언 분석과 이론','수<1&2>_수<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'		,2,15);
/***************************************************문예창작학과*********************************************/
--1학기
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'문예창작의 방법과 실제','월<1&2>_월<3&4>','필수전공',3,55, 50, 2,'1분반','n','1학기'		,3,1);--1학기41--A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'수기 강의록 문예창작','월<5&6>_월<7&8>','필수전공',3,60, 10, 3,'1분반','y','1학기'		,3,2);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'문예의 바다','화<1&2>_화<3&4>','선택전공',3,60, 55, 1,'1분반','n','1학기'				,3,3);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'문예창작의 길과 주변풍경','화<5&6>_화<7&8>','선택전공',3,40, 30, 2,'1분반','n','1학기'	,3,4);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'신춘문예의 모든것 ','수<1&2>_수<3&4>','필수전공',3,50, 40, 2,'1분반','n','1학기'		,3,5);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'문학개론','월<1&2>_월<3&4>','필수전공',3,55, 50, 2,'1분반','n','1학기'					,3,1);--1학기46--B
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'문학과 언어','월<5&6>_월<7&8>','필수전공',3,60, 10, 3,'1분반','y','1학기'				,3,2);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'번역과 모국어','화<1&2>_화<3&4>','선택전공',3,60, 55, 1,'1분반','n','1학기'				,3,3);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'한국문학사','화<5&6>_화<7&8>','선택전공',3,40, 30, 2,'1분반','n','1학기'				,3,4);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'현대소설론 ','수<1&2>_수<3&4>','필수전공',3,50, 40, 2,'1분반','n','1학기'				,3,5);
--2학기
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'창작과 사고능력','월<1&2>_월<3&4>','필수전공',3,70, 60, 3,'1분반','n','2학기'			,3,1);--2학기51--A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'세계문학기행','월<5&6>_월<7&8>','필수전공',3,70, 60, 3,'1분반','n','2학기'				,3,2);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'희곡의이해','화<1&2>_화<3&4>','필수전공',3,70, 60, 3,'1분반','n','2학기'				,3,3);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'문창지도','화<5&6>_화<7&8>','선택전공',3,70, 60, 3,'1분반','n','2학기'					,3,4);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'삶과 표현','수<1&2>_수<3&4>','선택전공',3,70, 60, 3,'1분반','n','2학기'					,3,5);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'동양 고전 읽기','월<1&2>_월<3&4>','필수전공',3,70, 60, 3,'1분반','n','2학기'			,3,1);--2학기56--B
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'서양 고전 읽기','월<5&6>_월<7&8>','필수전공',3,70, 60, 3,'1분반','n','2학기'			,3,2);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'세계문학특강','화<1&2>_화<3&4>','필수전공',3,70, 60, 3,'1분반','n','2학기'				,3,3);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'현대문학사특강','화<5&6>_화<7&8>','선택전공',3,70, 60, 3,'1분반','n','2학기'			,3,4);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'국문학의 이론과 실재','수<1&2>_수<3&4>','선택전공',3,70, 60, 3,'1분반','n','2학기'		,3,5);


/***************************************************건축학과*********************************************/
--1학기
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축이란 무엇인가','월<1&2>_월<3&4>','필수전공',3,50, 50, 4,'1분반','n','1학기'	,4,21);--1학기 61A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축과 사회','월<5&6>_월<7&8>','필수전공',3,70, 10, 4,'1분반','n','1학기'		,4,22);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축설계','화<1&2>_화<3&4>','필수전공',3,50, 50, 2,'1분반','n','1학기'			,4,23);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축학개론','화<5&6>_화<7&8>','선택전공',3,60, 58, 3,'1분반','n','1학기'		,4,24);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축조경','수<1&2>_수<3&4>','선택전공',3,50, 46, 3,'1분반','n','1학기'			,4,25);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'공학수학','월<1&2>_월<3&4>','필수전공',3,50, 50, 4,'1분반','n','1학기'			,4,21);--1학기 66B
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축전산','월<5&6>_월<7&8>','필수전공',3,70, 10, 4,'1분반','n','1학기'			,4,22);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축재료역학','화<1&2>_화<3&4>','필수전공',3,50, 50, 2,'1분반','n','1학기'		,4,23);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축구조해석','화<5&6>_화<7&8>','선택전공',3,60, 58, 3,'1분반','n','1학기'		,4,24);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'구조동역학','수<1&2>_수<3&4>','선택전공',3,50, 46, 3,'1분반','n','1학기'		,4,25);
--2학기
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건물열에너지론','월<1&2>_월<3&4>','필수전공',3,50, 50, 4,'1분반','n','2학기'	,4,21);--2학기 71A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축환경계획','월<5&6>_월<7&8>','필수전공',3,50, 50, 4,'1분반','n','2학기'	    ,4,22);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'감응의 건축','화<1&2>_화<3&4>','필수전공',3,50, 50, 4,'1분반','n','2학기'		,4,23);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건물유지및관리','화<5&6>_화<7&8>','선택전공',3,50, 50, 4,'1분반','n','2학기'	,4,24);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'철골구조설계','수<1&2>_수<3&4>','선택전공',3,50, 50, 4,'1분반','n','2학기'		,4,25);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축미학','월<1&2>_월<3&4>','필수전공',3,50, 50, 4,'1분반','n','2학기'			,4,21);--2학기 76B
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'공간 공감','월<5&6>_월<7&8>','필수전공',3,50, 50, 4,'1분반','n','2학기'	    	,4,22);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'감응의 건축','화<1&2>_화<3&4>','필수전공',3,50, 50, 4,'1분반','n','2학기'		,4,23);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'공간열기','화<5&6>_화<7&8>','선택전공',3,50, 50, 4,'1분반','n','2학기'	    	,4,24);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축 사유의 기호','수<1&2>_수<3&4>','선택전공',3,50, 50, 4,'1분반','n','2학기'	,4,25);


/***************************************************토목공학과********************************************/
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'구조역학','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','1학기'						,5,26);--1학기81A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'기초수문학','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','1학기'					,5,27);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'철근콘크리트','화<1&2>_화<3&4>','필수전공',3,60, 55, 3,'1분반','n','1학기'					,5,28);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'응용수리학','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','1학기'					,5,29);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'토질역학','수<1&2>_수<3&4>','선택전공',3,60, 55, 3,'1분반','n','1학기'						,5,30);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'토목공학개론','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','1학기'						,5,26);--1학기86B
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'공업역학','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','1학기'					,5,27);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'토목CAD','화<1&2>_화<3&4>','필수전공',3,60, 55, 3,'1분반','n','1학기'					,5,28);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'수리학 및 실험','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','1학기'					,5,29);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'측량학 및 실습','수<1&2>_수<3&4>','선택전공',3,60, 55, 3,'1분반','n','1학기'						,5,30);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'강구조공학','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'					,5,26);--2학기 91A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'상하수도공학','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','2학기'					,5,27);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'전산구조해석','화<1&2>_화<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'					,5,28);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'p.s콘크리트','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','2학기'					,5,29);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'환경기반 시설설계','수<1&2>_수<3&4>','선택전공',3,60, 55, 3,'1분반','n','2학기'				,5,30);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'지반공학 및 실험','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'					,5,26);--2학기 96A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'토목설계제도','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','2학기'					,5,27);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'상수도공학','화<1&2>_화<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'					,5,28);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'기초공학','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','2학기'					,5,29);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'하수도공학','수<1&2>_수<3&4>','선택전공',3,60, 55, 3,'1분반','n','2학기'				,5,30);

/***************************************************화학과********************************************/
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'생명과학','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','1학기'						,5,31);--1학기101A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'미적분학','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','1학기'						,5,32);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'일반물리학','화<1&2>_화<3&4>','필수전공',3,60, 55, 3,'1분반','n','1학기'					,5,33);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'일반화학','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','1학기'						,5,34);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'유기화학','수<1&2>_수<3&4>','선택전공',3,60, 55, 3,'1분반','n','1학기'						,5,35);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'나노물리화학','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','1학기'						,5,31);--1학기106B
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'화학동역학','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','1학기'						,5,32);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'분리분석','화<1&2>_화<3&4>','필수전공',3,60, 55, 3,'1분반','n','1학기'					,5,33);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'유기화학특론','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','1학기'						,5,34);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'화학특수연구','수<1&2>_수<3&4>','선택전공',3,60, 55, 3,'1분반','n','1학기'						,5,35);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'자연인턴십','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'						,5,31);--2학기111A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'고체화학','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','2학기'						,5,32);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'나노소재화학','화<1&2>_화<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'						,5,33);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'분자분광학','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','2학기'						,5,34);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'통계열역학','수<1&2>_수<3&4>','선택전공',3,60, 55, 3,'1분반','n','2학기'						,5,35);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'생화학','월<1&2>_월<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'						,5,31);--2학기116B
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'분석화학','월<5&6>_월<7&8>','필수전공',3,60, 55, 3,'1분반','n','2학기'						,5,32);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'무기화학','화<1&2>_화<3&4>','필수전공',3,60, 55, 3,'1분반','n','2학기'						,5,33);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'물리화학','화<5&6>_화<7&8>','선택전공',3,60, 55, 3,'1분반','n','2학기'						,5,34);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'물리실험','수<1&2>_수<3&4>','선택전공',3,60, 55, 3,'1분반','n','2학기'						,5,35);


/***************************************************교양*********************************************/
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'취업집중영어','수<5&6>_수<7&8>','필수교양',2,5, 0, 2,'1분반','n','1학기',null,			81);--1학기 121A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'시베리아기행','목<1&2>_목<3&4>','선택교양',2,50, 50, 3,'1분반','n','1학기',null,		82);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'스키','목<5&6>_목<7&8>','선택교양',2,50, 42, 2,'1분반','n','1학기',null,				83);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'엑셀과 파워포인트','금<1&2>_금<3&4>','필수교양',2,50, 40, 1,'1분반','n','1학기',null,	84);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'태권도','금<5&6>_금<7&8>','필수교양',2,50, 50, 2,'1분반','n','1학기',null,				85);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'러시아영화와 연극','수<5&6>_수<7&8>','필수교양',2,5, 0, 2,'1분반','n','1학기',null,		81);--1학기 126A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'게임과 디자인','목<1&2>_목<3&4>','선택교양',2,50, 50, 3,'1분반','n','1학기',null,		82);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'디자인사','목<5&6>_목<7&8>','선택교양',2,50, 42, 2,'1분반','n','1학기',null,			83);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'수채화의 기초','금<1&2>_금<3&4>','필수교양',2,50, 40, 1,'1분반','n','1학기',null,		84);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'예술치료기법과 적용','금<5&6>_금<7&8>','필수교양',2,50, 50, 2,'1분반','n','1학기',null,	85);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'글쓰기의 이해','수<5&6>_수<7&8>','필수교양',3,50, 50, 4,'1분반','n','2학기',null,		86);--2학기 131A
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'생활과 영양정보','목<1&2>_목<3&4>','선택교양',2,50, 50, 3,'1분반','n','2학기',null,		87);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'색채심리학','목<5&6>_목<7&8>>','선택교양',2,50, 50, 2,'1분반','n','2학기',null,		85);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'커피와 바리스타','금<1&2>_금<3&4>','필수교양',3,50, 50, 4,'1분반','n','2학기',null,		86);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'문학으로의 여행','금<5&6>_금<7&8>','필수교양',2,50, 50, 3,'1분반','n','2학기',null,		87);	

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'예술치료기법과 적용','수<5&6>_수<7&8>','필수교양',3,50, 50, 4,'1분반','n','2학기',null,	86);--2학기 136B
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'디자인드로잉의 기초','목<1&2>_목<3&4>','선택교양',2,50, 50, 3,'1분반','n','2학기',null,	87);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'뮤지컬의 이해','목<5&6>_목<7&8>>','선택교양',2,50, 50, 2,'1분반','n','2학기',null,		85);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'미디어산업의 이해','금<1&2>_금<3&4>','필수교양',3,50, 50, 4,'1분반','n','2학기',null,	86);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'문화행사기획','금<5&6>_금<7&8>','필수교양',2,50, 50, 3,'1분반','n','2학기',null,		87);

/*************************************************계절학기*****************************************/
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축이란 무엇인가','월<1&2>_월<3&4>','필수전공',3,50, 50, 4,'1분반','n','여름학기'	,4,21);--여름학기 141
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축과 사회','월<5&6>_월<7&8>','필수전공',3,70, 10, 4,'1분반','n','여름학기'		,4,22);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축설계','화<1&2>_화<3&4>','필수전공',3,50, 50, 2,'1분반','n','여름학기'			,4,23);

INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'감응의 건축','화<1&2>_화<3&4>','필수전공',3,50, 50, 4,'1분반','n','겨울학기'		,4,23);--겨울학기 144
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'공간열기','화<5&6>_화<7&8>','선택전공',3,50, 50, 4,'1분반','n','겨울학기'	    	,4,24);
INSERT INTO SUBJECT VALUES(SUBJECT_ID_SEQ.NEXTVAL,'건축 사유의 기호','수<1&2>_수<3&4>','선택전공',3,50, 50, 4,'1분반','n','겨울학기'	,4,25);


-- 교수 담당 과목 (교수 담당 과목의 학기와, 과목의 학기를 맞춰야 한다.)
-- 교담 ID, 학기, 연도, 교수ID, 과목ID 

-- 인문대학교 담당과목
/*****************************국어국문학 담당과목**************************************/
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1001','1');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1002','2');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1003','3');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1004','4');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1005','5');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1001','6');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1002','7');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1003','8');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1004','9');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1005','10');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1001','11');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1002','12');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1003','13');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1004','14');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1005','15');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1001','16');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1002','17');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1003','18');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1004','19');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1005','20');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1001','1');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1002','2');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1003','3');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1004','4');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1005','5');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1001','6');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1002','7');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1003','8');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1004','9');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1005','10');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1001','11');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1002','12');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1003','13');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1004','14');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1005','15');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1001','16');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1002','17');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1003','18');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1004','19');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1005','20');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1001','1');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1002','2');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1003','3');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1004','4');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1005','5');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1001','6');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1002','7');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1003','8');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1004','9');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1005','10');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1001','11');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1002','12');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1003','13');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1004','14');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1005','15');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1001','16');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1002','17');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1003','18');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1004','19');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1005','20');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1001','1');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1002','2');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1003','3');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1004','4');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1005','5');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1001','6');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1002','7');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1003','8');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1004','9');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1005','10');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1001','11');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1002','12');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1003','13');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1004','14');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1005','15');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1001','16');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1002','17');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1003','18');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1004','19');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1005','20');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1001','1');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1002','2');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1003','3');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1004','4');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1005','5');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1001','6');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1002','7');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1003','8');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1004','9');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1005','10');

/*****************************영어영문학 담당과목**************************************/
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1001','21');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1002','22');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1003','23');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1004','24');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1005','25');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1001','26');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1002','27');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1003','28');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1004','29');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1005','30');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1001','31');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1002','32');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1003','33');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1004','34');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1005','35');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1001','36');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1002','37');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1003','38');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1004','39');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1005','40');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1001','21');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1002','22');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1003','23');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1004','24');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1005','25');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1001','26');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1002','27');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1003','28');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1004','29');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1005','30');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1001','31');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1002','32');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1003','33');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1004','34');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1005','35');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1001','36');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1002','37');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1003','38');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1004','39');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1005','40');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1001','21');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1002','22');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1003','23');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1004','24');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1005','25');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1001','26');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1002','27');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1003','28');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1004','29');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1005','30');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1001','31');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1002','32');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1003','33');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1004','34');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1005','35');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1001','36');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1002','37');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1003','38');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1004','39');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1005','40');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1001','21');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1002','22');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1003','23');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1004','24');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1005','25');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1001','26');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1002','27');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1003','28');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1004','29');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1005','30');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1001','31');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1002','32');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1003','33');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1004','34');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1005','35');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1001','36');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1002','37');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1003','38');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1004','39');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1005','40');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1001','21');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1002','22');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1003','23');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1004','24');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1005','25');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1001','26');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1002','27');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1003','28');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1004','29');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1005','30');

/*****************************문예창작과 담당과목**************************************/
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1001','41');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1002','42');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1003','43');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1004','44');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1005','45');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1001','46');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1002','47');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1003','48');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1004','49');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1005','50');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1001','51');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1002','52');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1003','53');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1004','54');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1005','55');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1001','56');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1002','57');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1003','58');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1004','59');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1005','60');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1001','41');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1002','42');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1003','43');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1004','44');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1005','45');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1001','46');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1002','47');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1003','48');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1004','49');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1005','50');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1001','51');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1002','52');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1003','53');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1004','54');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1005','55');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1001','56');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1002','57');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1003','58');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1004','59');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1005','60');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1001','41');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1002','42');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1003','43');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1004','44');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1005','45');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1001','46');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1002','47');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1003','48');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1004','49');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1005','50');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1001','51');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1002','52');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1003','53');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1004','54');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1005','55');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1001','56');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1002','57');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1003','58');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1004','59');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1005','60');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1001','41');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1002','42');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1003','43');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1004','44');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1005','45');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1001','46');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1002','47');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1003','48');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1004','49');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1005','50');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1001','51');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1002','52');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1003','53');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1004','54');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1005','55');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1001','56');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1002','57');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1003','58');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1004','59');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1005','60');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1001','41');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1002','42');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1003','43');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1004','44');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1005','45');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1001','46');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1002','47');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1003','48');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1004','49');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1005','50');

/*****************************건축학과 담당과목**************************************/
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1006','61');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1007','62');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1008','63');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1009','64');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1010','65');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1006','66');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1007','67');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1008','68');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1009','69');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1010','70');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1006','71');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1007','72');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1008','73');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1009','74');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1010','75');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1006','76');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1007','77');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1008','78');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1009','79');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1010','80');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1006','61');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1007','62');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1008','63');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1009','64');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1010','65');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1006','66');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1007','67');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1008','68');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1009','69');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1010','70');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1006','71');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1007','72');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1008','73');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1009','74');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1010','75');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1006','76');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1007','77');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1008','78');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1009','79');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1010','80');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1006','61');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1007','62');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1008','63');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1009','64');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1010','65');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1006','66');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1007','67');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1008','68');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1009','69');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1010','70');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1006','71');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1007','72');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1008','73');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1009','74');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1010','75');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1006','76');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1007','77');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1008','78');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1009','79');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1010','80');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1006','61');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1007','62');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1008','63');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1009','64');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1010','65');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1006','66');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1007','67');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1008','68');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1009','69');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1010','70');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1006','71');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1007','72');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1008','73');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1009','74');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1010','75');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1006','76');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1007','77');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1008','78');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1009','79');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1010','80');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1006','61');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1007','62');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1008','63');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1009','64');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1010','65');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1006','66');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1007','67');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1008','68');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1009','69');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1010','70');
/*****************************토목공학과 담당과목**************************************/
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1006','81');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1007','82');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1008','83');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1009','84');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1010','85');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1006','86');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1007','87');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1008','88');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1009','89');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1010','90');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1006','91');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1007','92');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1008','93');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1009','94');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1010','95');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1006','96');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1007','97');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1008','98');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1009','99');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1010','100');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1006','81');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1007','82');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1008','83');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1009','84');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1010','85');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1006','86');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1007','87');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1008','88');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1009','89');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1010','90');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1006','91');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1007','92');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1008','93');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1009','94');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1010','95');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1006','96');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1007','97');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1008','98');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1009','99');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1010','100');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1006','81');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1007','82');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1008','83');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1009','84');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1010','85');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1006','86');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1007','87');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1008','88');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1009','89');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1010','90');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1006','91');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1007','92');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1008','93');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1009','94');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1010','95');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1006','96');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1007','97');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1008','98');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1009','99');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1010','100');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1006','81');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1007','82');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1008','83');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1009','84');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1010','85');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1006','86');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1007','87');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1008','88');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1009','89');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1010','90');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1006','91');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1007','92');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1008','93');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1009','94');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1010','95');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1006','96');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1007','97');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1008','98');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1009','99');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1010','100');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1006','81');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1007','82');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1008','83');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1009','84');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1010','85');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1006','86');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1007','87');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1008','88');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1009','89');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1010','90');
/*****************************화학과 담당과목**************************************/
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1006','101');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1007','102');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1008','103');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1009','104');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1010','105');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1006','106');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1007','107');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1008','108');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1009','109');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1010','110');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1006','111');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1007','112');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1008','113');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1009','114');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1010','115');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1006','116');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1007','117');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1008','118');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1009','119');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1010','120');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1006','101');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1007','102');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1008','103');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1009','104');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1010','105');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1006','106');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1007','107');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1008','108');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1009','109');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1010','110');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1006','111');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1007','112');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1008','113');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1009','114');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1010','115');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1006','116');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1007','117');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1008','118');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1009','119');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1010','120');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1006','101');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1007','102');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1008','103');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1009','104');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1010','105');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1006','106');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1007','107');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1008','108');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1009','109');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1010','110');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1006','111');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1007','112');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1008','113');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1009','114');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1010','115');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1006','116');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1007','117');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1008','118');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1009','119');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1010','120');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1006','101');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1007','102');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1008','103');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1009','104');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1010','105');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1006','106');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1007','107');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1008','108');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1009','109');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1010','110');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1006','111');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1007','112');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1008','113');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1009','114');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1010','115');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1006','116');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1007','117');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1008','118');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1009','119');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1010','120');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1006','101');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1007','102');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1008','103');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1009','104');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1010','105');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1006','106');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1007','107');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1008','108');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1009','109');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1010','110');

/*****************************교양 담당과목**************************************/
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1011','121');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1012','122');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1013','123');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1014','124');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1015','125');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1011','126');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1012','127');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1013','128');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1014','129');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2013','1015','130');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1011','131');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1012','132');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1013','133');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1014','134');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1015','135');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1011','136');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1012','137');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1013','138');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1014','139');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2013','1015','140');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1011','121');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1012','122');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1013','123');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1014','124');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1015','125');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1011','126');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1012','127');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1013','128');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1014','129');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2014','1015','130');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1011','131');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1012','132');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1013','133');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1014','134');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1015','135');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1011','136');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1012','137');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1013','138');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1014','139');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2014','1015','140');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1011','121');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1012','122');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1013','123');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1014','124');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1015','125');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1011','126');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1012','127');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1013','128');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1014','129');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2015','1015','130');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1011','131');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1012','132');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1013','133');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1014','134');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1015','135');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1011','136');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1012','137');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1013','138');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1014','139');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2015','1015','140');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1011','121');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1012','122');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1013','123');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1014','124');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1015','125');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1011','126');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1012','127');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1013','128');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1014','129');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2016','1015','130');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1011','131');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1012','132');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1013','133');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1014','134');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1015','135');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1011','136');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1012','137');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1013','138');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1014','139');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'2학기','2016','1015','140');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1011','121');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1012','122');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1013','123');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1014','124');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1015','125');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1011','126');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1012','127');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1013','128');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1014','129');
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'1학기','2017','1015','130');

/*****************************계절학기 담당과목**************************************/
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'여름학기','2013','1006','141');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'여름학기','2013','1007','142');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'여름학기','2013','1008','143');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'겨울학기','2013','1009','144');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'겨울학기','2013','1010','145');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'겨울학기','2013','1011','146');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'여름학기','2014','1006','141');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'여름학기','2014','1007','142');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'여름학기','2014','1008','143');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'겨울학기','2014','1009','144');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'겨울학기','2014','1010','145');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'겨울학기','2014','1011','146');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'여름학기','2015','1006','141');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'여름학기','2015','1007','142');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'여름학기','2015','1008','143');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'겨울학기','2015','1009','144');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'겨울학기','2015','1010','145');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'겨울학기','2015','1011','146');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'여름학기','2016','1006','141');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'여름학기','2016','1007','142');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'여름학기','2016','1008','143');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'겨울학기','2016','1009','144');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'겨울학기','2016','1010','145');	
INSERT INTO PROFESSOR_SUBJECT VALUES(PRO_SUBJECT_ID_SEQ.NEXTVAL,'겨울학기','2016','1011','146');	


-- 수강( 수강id, 연도, 학기, 과목id, 학생ID, 교수ID)
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','61','20140001','1006');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','63','20140001','1008');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','64','20140001','1009');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','65','20140001','1010');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','121','20140001','1011');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','123','20140001','1013');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','124','20140001','1014');

INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','71','20140001','1006');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','72','20140001','1007');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','74','20140001','1009');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','75','20140001','1010');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','131','20140001','1011');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','132','20140001','1012');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2017','2학기','134','20140001','1014');

INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','66','20140001','1006');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','68','20140001','1008');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','70','20140001','1010');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','69','20140001','1009');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','126','20140001','1011');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','128','20140001','1013');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','130','20140001','1015');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','여름학기','143','20140001','1008');

INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','2학기','76','20140001','1006');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','2학기','79','20140001','1009');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','2학기','77','20140001','1007');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','2학기','78','20140001','1008');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','2학기','137','20140001','1012');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','2학기','138','20140001','1013');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','2학기','140','20140001','1015');

INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2017','1학기','66','20140001','1006');--
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2017','1학기','69','20140001','1009');--
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2017','1학기','63','20140001','1008');--
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2017','1학기','65','20140001','1010');--
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2017','1학기','122','20140001','1012');--
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2017','1학기','125','20140001','1015');--
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2017','1학기','124','20140001','1014');--

INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','48','20140002','1003');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','48','20140003','1003');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','48','20140004','1003');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','48','20140005','1003');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','48','20140006','1003');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','48','20140007','1003');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','48','20140008','1003');

INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','48','20140009','1003');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','48','20140010','1003');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','48','20140011','1003');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','48','20140012','1003');

INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','41','20150002','1001');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','43','20150002','1003');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','45','20150002','1005');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','44','20150002','1004');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','121','20150002','1011');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','122','20150002','1012');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','1학기','125','20150002','1015');

INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','52','20150002','1002');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','53','20150002','1003');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','55','20150002','1005');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','54','20150002','1004');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','131','20150002','1011');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','133','20150002','1013');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2015','2학기','135','20150002','1015');

INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','46','20150002','1001');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','48','20150002','1003');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','50','20150002','1005');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','47','20150002','1002');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','137','20150002','1012');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','138','20150002','1013');
INSERT INTO COURSE VALUES(COURSE_ID_SEQ.NEXTVAL,'2016','1학기','140','20150002','1014');

-- 학점 ( 학점ID, 연도, 학기, 취득학점, 등급, 학점, 재수강여부, 과목ID, 학생ID)
----졸업생 (이병문 20130001)
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','1학기','3','A+','4.5','N','2','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','1학기','3','A+','4.5','N','3','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','1학기','3','A+','4.5','N','1','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','1학기','3','A+','4.5','N','5','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','1학기','2','A+','4.5','N','121','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','1학기','2','A+','4.5','N','123','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','1학기','2','A+','4.5','N','125','20130001');--
 
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','2학기','3','A+','4.5','N','11','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','2학기','3','B+','3.5','N','13','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','2학기','3','A+','4.5','N','15','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','2학기','3','A+','4.5','N','14','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','2학기','2','A+','4.5','N','135','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','2학기','2','A+','4.5','N','131','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2013','2학기','2','A+','4.5','N','132','20130001');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','1학기','3','A+','4.5','N','6','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','1학기','3','A+','4.5','N','8','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','1학기','3','A+','4.5','N','9','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','1학기','3','A+','4.5','N','5','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','1학기','2','A+','4.5','N','126','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','1학기','2','A+','4.5','N','128','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','1학기','2','A+','4.5','N','129','20130001');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','2학기','3','A+','4.5','N','16','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','2학기','3','B+','3.5','N','17','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','2학기','3','A+','4.5','N','19','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','2학기','3','A+','4.5','N','20','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','2학기','2','A+','4.5','N','136','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','2학기','2','A+','4.5','N','137','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2014','2학기','2','A+','4.5','N','139','20130001');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','3','A+','4.5','N','2','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','3','A+','4.5','N','3','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','3','A+','4.5','N','1','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','3','A+','4.5','N','5','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','2','A+','4.5','N','121','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','2','A+','4.5','N','123','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','2','A+','4.5','N','125','20130001');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','3','A+','4.5','N','11','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','3','B+','3.5','N','13','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','3','A+','4.5','N','15','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','3','A+','4.5','N','14','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','2','A+','4.5','N','135','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','2','A+','4.5','N','131','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','2','A+','4.5','N','132','20130001');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','A+','4.5','N','6','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','A+','4.5','N','8','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','A+','4.5','N','9','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','A+','4.5','N','5','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','2','A+','4.5','N','126','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','2','A+','4.5','N','128','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','2','A+','4.5','N','129','20130001');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','3','A+','4.5','N','16','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','3','B+','3.5','N','17','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','3','A+','4.5','N','19','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','3','A+','4.5','N','20','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','2','A+','4.5','N','136','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','2','A+','4.5','N','137','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','2','A+','4.5','N','139','20130001');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','3','A+','4.5','N','6','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','3','A+','4.5','N','8','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','3','A+','4.5','N','9','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','3','A+','4.5','N','5','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','2','A+','4.5','N','126','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','2','A+','4.5','N','128','20130001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','2','A+','4.5','N','129','20130001');--

--학고 2회 맞은 사람 20150002
--★★★★★★★★★★★★★★★★★★★★★★★★★★하나만 A+
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','0','F','0','N','41','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','0','F','0','N','43','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','3','A+','4.5','N','45','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','0','F','0','N','44','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','0','F','0','N','121','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','0','F','0','N','122','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','0','F','0','N','125','20150002');--

--★★★★★★★★★★★★★★★★★★★★★★★★★★올FF
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','0','F','0','N','52','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','0','F','0','N','53','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','0','F','0','N','55','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','0','F','0','N','54','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','0','F','0','N','131','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','0','F','0','N','133','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','0','F','0','N','135','20150002');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','A','4','N','46','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','B','3','N','48','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','0','F','0','N','50','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','0','F','0','N','47','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','0','F','0','N','137','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','0','F','0','N','138','20150002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','0','F','0','N','140','20150002');--

--모든 성적이 들어간 학생(20140001)
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','3','A','4','N','61','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','3','D+','2.5','N','63','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','3','A','4','N','64','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','3','A','4','N','65','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','2','B+','3.5','N','121','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','2','C','3','N','123','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','2','A','4','N','124','20140001');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','3','A','4','N','71','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','3','D+','2.5','N','72','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','3','A','4','N','74','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','3','A','4','N','75','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','2','B+','3.5','N','131','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','2','C','3','N','132','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','2','A','4','N','134','20140001');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','D','2','N','66','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','B+','3.5','N','68','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','A','4','N','70','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','0','F','0','N','69','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','2','A+','4.5','N','126','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','2','A+','4.5','N','128','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','2','C+','3.5','N','130','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','여름학기','3','A+','4.5','N','143','20140001');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','0','F','0','N','76','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','3','B','3','N','79','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','3','A+','4.5','N','77','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','3','A','4','N','78','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','2','C','3','N','137','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','2','A+','4.5','N','138','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','2학기','2','A','4','N','140','20140001');--

--여기부터 INSERT
--★★★★★★★★★★★★★★★★★★★★★★★★★★
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','3','C','3','N','66','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','3','A','4','N','69','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','3','A+','4.5','N','63','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','3','A','4','N','65','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','2','C','3','N','122','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','2','D','2','N','125','20140001');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2017','1학기','2','B+','3.5','N','124','20140001');--
--★★★★★★★★★★★★★★★★★★★★★★★★★★
-- 48번 과목에 10명 이상 집어넣는다. FOR 영현
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','B+','3.5','N','48','20140003');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','D','2','N','48','20140004');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','0','F','0','N','48','20140005');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','A','4','N','48','20140006');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','B+','3.5','N','48','20140007');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','C','3','N','48','20140008');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','A','4','N','48','20140009');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','D','2','N','48','20140010');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','A','4','N','48','20140011');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','A+','4.5','N','48','20140012');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','C','3','N','48','20140013');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','D','2','N','48','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','0','F','0','N','48','20140003');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','A','4','N','48','20140004');--

--학고 세번맞은사람 20140002 손용훈 (48번 과목 포함됨.)
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','0','F','0','N','41','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','3','B+','3.5','N','43','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','3','A+','4.5','N','45','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','0','F','0','N','44','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','0','F','0','N','121','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','0','F','0','N','122','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','1학기','0','F','0','N','125','20140002');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','0','F','0','N','52','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','3','B+','3.5','N','53','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','3','A+','4.5','N','55','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','0','F','0','N','54','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','0','F','0','N','131','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','0','F','0','N','133','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2015','2학기','0','F','0','N','135','20140002');--

INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','F','0','N','46','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','F','0','N','48','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','F','0','N','50','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','3','F','0','N','47','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','2','A','4','N','137','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','2','F','0','N','138','20140002');--
INSERT INTO CREDIT VALUES(CREDIT_ID_SEQ.NEXTVAL,'2016','1학기','2','F','0','N','140','20140002');--


/* 강의계획서 (강의계획서 id, 교과목개요, 채점방식, 학습목표, 주차별내용,
 * 			  교재정보, 참고문헌, 연도, 학기, 비고, 교수id, 과목id)*/
INSERT INTO SUBJECT_PLAN VALUES(1,'구두강의, 슬라이드',
			'강의 30%, 수시고사30%, 기말고사30%,  토론 10%',
			'건축 이론의 전반적인 이해를 돕고, 미래의 건축학자에게 꿈을 심어준다.',
			'1주차 : 학문으로서 건축 , 2주차 : 예술로서의 건축, 
			 3주차 : 기술로서의 건축, 4주차 : 건축을 이해하는 다양한 시각
			 5주차 : 건축의 교육과 진로, 6주차 : 건축교육의 역사, 
			 7주차 : 지역 및 국가별 건축교육의 특성, 8주차 : 수시고사, 
			 9주차 : 전공별 적성과 진로, 10주차 : 서양건축사, 11주차 : 고대건축, 
			12주차 : 서양 근현대 건축, 13주차 : 한국전통건축, 14주차 : 한국근현대건축과 전통성,
			15주차 : 건축의 기능과 주거건축','건축의 이해', '건축 그 모든 것',  
			2017,'1학기','비고','1001',31);


--휴복학신청  ( 휴복학신청ID, 휴복학종류, 신청일자, 승인일자, 신청상태(반려, 대기, 승인), 학생ID)
--INSERT INTO LEAVERETURNAPPLICATION VALUES (LRAPPLICATION_ID_SEQ.NEXTVAL, '휴학', TO_DATE('20170503','YYYY-MM-DD'),TO_DATE('20170603','YYYY-MM-DD'),'승인','20150001');		
--INSERT INTO LEAVERETURNAPPLICATION VALUES (LRAPPLICATION_ID_SEQ.NEXTVAL, '복학', TO_DATE('20170212','YYYY-MM-DD'),TO_DATE('20170228','YYYY-MM-DD'),'승인','20160001');
--INSERT INTO LEAVERETURNAPPLICATION VALUES (LRAPPLICATION_ID_SEQ.NEXTVAL, '휴학', TO_DATE('20161220','YYYY-MM-DD'),TO_DATE('20170120','YYYY-MM-DD'),'승인','20150002');



-- 평가EVALUATION/EVALUATION_ID_SEQ (평가 ID, 연도, 학기, 과제평점, 시험평점, 수업준비도평점, 4번째 5, 5번째 3, 6번째3
--		수업열정도평점, 질의응답평점, 교수ID, 과목 ID)
--★★★★★★★★★★★★★★★★★★★★★★★★★★ 요거 수정하면 안됩니다!! 
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2017','1학기',3,3,1,3,5,'1006',66);
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2017','1학기',3,1,2,2,5,'1009',69); 
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2017','1학기',1,4,3,4,5,'1008',63);
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2017','1학기',3,4,2,5,5,'1010',65);
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2017','1학기',1,4,3,4,5,'1012',122);
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2017','1학기',3,4,2,5,5,'1015',125);
--124번꺼는 직접 등록.
--★★★★★★★★★★★★★★★★★★★★★★★★★★

/*INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2016','2학기',3,3,1,3,5,'0002',16);
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2016','2학기',3,1,2,2,5,'0002',18); 
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2016','2학기',1,4,3,4,5,'0005',20);
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2016','2학기',3,4,2,5,5,'0004',22);
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2016','2학기',1,4,3,4,5,'0005',20);
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2016','2학기',3,4,2,5,5,'0004',22);*/




-- 학점포기CREDIT_GIVE_UP/CGU_ID_SEQ (학점포기ID,  신청연도, 신청학기, 신청일자, 승인일자, 학점ID,신청상태)
--INSERT INTO CREDIT_GIVE_UP VALUES(CGU_ID_SEQ.NEXTVAL,'2015','1학기',TO_DATE('20160320','YYYY-MM-DD'),NULL,'반려',32);
--INSERT INTO CREDIT_GIVE_UP VALUES(CGU_ID_SEQ.NEXTVAL,'2015','1학기',TO_DATE('20160319','YYYY-MM-DD'),NULL,'반려',31);

-- 학사경고ACADEMIC_PROBATION/PROBATION_ID_SEQ ( 학사경고 ID, 학사경고받은연도, 학사경고학기, 학사경고을 받은 평균 학점, 학생ID)
--
--★★★★★★★★★★★★★★★★★★★★★★★★★★
-- 학고2번 20150002
INSERT INTO ACADEMIC_PROBATION VALUES(PROBATION_ID_SEQ.NEXTVAL,'2015','1학기', 0.6, '20150002');
INSERT INTO ACADEMIC_PROBATION VALUES(PROBATION_ID_SEQ.NEXTVAL,'2015','2학기', 0, '20150002');
--★★★★★★★★★★★★★★★★★★★★★★★★★★
-- 용훈
INSERT INTO ACADEMIC_PROBATION VALUES(PROBATION_ID_SEQ.NEXTVAL,'2015','1학기', 0.71, '20140002');
INSERT INTO ACADEMIC_PROBATION VALUES(PROBATION_ID_SEQ.NEXTVAL,'2015','2학기', 0.57, '20140002');
INSERT INTO ACADEMIC_PROBATION VALUES(PROBATION_ID_SEQ.NEXTVAL,'2016','1학기', 0.85, '20140002');

-- 공지사항NOTICE/NOTICE_ID_SEQ ( 공지사항 ID, 내용, 글쓴날짜, 관리자ID)
INSERT INTO NOTICE VALUES(NOTICE_ID_SEQ.NEXTVAL,'글로벌 리더를 지향하는 코스타 대학교','2015-03-01',0);

--★★★★★★★★★★★★★★★★★★★★★★★★★★
-- 학사일정 ACADEMIC_CALENDAR/CALENDAR_ID_SEQ( 학사연도, 학사일정ID, 일정시작일, 일정종료일, 학사일정명)
INSERT INTO ACADEMIC_CALENDAR VALUES (CALENDAR_ID_SEQ.NEXTVAL, 2017, SYSDATE,SYSDATE+1,'1학기성적조회');
INSERT INTO ACADEMIC_CALENDAR VALUES (CALENDAR_ID_SEQ.NEXTVAL, 2017, SYSDATE,SYSDATE+1,'1학기 수강신청');
INSERT INTO ACADEMIC_CALENDAR VALUES (CALENDAR_ID_SEQ.NEXTVAL, 2017, SYSDATE,SYSDATE+1,'1학기 휴복학신청');
INSERT INTO ACADEMIC_CALENDAR VALUES (CALENDAR_ID_SEQ.NEXTVAL, 2017, SYSDATE,SYSDATE+1,'1학기 학점포기신청');
INSERT INTO ACADEMIC_CALENDAR VALUES (CALENDAR_ID_SEQ.NEXTVAL, 2017, SYSDATE,SYSDATE+1,'설문응답');
INSERT INTO ACADEMIC_CALENDAR VALUES (CALENDAR_ID_SEQ.NEXTVAL, 2017, SYSDATE,SYSDATE+1,'1학기');
--★★★★★★★★★★★★★★★★★★★★★★★★★★

--★★★★★★★★★★★★★★★★★★★★★★★★★★
-- 평가응답EVALUATION_ANSWER/EVALUATION_ANSWER_ID_SEQ ( 평가응답ID, 평가응답여부, 연도, 학기, 학생ID, 과목ID)
INSERT INTO EVALUATION_ANSWER VALUES (EVALUATION_ANSWER_ID_SEQ.NEXTVAL, 'Y', '2017', '1학기', '20140001', 66);
INSERT INTO EVALUATION_ANSWER VALUES (EVALUATION_ANSWER_ID_SEQ.NEXTVAL, 'Y', '2017', '1학기', '20140001', 69);
INSERT INTO EVALUATION_ANSWER VALUES (EVALUATION_ANSWER_ID_SEQ.NEXTVAL, 'Y', '2017', '1학기', '20140001', 63);
INSERT INTO EVALUATION_ANSWER VALUES (EVALUATION_ANSWER_ID_SEQ.NEXTVAL, 'Y', '2017', '1학기', '20140001', 65);
INSERT INTO EVALUATION_ANSWER VALUES (EVALUATION_ANSWER_ID_SEQ.NEXTVAL, 'Y', '2017', '1학기', '20140001', 122);
INSERT INTO EVALUATION_ANSWER VALUES (EVALUATION_ANSWER_ID_SEQ.NEXTVAL, 'Y', '2017', '1학기', '20140001', 125);
INSERT INTO EVALUATION_ANSWER VALUES (EVALUATION_ANSWER_ID_SEQ.NEXTVAL, 'N', '2017', '1학기', '20140001', 124);
--★★★★★★★★★★★★★★★★★★★★★★★★★★			


INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2016','2학기',3,1,2,2,5,'0002',18); 
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2016','2학기',1,4,3,4,5,'0005',20);
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2016','2학기',3,4,2,5,5,'0004',22);
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2016','2학기',1,4,3,4,5,'0005',20);
INSERT INTO EVALUATION VALUES(EVALUATION_ID_SEQ.NEXTVAL,'2016','2학기',3,4,2,5,5,'0004',22);*/
			
			
			
			