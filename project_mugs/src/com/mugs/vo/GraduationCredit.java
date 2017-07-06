/**
 * 
 */
/**
 * @author Administrator
 *
 */
package com.mugs.vo;

import java.io.Serializable;

public class GraduationCredit implements Serializable {
	
	private int majorId;
	private int graduationCreditYear;
	private int graduationCreditScore;
	private String majorName;
	
	public GraduationCredit() {
		super();
	}

	public GraduationCredit(int majorId, int graduationCreditYear, int graduationCreditScore) {
		super();
		this.majorId = majorId;
		this.graduationCreditYear = graduationCreditYear;
		this.graduationCreditScore = graduationCreditScore;
	}

	public GraduationCredit(int majorId, int graduationCreditYear, int graduationCreditScore, String majorName) {
		this.majorId = majorId;
		this.graduationCreditYear = graduationCreditYear;
		this.graduationCreditScore = graduationCreditScore;
		this.majorName = majorName;
	}

	public int getMajorId() {
		return majorId;
	}

	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}

	public int getGraduationCreditYear() {
		return graduationCreditYear;
	}

	public void setGraduationCreditYear(int graduationCreditYear) {
		this.graduationCreditYear = graduationCreditYear;
	}

	public int getGraduationCreditScore() {
		return graduationCreditScore;
	}

	public void setGraduationCreditScore(int graduationCreditScore) {
		this.graduationCreditScore = graduationCreditScore;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + graduationCreditScore;
		result = prime * result + graduationCreditYear;
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
		GraduationCredit other = (GraduationCredit) obj;
		if (graduationCreditScore != other.graduationCreditScore)
			return false;
		if (graduationCreditYear != other.graduationCreditYear)
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

	@Override
	public String toString() {
		return "GraduationCredit [majorId=" + majorId + ", graduationCreditYear=" + graduationCreditYear
				+ ", graduationCreditScore=" + graduationCreditScore + ", majorName=" + majorName + "]";
	}
	
	
	
	
}