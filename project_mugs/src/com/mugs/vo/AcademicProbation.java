package com.mugs.vo;

import java.io.Serializable;

public class AcademicProbation implements Serializable {
	private int probationId;
	private int probationYear;
	private String probationSemester;
	private double probationCreditAverage;
	private String stuId;

	private int count;

	public AcademicProbation() {
	}

	public AcademicProbation(int probationId, int probationYear, String probationSemester,
			double probationCreditAverage, String stuId, int count) {
		this.probationId = probationId;
		this.probationYear = probationYear;
		this.probationSemester = probationSemester;
		this.probationCreditAverage = probationCreditAverage;
		this.stuId = stuId;
		this.count = count;
	}

	public AcademicProbation(int probationId, int probationYear, String probationSemester,
			double probationCreditAverage, String stuId) {
		this.probationId = probationId;
		this.probationYear = probationYear;
		this.probationSemester = probationSemester;
		this.probationCreditAverage = probationCreditAverage;
		this.stuId = stuId;
	}

	public int getProbationId() {
		return probationId;
	}

	public void setProbationId(int probationId) {
		this.probationId = probationId;
	}

	public int getProbationYear() {
		return probationYear;
	}

	public void setProbationYear(int probationYear) {
		this.probationYear = probationYear;
	}

	public String getProbationSemester() {
		return probationSemester;
	}

	public void setProbationSemester(String probationSemester) {
		this.probationSemester = probationSemester;
	}

	public double getProbationCreditAverage() {
		return probationCreditAverage;
	}

	public void setProbationCreditAverage(double probationCreditAverage) {
		this.probationCreditAverage = probationCreditAverage;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + count;
		long temp;
		temp = Double.doubleToLongBits(probationCreditAverage);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + probationId;
		result = prime * result + ((probationSemester == null) ? 0 : probationSemester.hashCode());
		result = prime * result + probationYear;
		result = prime * result + ((stuId == null) ? 0 : stuId.hashCode());
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
		AcademicProbation other = (AcademicProbation) obj;
		if (count != other.count)
			return false;
		if (Double.doubleToLongBits(probationCreditAverage) != Double.doubleToLongBits(other.probationCreditAverage))
			return false;
		if (probationId != other.probationId)
			return false;
		if (probationSemester == null) {
			if (other.probationSemester != null)
				return false;
		} else if (!probationSemester.equals(other.probationSemester))
			return false;
		if (probationYear != other.probationYear)
			return false;
		if (stuId == null) {
			if (other.stuId != null)
				return false;
		} else if (!stuId.equals(other.stuId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "AcademicProbation [probationId=" + probationId + ", probationYear=" + probationYear
				+ ", probationSemester=" + probationSemester + ", probationCreditAverage=" + probationCreditAverage
				+ ", stuId=" + stuId + ", count=" + count + "]";
	}

}
