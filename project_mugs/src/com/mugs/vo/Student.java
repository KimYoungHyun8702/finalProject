package com.mugs.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.mugs.etc.DateJSONSerializer;


public class Student extends Users implements Serializable {
	
	private String stuId;
	private String stuCourse;
	private String stuArmy;

	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonSerialize(using=DateJSONSerializer.class)
	private Date stuAdmissionDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonSerialize(using=DateJSONSerializer.class)
	private Date stuGraduationDate;
	
	private String stuRegisterState;
	private String stuStudentState;
	private int stuGrade;
	private String stuGraduationExam;
	private String stuEarlyGraduation;
	private String stuSemester;
	private int majorId;
	private Integer majorDualId;
	private Integer majorMinorId;
	private String majorName;
	private String majorDualName;
	private String majorMinorName;
	
	private List<Object> list;
	
	private Major mainMajor;
	private Major subMajor;
	private Major multiMajor;
	public Student() {
	}
	
	public Student(String stuId, String stuCourse, String stuArmy, Date stuAdmissionDate, Date stuGraduationDate,
			String stuRegisterState, String stuStudentState, int stuGrade, String stuGraduationExam,
			String stuEarlyGraduation, String stuSemester, int majorId, Integer majorDualId, Integer majorMinorId) {
		this.stuId = stuId;
		this.stuCourse = stuCourse;
		this.stuArmy = stuArmy;
		this.stuAdmissionDate = stuAdmissionDate;
		this.stuGraduationDate = stuGraduationDate;
		this.stuRegisterState = stuRegisterState;
		this.stuStudentState = stuStudentState;
		this.stuGrade = stuGrade;
		this.stuGraduationExam = stuGraduationExam;
		this.stuEarlyGraduation = stuEarlyGraduation;
		this.stuSemester = stuSemester;
		this.majorId = majorId;
		this.majorDualId = majorDualId;
		this.majorMinorId = majorMinorId;
	}

