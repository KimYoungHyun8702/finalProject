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
	private double creditScore;
	//creditRecource -> creditRecourse로 바꾸지마세요. 원래 Recourse가 맞지만 테이블 생성시 recource로 지정했기 때문에 수정의 번거러움을 피하기위해 그냥 적용.
	private String creditRecource;
	private int subjectId;
	private String stuId;

	private Subject subject;

	private double avg;
	
	public Credit() {
	}

	public Credit(int creditId, int creditYear, String creditSemester, int creditAcquire, String creditGrade,
			double creditScore, String creditRecource, int subjectId, String stuId) {
		this.creditId = creditId;
		this.creditYear = creditYear;
		this.creditSemester = creditSemester;
		this.creditAcquire = creditAcquire;
		this.creditGrade = creditGrade;
		this.creditScore = creditScore;
		this.creditRecource = creditRecource;
		this.subjectId = subjectId;
		this.stuId = stuId;
	}

	public Credit(int creditId, int creditYear, String creditSemester, int creditAcquire, String creditGrade,
			double creditScore, String creditRecource, int subjectId, String stuId, Subject subject) {
		this.creditId = creditId;
		this.creditYear = creditYear;
		this.creditSemester = creditSemester;
		this.creditAcquire = creditAcquire;
		this.creditGrade = creditGrade;
		this.creditScore = creditScore;
		this.creditRecource = creditRecource;
		this.subjectId = subjectId;
		this.stuId = stuId;
		this.subject = subject;
	}
	

	public Credit(int creditId, int creditYear, String creditSemester, int creditAcquire, String creditGrade,
			double creditScore, String creditRecource, int subjectId, String stuId, Subject subject, double avg) {
		super();
		this.creditId = creditId;
		this.creditYear = creditYear;
		this.creditSemester = creditSemester;
		this.creditAcquire = creditAcquire;
		this.creditGrade = creditGrade;
		this.creditScore = creditScore;
		this.creditRecource = creditRecource;
		this.subjectId = subjectId;
		this.stuId = stuId;
		this.subject = subject;
		this.avg = avg;
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

	public double getCreditScore() {
		return creditScore;
	}

	public void setCreditScore(double creditScore) {
		this.creditScore = creditScore;
	}

	public String getCreditRecource() {
		return creditRecource;
	}

	public void setCreditRecource(String creditRecource) {
		this.creditRecource = creditRecource;
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

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	@Override
	public String toString() {
		return "Credit [creditId=" + creditId + ", creditYear=" + creditYear + ", creditSemester=" + creditSemester
				+ ", creditAcquire=" + creditAcquire + ", creditGrade=" + creditGrade + ", creditScore=" + creditScore
				+ ", creditRecource=" + creditRecource + ", subjectId=" + subjectId + ", stuId=" + stuId + ", subject="
				+ subject + ", avg=" + avg + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(avg);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + creditAcquire;
		result = prime * result + ((creditGrade == null) ? 0 : creditGrade.hashCode());
		result = prime * result + creditId;
		result = prime * result + ((creditRecource == null) ? 0 : creditRecource.hashCode());
		temp = Double.doubleToLongBits(creditScore);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		if (Double.doubleToLongBits(avg) != Double.doubleToLongBits(other.avg))
			return false;
		if (creditAcquire != other.creditAcquire)
			return false;
		if (creditGrade == null) {
			if (other.creditGrade != null)
				return false;
		} else if (!creditGrade.equals(other.creditGrade))
			return false;
		if (creditId != other.creditId)
			return false;
		if (creditRecource == null) {
			if (other.creditRecource != null)
				return false;
		} else if (!creditRecource.equals(other.creditRecource))
			return false;
		if (Double.doubleToLongBits(creditScore) != Double.doubleToLongBits(other.creditScore))
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