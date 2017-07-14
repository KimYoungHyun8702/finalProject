package com.mugs.vo;

import java.io.Serializable;

public class Standard implements Serializable{
	
	private int standardYear;
	private int majorId;
	private int standardMinCredit;
	private int standardMaxCredit;
	private int standardMinScholarship;
	private int standardDelayMinCredit;
	private int standardDelayMaxCredit;
	private String majorName;
	
	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public Standard() {
	}

	public Standard(int standardYear, int majorId, int standardMinCredit, int standardMaxCredit,
			int standardMinScholarship, int standardDelayMinCredit, int standardDelayMaxCredit) {
		this.standardYear = standardYear;
		this.majorId = majorId;
		this.standardMinCredit = standardMinCredit;
		this.standardMaxCredit = standardMaxCredit;
		this.standardMinScholarship = standardMinScholarship;
		this.standardDelayMinCredit = standardDelayMinCredit;
		this.standardDelayMaxCredit = standardDelayMaxCredit;
	}

	public Standard(int standardYear, int majorId, int standardMinCredit, int standardMaxCredit,
			int standardMinScholarship, int standardDelayMinCredit, int standardDelayMaxCredit, String majorName) {
		this.standardYear = standardYear;
		this.majorId = majorId;
		this.standardMinCredit = standardMinCredit;
		this.standardMaxCredit = standardMaxCredit;
		this.standardMinScholarship = standardMinScholarship;
		this.standardDelayMinCredit = standardDelayMinCredit;
		this.standardDelayMaxCredit = standardDelayMaxCredit;
		this.majorName = majorName;
	}

	public int getStandardYear() {
		return standardYear;
	}

	public void setStandardYear(int standardYear) {
		this.standardYear = standardYear;
	}

	public int getMajorId() {
		return majorId;
	}

	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}

	public int getStandardMinCredit() {
		return standardMinCredit;
	}

	public void setStandardMinCredit(int standardMinCredit) {
		this.standardMinCredit = standardMinCredit;
	}

	public int getStandardMaxCredit() {
		return standardMaxCredit;
	}

	public void setStandardMaxCredit(int standardMaxCredit) {
		this.standardMaxCredit = standardMaxCredit;
	}

	public int getStandardMinScholarship() {
		return standardMinScholarship;
	}

	public void setStandardMinScholarship(int standardMinScholarship) {
		this.standardMinScholarship = standardMinScholarship;
	}

	public int getStandardDelayMinCredit() {
		return standardDelayMinCredit;
	}

	public void setStandardDelayMinCredit(int standardDelayMinCredit) {
		this.standardDelayMinCredit = standardDelayMinCredit;
	}

	public int getStandardDelayMaxCredit() {
		return standardDelayMaxCredit;
	}

	public void setStandardDelayMaxCredit(int standardDelayMaxCredit) {
		this.standardDelayMaxCredit = standardDelayMaxCredit;
	}

	@Override
	public String toString() {
		return "Standard [standardYear=" + standardYear + ", majorId=" + majorId + ", standardMinCredit="
				+ standardMinCredit + ", standardMaxCredit=" + standardMaxCredit + ", standardMinScholarship="
				+ standardMinScholarship + ", standardDelayMinCredit=" + standardDelayMinCredit
				+ ", standardDelayMaxCredit=" + standardDelayMaxCredit + ", majorName=" + majorName + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + majorId;
		result = prime * result + ((majorName == null) ? 0 : majorName.hashCode());
		result = prime * result + standardDelayMaxCredit;
		result = prime * result + standardDelayMinCredit;
		result = prime * result + standardMaxCredit;
		result = prime * result + standardMinCredit;
		result = prime * result + standardMinScholarship;
		result = prime * result + standardYear;
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
		Standard other = (Standard) obj;
		if (majorId != other.majorId)
			return false;
		if (majorName == null) {
			if (other.majorName != null)
				return false;
		} else if (!majorName.equals(other.majorName))
			return false;
		if (standardDelayMaxCredit != other.standardDelayMaxCredit)
			return false;
		if (standardDelayMinCredit != other.standardDelayMinCredit)
			return false;
		if (standardMaxCredit != other.standardMaxCredit)
			return false;
		if (standardMinCredit != other.standardMinCredit)
			return false;
		if (standardMinScholarship != other.standardMinScholarship)
			return false;
		if (standardYear != other.standardYear)
			return false;
		return true;
	}
}