	public Student(String stuId, String stuCourse, String stuArmy, Date stuAdmissionDate, Date stuGraduationDate,
			String stuRegisterState, String stuStudentState, int stuGrade, String stuGraduationExam,
			String stuEarlyGraduation, String stuSemester, int majorId, Integer majorDualId, Integer majorMinorId,
			List<Object> list, Major mainMajor, Major subMajor, Major multiMajor) {
		this.stuId = stuId;
		this.stuCourse = stuCourse;
		this.stuArmy = stuArmy;
		this.stuAdmissionDate = stuAdmissionDate;
		this.stuGraduationDate = stuGraduationDate;
		this.stuRegisterState = stuRegisterState;
		this.stuStudentState = stuStudentState;
		this.stuGrade = stuGrade;
		this.stuGraduationExam = stuGraduationExam;
		this.stuEarlyGraduation = stuEarlyGraduation;
		this.stuSemester = stuSemester;
		this.majorId = majorId;
		this.majorDualId = majorDualId;
		this.majorMinorId = majorMinorId;
		this.list = list;
		this.mainMajor = mainMajor;
		this.subMajor = subMajor;
		this.multiMajor = multiMajor;
	}
	public Student(String stuId, String stuCourse, String stuArmy, Date stuAdmissionDate, Date stuGraduationDate,
			String stuRegisterState, String stuStudentState, int stuGrade, String stuGraduationExam,
			String stuEarlyGraduation, String stuSemester, int majorId, Integer majorDualId, Integer majorMinorId,
			String majorName, String majorDualName, String majorMinorName, List<Object> list, Major mainMajor,
			Major subMajor, Major multiMajor) {
		this.stuId = stuId;
		this.stuCourse = stuCourse;
		this.stuArmy = stuArmy;
		this.stuAdmissionDate = stuAdmissionDate;
		this.stuGraduationDate = stuGraduationDate;
		this.stuRegisterState = stuRegisterState;
		this.stuStudentState = stuStudentState;
		this.stuGrade = stuGrade;
		this.stuGraduationExam = stuGraduationExam;
		this.stuEarlyGraduation = stuEarlyGraduation;
		this.stuSemester = stuSemester;
		this.majorId = majorId;
		this.majorDualId = majorDualId;
		this.majorMinorId = majorMinorId;
		this.majorName = majorName;
		this.majorDualName = majorDualName;
		this.majorMinorName = majorMinorName;
		this.list = list;
		this.mainMajor = mainMajor;
		this.subMajor = subMajor;
		this.multiMajor = multiMajor;
	}

	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getStuCourse() {
		return stuCourse;
	}
	public void setStuCourse(String stuCourse) {
		this.stuCourse = stuCourse;
	}
	public String getStuArmy() {
		return stuArmy;
	}
	public void setStuArmy(String stuArmy) {
		this.stuArmy = stuArmy;
	}
	public Date getStuAdmissionDate() {
		return stuAdmissionDate;
	}
	public void setStuAdmissionDate(Date stuAdmissionDate) {
		this.stuAdmissionDate = stuAdmissionDate;
	}
	public Date getStuGraduationDate() {
		return stuGraduationDate;
	}
	public void setStuGraduationDate(Date stuGraduationDate) {
		this.stuGraduationDate = stuGraduationDate;
	}
	public String getStuRegisterState() {
		return stuRegisterState;
	}
	public void setStuRegisterState(String stuRegisterState) {
		this.stuRegisterState = stuRegisterState;
	}
	public String getStuStudentState() {
		return stuStudentState;
	}
	public void setStuStudentState(String stuStudentState) {
		this.stuStudentState = stuStudentState;
	}
	public int getStuGrade() {
		return stuGrade;
	}
	public void setStuGrade(int stuGrade) {
		this.stuGrade = stuGrade;
	}
	public String getStuGraduationExam() {
		return stuGraduationExam;
	}
	public void setStuGraduationExam(String stuGraduationExam) {
		this.stuGraduationExam = stuGraduationExam;
	}
	public String getStuEarlyGraduation() {
		return stuEarlyGraduation;
	}
	public void setStuEarlyGraduation(String stuEarlyGraduation) {
		this.stuEarlyGraduation = stuEarlyGraduation;
	}
	public String getStuSemester() {
		return stuSemester;
	}
	public void setStuSemester(String stuSemester) {
		this.stuSemester = stuSemester;
	}
	public int getMajorId() {
		return majorId;
	}
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}
	public Integer getMajorDualId() {
		return majorDualId;
	}
	public void setMajorDualId(Integer majorDualId) {
		this.majorDualId = majorDualId;
	}
	public Integer getMajorMinorId() {
		return majorMinorId;
	}
	public void setMajorMinorId(Integer majorMinorId) {
		this.majorMinorId = majorMinorId;
	}
	public List<Object> getList() {
		return list;
	}
	public void setList(List<Object> list) {
		this.list = list;
	}
	public Major getMainMajor() {
		return mainMajor;
	}
	public void setMainMajor(Major mainMajor) {
		this.mainMajor = mainMajor;
	}
	public Major getSubMajor() {
		return subMajor;
	}
	public void setSubMajor(Major subMajor) {
		this.subMajor = subMajor;
	}
	public Major getMultiMajor() {
		return multiMajor;
	}
	public void setMultiMajor(Major multiMajor) {
		this.multiMajor = multiMajor;
	}
	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getMajorDualName() {
		return majorDualName;
	}

	public void setMajorDualName(String majorDualName) {
		this.majorDualName = majorDualName;
	}

	public String getMajorMinorName() {
		return majorMinorName;
	}

	public void setMajorMinorName(String majorMinorName) {
		this.majorMinorName = majorMinorName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((list == null) ? 0 : list.hashCode());
		result = prime * result + ((mainMajor == null) ? 0 : mainMajor.hashCode());
		result = prime * result + ((majorDualName == null) ? 0 : majorDualName.hashCode());
		result = prime * result + ((majorDualId == null) ? 0 : majorDualId.hashCode());
		result = prime * result + majorId;
		result = prime * result + ((majorMinorId == null) ? 0 : majorMinorId.hashCode());
		result = prime * result + ((majorMinorName == null) ? 0 : majorMinorName.hashCode());
		result = prime * result + ((majorName == null) ? 0 : majorName.hashCode());
		result = prime * result + ((multiMajor == null) ? 0 : multiMajor.hashCode());
		result = prime * result + ((stuAdmissionDate == null) ? 0 : stuAdmissionDate.hashCode());
		result = prime * result + ((stuArmy == null) ? 0 : stuArmy.hashCode());
		result = prime * result + ((stuCourse == null) ? 0 : stuCourse.hashCode());
		result = prime * result + ((stuEarlyGraduation == null) ? 0 : stuEarlyGraduation.hashCode());
		result = prime * result + stuGrade;
		result = prime * result + ((stuGraduationDate == null) ? 0 : stuGraduationDate.hashCode());
		result = prime * result + ((stuGraduationExam == null) ? 0 : stuGraduationExam.hashCode());
		result = prime * result + ((stuId == null) ? 0 : stuId.hashCode());
		result = prime * result + ((stuRegisterState == null) ? 0 : stuRegisterState.hashCode());
		result = prime * result + ((stuSemester == null) ? 0 : stuSemester.hashCode());
		result = prime * result + ((stuStudentState == null) ? 0 : stuStudentState.hashCode());
		result = prime * result + ((subMajor == null) ? 0 : subMajor.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Student other = (Student) obj;
		if (list == null) {
			if (other.list != null)
				return false;
		} else if (!list.equals(other.list))
			return false;
		if (mainMajor == null) {
			if (other.mainMajor != null)
				return false;
		} else if (!mainMajor.equals(other.mainMajor))
			return false;
		if (majorDualName == null) {
			if (other.majorDualName != null)
				return false;
		} else if (!majorDualName.equals(other.majorDualName))
			return false;
		if (majorDualId == null) {
			if (other.majorDualId != null)
				return false;
		} else if (!majorDualId.equals(other.majorDualId))
			return false;
		if (majorId != other.majorId)
			return false;
		if (majorMinorId == null) {
			if (other.majorMinorId != null)
				return false;
		} else if (!majorMinorId.equals(other.majorMinorId))
			return false;
		if (majorMinorName == null) {
			if (other.majorMinorName != null)
				return false;
		} else if (!majorMinorName.equals(other.majorMinorName))
			return false;
		if (majorName == null) {
			if (other.majorName != null)
				return false;
		} else if (!majorName.equals(other.majorName))
			return false;
		if (multiMajor == null) {
			if (other.multiMajor != null)
				return false;
		} else if (!multiMajor.equals(other.multiMajor))
			return false;
		if (stuAdmissionDate == null) {
			if (other.stuAdmissionDate != null)
				return false;
		} else if (!stuAdmissionDate.equals(other.stuAdmissionDate))
			return false;
		if (stuArmy == null) {
			if (other.stuArmy != null)
				return false;
		} else if (!stuArmy.equals(other.stuArmy))
			return false;
		if (stuCourse == null) {
			if (other.stuCourse != null)
				return false;
		} else if (!stuCourse.equals(other.stuCourse))
			return false;
		if (stuEarlyGraduation == null) {
			if (other.stuEarlyGraduation != null)
				return false;
		} else if (!stuEarlyGraduation.equals(other.stuEarlyGraduation))
			return false;
		if (stuGrade != other.stuGrade)
			return false;
		if (stuGraduationDate == null) {
			if (other.stuGraduationDate != null)
				return false;
		} else if (!stuGraduationDate.equals(other.stuGraduationDate))
			return false;
		if (stuGraduationExam == null) {
			if (other.stuGraduationExam != null)
				return false;
		} else if (!stuGraduationExam.equals(other.stuGraduationExam))
			return false;
		if (stuId == null) {
			if (other.stuId != null)
				return false;
		} else if (!stuId.equals(other.stuId))
			return false;
		if (stuRegisterState == null) {
			if (other.stuRegisterState != null)
				return false;
		} else if (!stuRegisterState.equals(other.stuRegisterState))
			return false;
		if (stuSemester == null) {
			if (other.stuSemester != null)
				return false;
		} else if (!stuSemester.equals(other.stuSemester))
			return false;
		if (stuStudentState == null) {
			if (other.stuStudentState != null)
				return false;
		} else if (!stuStudentState.equals(other.stuStudentState))
			return false;
		if (subMajor == null) {
			if (other.subMajor != null)
				return false;
		} else if (!subMajor.equals(other.subMajor))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Student [stuId=" + stuId + ", stuCourse=" + stuCourse + ", stuArmy=" + stuArmy + ", stuAdmissionDate="
				+ stuAdmissionDate + ", stuGraduationDate=" + stuGraduationDate + ", stuRegisterState="
				+ stuRegisterState + ", stuStudentState=" + stuStudentState + ", stuGrade=" + stuGrade
				+ ", stuGraduationExam=" + stuGraduationExam + ", stuEarlyGraduation=" + stuEarlyGraduation
				+ ", stuSemester=" + stuSemester + ", majorId=" + majorId + ", majorDualId=" + majorDualId
				+ ", majorMinorId=" + majorMinorId + ", majorName=" + majorName + ", majorDualName=" + majorDualName
				+ ", majorMinorName=" + majorMinorName + ", list=" + list + ", mainMajor=" + mainMajor + ", subMajor="
				+ subMajor + ", multiMajor=" + multiMajor + "]";
	}
	
	
	
	
}