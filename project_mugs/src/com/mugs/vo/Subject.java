/**
 * 
 */
/**
 * @author Administrator
 *
 */
package com.mugs.vo;

import java.io.Serializable;
import java.util.Map;

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
	private int lectureId;
	private int remainNum;
	private String recourse;
	private SubjectPlan subjectPlan;
	private Major major;
	private College college;
	private Room room;
	private Building building;
	private Map<String, String> YoyilAndGyoshi;
	
	public Subject() {
	}

	public Subject(int subjectId, String subjectName, String subjectTime, String subjectType, int subjectCredit,
			int subjectCapacity, int subjectRequest, Integer subjectGrade, String subjectClass, char subjectCloseClass,
			String subjectSemester, Integer majorId, int lectureId) {
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
			String subjectSemester, Integer majorId, int lectureId, int remainNum, String recourse,
			SubjectPlan subjectPlan, Major major, College college, Room room, Building building,
			Map<String, String> yoyilAndGyoshi) {
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
		this.remainNum = remainNum;
		this.recourse = recourse;
		this.subjectPlan = subjectPlan;
		this.major = major;
		this.college = college;
		this.room = room;
		this.building = building;
		YoyilAndGyoshi = yoyilAndGyoshi;
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

	public int getLectureId() {
		return lectureId;
	}

	public void setLectureId(int lectureId) {
		this.lectureId = lectureId;
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

	public Map<String, String> getYoyilAndGyoshi() {
		return YoyilAndGyoshi;
	}

	public void setYoyilAndGyoshi(Map<String, String> yoyilAndGyoshi) {
		YoyilAndGyoshi = yoyilAndGyoshi;
	}

	@Override
	public String toString() {
		return "Subject [subjectId=" + subjectId + ", subjectName=" + subjectName + ", subjectTime=" + subjectTime
				+ ", subjectType=" + subjectType + ", subjectCredit=" + subjectCredit + ", subjectCapacity="
				+ subjectCapacity + ", subjectRequest=" + subjectRequest + ", subjectGrade=" + subjectGrade
				+ ", subjectClass=" + subjectClass + ", subjectCloseClass=" + subjectCloseClass + ", subjectSemester="
				+ subjectSemester + ", majorId=" + majorId + ", lectureId=" + lectureId + ", remainNum=" + remainNum
				+ ", recourse=" + recourse + ", subjectPlan=" + subjectPlan + ", major=" + major + ", college="
				+ college + ", room=" + room + ", building=" + building + ", YoyilAndGyoshi=" + YoyilAndGyoshi + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((YoyilAndGyoshi == null) ? 0 : YoyilAndGyoshi.hashCode());
		result = prime * result + ((building == null) ? 0 : building.hashCode());
		result = prime * result + ((college == null) ? 0 : college.hashCode());
		result = prime * result + lectureId;
		result = prime * result + ((major == null) ? 0 : major.hashCode());
		result = prime * result + ((majorId == null) ? 0 : majorId.hashCode());
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
		if (YoyilAndGyoshi == null) {
			if (other.YoyilAndGyoshi != null)
				return false;
		} else if (!YoyilAndGyoshi.equals(other.YoyilAndGyoshi))
			return false;
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
		if (lectureId != other.lectureId)
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
		return true;
	}

}