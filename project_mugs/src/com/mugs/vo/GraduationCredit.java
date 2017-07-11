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
	private int gradVitalEduCredit;
	private int gradSelectEduCredit;
	private int gradVitalMajorCredit;
	private int gradSelectMajorCredit;
	private String majorName;
	
	public GraduationCredit(){
		
	}

	public GraduationCredit(int majorId, int graduationCreditYear, int gradVitalEduCredit, int gradSelectEduCredit,
			int gradVitalMajorCredit, int gradSelectMajorCredit) {
		this.majorId = majorId;
		this.graduationCreditYear = graduationCreditYear;
		this.gradVitalEduCredit = gradVitalEduCredit;
		this.gradSelectEduCredit = gradSelectEduCredit;
		this.gradVitalMajorCredit = gradVitalMajorCredit;
		this.gradSelectMajorCredit = gradSelectMajorCredit;
	}

	public GraduationCredit(int majorId, int graduationCreditYear, int gradVitalEduCredit, int gradSelectEduCredit,
			int gradVitalMajorCredit, int gradSelectMajorCredit, String majorName) {
		this.majorId = majorId;
		this.graduationCreditYear = graduationCreditYear;
		this.gradVitalEduCredit = gradVitalEduCredit;
		this.gradSelectEduCredit = gradSelectEduCredit;
		this.gradVitalMajorCredit = gradVitalMajorCredit;
		this.gradSelectMajorCredit = gradSelectMajorCredit;
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

	public int getGradVitalEduCredit() {
		return gradVitalEduCredit;
	}

	public void setGradVitalEduCredit(int gradVitalEduCredit) {
		this.gradVitalEduCredit = gradVitalEduCredit;
	}

	public int getGradSelectEduCredit() {
		return gradSelectEduCredit;
	}

	public void setGradSelectEduCredit(int gradSelectEduCredit) {
		this.gradSelectEduCredit = gradSelectEduCredit;
	}

	public int getGradVitalMajorCredit() {
		return gradVitalMajorCredit;
	}

	public void setGradVitalMajorCredit(int gradVitalMajorCredit) {
		this.gradVitalMajorCredit = gradVitalMajorCredit;
	}

	public int getGradSelectMajorCredit() {
		return gradSelectMajorCredit;
	}

	public void setGradSelectMajorCredit(int gradSelectMajorCredit) {
		this.gradSelectMajorCredit = gradSelectMajorCredit;
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
		result = prime * result + gradSelectEduCredit;
		result = prime * result + gradSelectMajorCredit;
		result = prime * result + gradVitalEduCredit;
		result = prime * result + gradVitalMajorCredit;
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
		if (gradSelectEduCredit != other.gradSelectEduCredit)
			return false;
		if (gradSelectMajorCredit != other.gradSelectMajorCredit)
			return false;
		if (gradVitalEduCredit != other.gradVitalEduCredit)
			return false;
		if (gradVitalMajorCredit != other.gradVitalMajorCredit)
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
				+ ", gradVitalEduCredit=" + gradVitalEduCredit + ", gradSelectEduCredit=" + gradSelectEduCredit
				+ ", gradVitalMajorCredit=" + gradVitalMajorCredit + ", gradSelectMajorCredit=" + gradSelectMajorCredit
				+ ", majorName=" + majorName + "]";
	}
	
	
	}