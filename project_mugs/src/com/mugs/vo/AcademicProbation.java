package com.mugs.vo;

import java.io.Serializable;

public class AcademicProbation implements Serializable {
	private int probationId;
	private int probationYear;
	private String probationSemester;
	private double probationCreditAverage;
	private String stuId;

	private int count;
	private String majorName;
	private String usersName;
	private String usersId;
	private int usersEnable;
	
	public AcademicProbation() {
	}

	public AcademicProbation(int probationYear, String probationSemester, double probationCreditAverage, String stuId) {
		super();
		this.probationYear = probationYear;
		this.probationSemester = probationSemester;
		this.probationCreditAverage = probationCreditAverage;
		this.stuId = stuId;
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
	
	public AcademicProbation(int probationId, int probationYear, String probationSemester,
			double probationCreditAverage, String stuId, int count, String majorName, String usersName, String usersId,
			int usersEnable) {
		this.probationId = probationId;
		this.probationYear = probationYear;
		this.probationSemester = probationSemester;
		this.probationCreditAverage = probationCreditAverage;
		this.stuId = stuId;
		this.count = count;
		this.majorName = majorName;
		this.usersName = usersName;
		this.usersId = usersId;
		this.usersEnable = usersEnable;
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



	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getUsersName() {
		return usersName;
	}

	public void setUsersName(String usersName) {
		this.usersName = usersName;
	}

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}

	public int getUsersEnable() {
		return usersEnable;
	}

	public void setUsersEnable(int usersEnable) {
		this.usersEnable = usersEnable;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + count;
		result = prime * result + ((majorName == null) ? 0 : majorName.hashCode());
		long temp;
		temp = Double.doubleToLongBits(probationCreditAverage);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + probationId;
		result = prime * result + ((probationSemester == null) ? 0 : probationSemester.hashCode());
		result = prime * result + probationYear;
		result = prime * result + ((stuId == null) ? 0 : stuId.hashCode());
		result = prime * result + usersEnable;
		result = prime * result + ((usersId == null) ? 0 : usersId.hashCode());
		result = prime * result + ((usersName == null) ? 0 : usersName.hashCode());
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
		if (majorName == null) {
			if (other.majorName != null)
				return false;
		} else if (!majorName.equals(other.majorName))
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
		if (usersEnable != other.usersEnable)
			return false;
		if (usersId == null) {
			if (other.usersId != null)
				return false;
		} else if (!usersId.equals(other.usersId))
			return false;
		if (usersName == null) {
			if (other.usersName != null)
				return false;
		} else if (!usersName.equals(other.usersName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "AcademicProbation [probationId=" + probationId + ", probationYear=" + probationYear
				+ ", probationSemester=" + probationSemester + ", probationCreditAverage=" + probationCreditAverage
				+ ", stuId=" + stuId + ", count=" + count + ", majorName=" + majorName + ", usersName=" + usersName
				+ ", usersId=" + usersId + ", usersEnable=" + usersEnable + "]";
	}

}
