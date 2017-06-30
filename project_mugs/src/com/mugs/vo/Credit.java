/**
 * 
 */
/**
 * @author Administrator
 *
 */
package com.mugs.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Credit implements Serializable {
	
	private int creditId;
	private int creditYear;
	private String creditSemester;
	private int creditAcquire;
	private String creditGrade;
	private int creditScore;
	private String creditRecourse;
	private int subjectId;
	private String stuId;
	private Date creditReadStart;
	private Date creditReadEnd;
	private Subject subject;
	
	public Credit() {
	}

	public Credit(int creditId, int creditYear, String creditSemester, int creditAcquire, String creditGrade,
			int creditScore, String creditRecourse, int subjectId, String stuId, Date creditReadStart,
			Date creditReadEnd) {
		this.creditId = creditId;
		this.creditYear = creditYear;
		this.creditSemester = creditSemester;
		this.creditAcquire = creditAcquire;
		this.creditGrade = creditGrade;
		this.creditScore = creditScore;
		this.creditRecourse = creditRecourse;
		this.subjectId = subjectId;
		this.stuId = stuId;
		this.creditReadStart = creditReadStart;
		this.creditReadEnd = creditReadEnd;
	}

	public Credit(int creditId, int creditYear, String creditSemester, int creditAcquire, String creditGrade,
			int creditScore, String creditRecourse, int subjectId, String stuId, Date creditReadStart,
			Date creditReadEnd, Subject subject) {
		this.creditId = creditId;
		this.creditYear = creditYear;
		this.creditSemester = creditSemester;
		this.creditAcquire = creditAcquire;
		this.creditGrade = creditGrade;
		this.creditScore = creditScore;
		this.creditRecourse = creditRecourse;
		this.subjectId = subjectId;
		this.stuId = stuId;
		this.creditReadStart = creditReadStart;
		this.creditReadEnd = creditReadEnd;
		this.subject = subject;
	}

	public int getCreditId() {
		return creditId;
	}

	public void setCreditId(int creditId) {
		this.creditId = creditId;
	}

	public int getCreditYear() {
		return creditYear;
	}

	public void setCreditYear(int creditYear) {
		this.creditYear = creditYear;
	}

	public String getCreditSemester() {
		return creditSemester;
	}

	public void setCreditSemester(String creditSemester) {
		this.creditSemester = creditSemester;
	}

	public int getCreditAcquire() {
		return creditAcquire;
	}

	public void setCreditAcquire(int creditAcquire) {
		this.creditAcquire = creditAcquire;
	}

	public String getCreditGrade() {
		return creditGrade;
	}

	public void setCreditGrade(String creditGrade) {
		this.creditGrade = creditGrade;
	}

	public int getCreditScore() {
		return creditScore;
	}

	public void setCreditScore(int creditScore) {
		this.creditScore = creditScore;
	}

	public String getCreditRecourse() {
		return creditRecourse;
	}

	public void setCreditRecourse(String creditRecourse) {
		this.creditRecourse = creditRecourse;
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public Date getCreditReadStart() {
		return creditReadStart;
	}

	public void setCreditReadStart(Date creditReadStart) {
		this.creditReadStart = creditReadStart;
	}

	public Date getCreditReadEnd() {
		return creditReadEnd;
	}

	public void setCreditReadEnd(Date creditReadEnd) {
		this.creditReadEnd = creditReadEnd;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	@Override
	public String toString() {
		return "Credit [creditId=" + creditId + ", creditYear=" + creditYear + ", creditSemester=" + creditSemester
				+ ", creditAcquire=" + creditAcquire + ", creditGrade=" + creditGrade + ", creditScore=" + creditScore
				+ ", creditRecourse=" + creditRecourse + ", subjectId=" + subjectId + ", stuId=" + stuId
				+ ", creditReadStart=" + creditReadStart + ", creditReadEnd=" + creditReadEnd + ", subject=" + subject
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + creditAcquire;
		result = prime * result + ((creditGrade == null) ? 0 : creditGrade.hashCode());
		result = prime * result + creditId;
		result = prime * result + ((creditReadEnd == null) ? 0 : creditReadEnd.hashCode());
		result = prime * result + ((creditReadStart == null) ? 0 : creditReadStart.hashCode());
		result = prime * result + ((creditRecourse == null) ? 0 : creditRecourse.hashCode());
		result = prime * result + creditScore;
		result = prime * result + ((creditSemester == null) ? 0 : creditSemester.hashCode());
		result = prime * result + creditYear;
		result = prime * result + ((stuId == null) ? 0 : stuId.hashCode());
		result = prime * result + ((subject == null) ? 0 : subject.hashCode());
		result = prime * result + subjectId;
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
		Credit other = (Credit) obj;
		if (creditAcquire != other.creditAcquire)
			return false;
		if (creditGrade == null) {
			if (other.creditGrade != null)
				return false;
		} else if (!creditGrade.equals(other.creditGrade))
			return false;
		if (creditId != other.creditId)
			return false;
		if (creditReadEnd == null) {
			if (other.creditReadEnd != null)
				return false;
		} else if (!creditReadEnd.equals(other.creditReadEnd))
			return false;
		if (creditReadStart == null) {
			if (other.creditReadStart != null)
				return false;
		} else if (!creditReadStart.equals(other.creditReadStart))
			return false;
		if (creditRecourse == null) {
			if (other.creditRecourse != null)
				return false;
		} else if (!creditRecourse.equals(other.creditRecourse))
			return false;
		if (creditScore != other.creditScore)
			return false;
		if (creditSemester == null) {
			if (other.creditSemester != null)
				return false;
		} else if (!creditSemester.equals(other.creditSemester))
			return false;
		if (creditYear != other.creditYear)
			return false;
		if (stuId == null) {
			if (other.stuId != null)
				return false;
		} else if (!stuId.equals(other.stuId))
			return false;
		if (subject == null) {
			if (other.subject != null)
				return false;
		} else if (!subject.equals(other.subject))
			return false;
		if (subjectId != other.subjectId)
			return false;
		return true;
	}
}