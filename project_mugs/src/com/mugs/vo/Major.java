package com.mugs.vo;

import java.io.Serializable;
import java.util.List;

public class Major implements Serializable {
	
	private int majorId;
	private String majorName;
	private int collegeId;
	private List<GraduationCredit> graduationCreditList;
	private List<Standard> standardList;
	
	public List<Standard> getStandardList() {
		return standardList;
	}
	public void setStandardList(List<Standard> standardList) {
		this.standardList = standardList;
	}
	public Major(int majorId, String majorName, int collegeId, List<GraduationCredit> graduationCreditList,
			List<Standard> standardList) {
		this.majorId = majorId;
		this.majorName = majorName;
		this.collegeId = collegeId;
		this.graduationCreditList = graduationCreditList;
		this.standardList = standardList;
	}
	public Major() {
	}
	public Major(int majorId, String majorName, int collegeId) {
		this.majorId = majorId;
		this.majorName = majorName;
		this.collegeId = collegeId;
	}
	public Major(int majorId, String majorName, int collegeId, List<GraduationCredit> graduationCreditList) {
		this.majorId = majorId;
		this.majorName = majorName;
		this.collegeId = collegeId;
		this.graduationCreditList = graduationCreditList;
	}
	public int getMajorId() {
		return majorId;
	}
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}
	public String getMajorName() {
		return majorName;
	}
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	public int getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(int collegeId) {
		this.collegeId = collegeId;
	}
	public List<GraduationCredit> getGraduationCreditList() {
		return graduationCreditList;
	}
	public void setGraduationCreditList(List<GraduationCredit> graduationCreditList) {
		this.graduationCreditList = graduationCreditList;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + collegeId;
		result = prime * result + ((graduationCreditList == null) ? 0 : graduationCreditList.hashCode());
		result = prime * result + majorId;
		result = prime * result + ((majorName == null) ? 0 : majorName.hashCode());
		result = prime * result + ((standardList == null) ? 0 : standardList.hashCode());
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
		Major other = (Major) obj;
		if (collegeId != other.collegeId)
			return false;
		if (graduationCreditList == null) {
			if (other.graduationCreditList != null)
				return false;
		} else if (!graduationCreditList.equals(other.graduationCreditList))
			return false;
		if (majorId != other.majorId)
			return false;
		if (majorName == null) {
			if (other.majorName != null)
				return false;
		} else if (!majorName.equals(other.majorName))
			return false;
		if (standardList == null) {
			if (other.standardList != null)
				return false;
		} else if (!standardList.equals(other.standardList))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Major [majorId=" + majorId + ", majorName=" + majorName + ", collegeId=" + collegeId
				+ ", graduationCreditList=" + graduationCreditList + ", standardList=" + standardList + "]";
	}
	
	
	
}	