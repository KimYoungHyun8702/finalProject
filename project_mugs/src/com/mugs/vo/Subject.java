package com.mugs.vo;

import java.io.Serializable;

public class Subject implements Serializable {

   
   private int subjectId;
   private String subjectName;
   private String subjectTime;
   private String subjectType;
   private int subjectCredit;
   private int subjectCapacity;
   private int subjectRequest;
   private Integer subjectGrade;
   private String subjectClass;
   private char subjectCloseClass;
   private String subjectSemester;
   private Integer majorId;
   private Integer lectureId;
   
   private Professor professor;
   private int remainNum;
   private String recourse;
   private SubjectPlan subjectPlan;
   private Major major;
   private College college;
   private Room room;
   private Building building;
   private String gyoShi1;
   private String gyoShi2;
   private String yoYil1;
   private String yoYil2;
   
   public Subject(){}

   public Subject(int subjectId, String subjectName, String subjectTime, String subjectType, int subjectCredit,
		int subjectCapacity, int subjectRequest, Integer subjectGrade, String subjectClass, char subjectCloseClass,
		String subjectSemester, Integer majorId, Integer lectureId) {
	super();
	this.subjectId = subjectId;
	this.subjectName = subjectName;
	this.subjectTime = subjectTime;
	this.subjectType = subjectType;
	this.subjectCredit = subjectCredit;
	this.subjectCapacity = subjectCapacity;
	this.subjectRequest = subjectRequest;
	this.subjectGrade = subjectGrade;
	this.subjectClass = subjectClass;
	this.subjectCloseClass = subjectCloseClass;
	this.subjectSemester = subjectSemester;
	this.majorId = majorId;
	this.lectureId = lectureId;
    }

public Subject(int subjectId, String subjectName, String subjectTime, String subjectType, int subjectCredit,
		int subjectCapacity, int subjectRequest, Integer subjectGrade, String subjectClass, char subjectCloseClass,
		String subjectSemester, Integer majorId, Integer lectureId, Professor professor, int remainNum, String recourse,
		SubjectPlan subjectPlan, Major major, College college, Room room, Building building, String gyoShi1,
		String gyoShi2, String yoYil1, String yoYil2) {
	super();
	this.subjectId = subjectId;
	this.subjectName = subjectName;
	this.subjectTime = subjectTime;
	this.subjectType = subjectType;
	this.subjectCredit = subjectCredit;
	this.subjectCapacity = subjectCapacity;
	this.subjectRequest = subjectRequest;
	this.subjectGrade = subjectGrade;
	this.subjectClass = subjectClass;
	this.subjectCloseClass = subjectCloseClass;
	this.subjectSemester = subjectSemester;
	this.majorId = majorId;
	this.lectureId = lectureId;
	this.professor = professor;
	this.remainNum = remainNum;
	this.recourse = recourse;
	this.subjectPlan = subjectPlan;
	this.major = major;
	this.college = college;
	this.room = room;
	this.building = building;
	this.gyoShi1 = gyoShi1;
	this.gyoShi2 = gyoShi2;
	this.yoYil1 = yoYil1;
	this.yoYil2 = yoYil2;
}

	

public int getSubjectId() {
	return subjectId;
}

public void setSubjectId(int subjectId) {
	this.subjectId = subjectId;
}

public String getSubjectName() {
	return subjectName;
}

public void setSubjectName(String subjectName) {
	this.subjectName = subjectName;
}

public String getSubjectTime() {
	return subjectTime;
}

public void setSubjectTime(String subjectTime) {
	this.subjectTime = subjectTime;
}

public String getSubjectType() {
	return subjectType;
}

public void setSubjectType(String subjectType) {
	this.subjectType = subjectType;
}

public int getSubjectCredit() {
	return subjectCredit;
}

public void setSubjectCredit(int subjectCredit) {
	this.subjectCredit = subjectCredit;
}

public int getSubjectCapacity() {
	return subjectCapacity;
}

public void setSubjectCapacity(int subjectCapacity) {
	this.subjectCapacity = subjectCapacity;
}

public int getSubjectRequest() {
	return subjectRequest;
}

public void setSubjectRequest(int subjectRequest) {
	this.subjectRequest = subjectRequest;
}

public Integer getSubjectGrade() {
	return subjectGrade;
}

public void setSubjectGrade(Integer subjectGrade) {
	this.subjectGrade = subjectGrade;
}

public String getSubjectClass() {
	return subjectClass;
}

public void setSubjectClass(String subjectClass) {
	this.subjectClass = subjectClass;
}

public char getSubjectCloseClass() {
	return subjectCloseClass;
}

public void setSubjectCloseClass(char subjectCloseClass) {
	this.subjectCloseClass = subjectCloseClass;
}

public String getSubjectSemester() {
	return subjectSemester;
}

public void setSubjectSemester(String subjectSemester) {
	this.subjectSemester = subjectSemester;
}

public Integer getMajorId() {
	return majorId;
}

public void setMajorId(Integer majorId) {
	this.majorId = majorId;
}

public Integer getLectureId() {
	return lectureId;
}

public void setLectureId(Integer lectureId) {
	this.lectureId = lectureId;
}

public Professor getProfessor() {
	return professor;
}

public void setProfessor(Professor professor) {
	this.professor = professor;
}

public int getRemainNum() {
	return remainNum;
}

public void setRemainNum(int remainNum) {
	this.remainNum = remainNum;
}

public String getRecourse() {
	return recourse;
}

public void setRecourse(String recourse) {
	this.recourse = recourse;
}

public SubjectPlan getSubjectPlan() {
	return subjectPlan;
}

public void setSubjectPlan(SubjectPlan subjectPlan) {
	this.subjectPlan = subjectPlan;
}

public Major getMajor() {
	return major;
}

public void setMajor(Major major) {
	this.major = major;
}

public College getCollege() {
	return college;
}

public void setCollege(College college) {
	this.college = college;
}

public Room getRoom() {
	return room;
}

public void setRoom(Room room) {
	this.room = room;
}

public Building getBuilding() {
	return building;
}

public void setBuilding(Building building) {
	this.building = building;
}

public String getGyoShi1() {
	return gyoShi1;
}

public void setGyoShi1(String gyoShi1) {
	this.gyoShi1 = gyoShi1;
}

public String getGyoShi2() {
	return gyoShi2;
}

public void setGyoShi2(String gyoShi2) {
	this.gyoShi2 = gyoShi2;
}

public String getYoYil1() {
	return yoYil1;
}

public void setYoYil1(String yoYil1) {
	this.yoYil1 = yoYil1;
}

public String getYoYil2() {
	return yoYil2;
}

public void setYoYil2(String yoYil2) {
	this.yoYil2 = yoYil2;
}

@Override
public String toString() {
	return "Subject [subjectId=" + subjectId + ", subjectName=" + subjectName + ", subjectTime=" + subjectTime
			+ ", subjectType=" + subjectType + ", subjectCredit=" + subjectCredit + ", subjectCapacity="
			+ subjectCapacity + ", subjectRequest=" + subjectRequest + ", subjectGrade=" + subjectGrade
			+ ", subjectClass=" + subjectClass + ", subjectCloseClass=" + subjectCloseClass + ", subjectSemester="
			+ subjectSemester + ", majorId=" + majorId + ", lectureId=" + lectureId + ", professor=" + professor
			+ ", remainNum=" + remainNum + ", recourse=" + recourse + ", subjectPlan=" + subjectPlan + ", major="
			+ major + ", college=" + college + ", room=" + room + ", building=" + building + ", gyoShi1=" + gyoShi1
			+ ", gyoShi2=" + gyoShi2 + ", yoYil1=" + yoYil1 + ", yoYil2=" + yoYil2 + "]";
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((building == null) ? 0 : building.hashCode());
	result = prime * result + ((college == null) ? 0 : college.hashCode());
	result = prime * result + ((gyoShi1 == null) ? 0 : gyoShi1.hashCode());
	result = prime * result + ((gyoShi2 == null) ? 0 : gyoShi2.hashCode());
	result = prime * result + ((lectureId == null) ? 0 : lectureId.hashCode());
	result = prime * result + ((major == null) ? 0 : major.hashCode());
	result = prime * result + ((majorId == null) ? 0 : majorId.hashCode());
	result = prime * result + ((professor == null) ? 0 : professor.hashCode());
	result = prime * result + ((recourse == null) ? 0 : recourse.hashCode());
	result = prime * result + remainNum;
	result = prime * result + ((room == null) ? 0 : room.hashCode());
	result = prime * result + subjectCapacity;
	result = prime * result + ((subjectClass == null) ? 0 : subjectClass.hashCode());
	result = prime * result + subjectCloseClass;
	result = prime * result + subjectCredit;
	result = prime * result + ((subjectGrade == null) ? 0 : subjectGrade.hashCode());
	result = prime * result + subjectId;
	result = prime * result + ((subjectName == null) ? 0 : subjectName.hashCode());
	result = prime * result + ((subjectPlan == null) ? 0 : subjectPlan.hashCode());
	result = prime * result + subjectRequest;
	result = prime * result + ((subjectSemester == null) ? 0 : subjectSemester.hashCode());
	result = prime * result + ((subjectTime == null) ? 0 : subjectTime.hashCode());
	result = prime * result + ((subjectType == null) ? 0 : subjectType.hashCode());
	result = prime * result + ((yoYil1 == null) ? 0 : yoYil1.hashCode());
	result = prime * result + ((yoYil2 == null) ? 0 : yoYil2.hashCode());
	return result;
}

@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	Subject other = (Subject) obj;
	if (building == null) {
		if (other.building != null)
			return false;
	} else if (!building.equals(other.building))
		return false;
	if (college == null) {
		if (other.college != null)
			return false;
	} else if (!college.equals(other.college))
		return false;
	if (gyoShi1 == null) {
		if (other.gyoShi1 != null)
			return false;
	} else if (!gyoShi1.equals(other.gyoShi1))
		return false;
	if (gyoShi2 == null) {
		if (other.gyoShi2 != null)
			return false;
	} else if (!gyoShi2.equals(other.gyoShi2))
		return false;
	if (lectureId == null) {
		if (other.lectureId != null)
			return false;
	} else if (!lectureId.equals(other.lectureId))
		return false;
	if (major == null) {
		if (other.major != null)
			return false;
	} else if (!major.equals(other.major))
		return false;
	if (majorId == null) {
		if (other.majorId != null)
			return false;
	} else if (!majorId.equals(other.majorId))
		return false;
	if (professor == null) {
		if (other.professor != null)
			return false;
	} else if (!professor.equals(other.professor))
		return false;
	if (recourse == null) {
		if (other.recourse != null)
			return false;
	} else if (!recourse.equals(other.recourse))
		return false;
	if (remainNum != other.remainNum)
		return false;
	if (room == null) {
		if (other.room != null)
			return false;
	} else if (!room.equals(other.room))
		return false;
	if (subjectCapacity != other.subjectCapacity)
		return false;
	if (subjectClass == null) {
		if (other.subjectClass != null)
			return false;
	} else if (!subjectClass.equals(other.subjectClass))
		return false;
	if (subjectCloseClass != other.subjectCloseClass)
		return false;
	if (subjectCredit != other.subjectCredit)
		return false;
	if (subjectGrade == null) {
		if (other.subjectGrade != null)
			return false;
	} else if (!subjectGrade.equals(other.subjectGrade))
		return false;
	if (subjectId != other.subjectId)
		return false;
	if (subjectName == null) {
		if (other.subjectName != null)
			return false;
	} else if (!subjectName.equals(other.subjectName))
		return false;
	if (subjectPlan == null) {
		if (other.subjectPlan != null)
			return false;
	} else if (!subjectPlan.equals(other.subjectPlan))
		return false;
	if (subjectRequest != other.subjectRequest)
		return false;
	if (subjectSemester == null) {
		if (other.subjectSemester != null)
			return false;
	} else if (!subjectSemester.equals(other.subjectSemester))
		return false;
	if (subjectTime == null) {
		if (other.subjectTime != null)
			return false;
	} else if (!subjectTime.equals(other.subjectTime))
		return false;
	if (subjectType == null) {
		if (other.subjectType != null)
			return false;
	} else if (!subjectType.equals(other.subjectType))
		return false;
	if (yoYil1 == null) {
		if (other.yoYil1 != null)
			return false;
	} else if (!yoYil1.equals(other.yoYil1))
		return false;
	if (yoYil2 == null) {
		if (other.yoYil2 != null)
			return false;
	} else if (!yoYil2.equals(other.yoYil2))
		return false;
	return true;
}      

}