/**
 * 
 */
/**
 * @author Administrator
 *
 */
package com.mugs.vo;

import java.io.Serializable;
import java.util.List;

public class Major implements Serializable {
	
	private int majorId;
	private String majorName;
	private int collegeId;
	private GraduationCredit graduationCredit;
	private List<Object> list;
	
	public Major() {
	}
	
	public Major(int majorId, String majorName, int collegeId) {
		this.majorId = majorId;
		this.majorName = majorName;
		this.collegeId = collegeId;
	}

	public Major(int majorId, String majorName, int collegeId, GraduationCredit graduationCredit) {
		this.majorId = majorId;
		this.majorName = majorName;
		this.collegeId = collegeId;
		this.graduationCredit = graduationCredit;
	}

	public Major(int majorId, String majorName, int collegeId, List<Object> list) {
		this.majorId = majorId;
		this.majorName = majorName;
		this.collegeId = collegeId;
		this.list = list;
	}

	public Major(int majorId, String majorName, int collegeId, GraduationCredit graduationCredit, List<Object> list) {
		this.majorId = majorId;
		this.majorName = majorName;
		this.collegeId = collegeId;
		this.graduationCredit = graduationCredit;
		this.list = list;
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

	public GraduationCredit getGraduationCredit() {
		return graduationCredit;
	}

	public void setGraduationCredit(GraduationCredit graduationCredit) {
		this.graduationCredit = graduationCredit;
	}

	public List<Object> getList() {
		return list;
	}

	public void setList(List<Object> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "Major [majorId=" + majorId + ", majorName=" + majorName + ", collegeId=" + collegeId
				+ ", graduationCredit=" + graduationCredit + ", list=" + list + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + collegeId;
		result = prime * result + ((graduationCredit == null) ? 0 : graduationCredit.hashCode());
		result = prime * result + ((list == null) ? 0 : list.hashCode());
		result = prime * result + majorId;
		result = prime * result + ((majorName == null) ? 0 : majorName.hashCode());
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
		if (graduationCredit == null) {
			if (other.graduationCredit != null)
				return false;
		} else if (!graduationCredit.equals(other.graduationCredit))
			return false;
		if (list == null) {
			if (other.list != null)
				return false;
		} else if (!list.equals(other.list))
			return false;
		if (majorId != other.majorId)
			return false;
		if (majorName == null) {
			if (other.majorName != null)
				return false;
		} else if (!majorName.equals(other.majorName))
			return false;
		return true;
	}
}	