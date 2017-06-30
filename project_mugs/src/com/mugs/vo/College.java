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

public class College implements Serializable {
	
	private int collegeId;
	private String collegeName;
	private List<Major> majorList;
	
	public College() {
		super();
	}

	public College(int collegeId, String collegeName) {
		super();
		this.collegeId = collegeId;
		this.collegeName = collegeName;
	}

	public College(int collegeId, String collegeName, List<Major> majorList) {
		super();
		this.collegeId = collegeId;
		this.collegeName = collegeName;
		this.majorList = majorList;
	}

	public int getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(int collegeId) {
		this.collegeId = collegeId;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public List<Major> getMajorList() {
		return majorList;
	}

	public void setMajorList(List<Major> majorList) {
		this.majorList = majorList;
	}

	@Override
	public String toString() {
		return "College [collegeId=" + collegeId + ", collegeName=" + collegeName + ", majorList=" + majorList + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + collegeId;
		result = prime * result + ((collegeName == null) ? 0 : collegeName.hashCode());
		result = prime * result + ((majorList == null) ? 0 : majorList.hashCode());
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
		College other = (College) obj;
		if (collegeId != other.collegeId)
			return false;
		if (collegeName == null) {
			if (other.collegeName != null)
				return false;
		} else if (!collegeName.equals(other.collegeName))
			return false;
		if (majorList == null) {
			if (other.majorList != null)
				return false;
		} else if (!majorList.equals(other.majorList))
			return false;
		return true;
	}
}