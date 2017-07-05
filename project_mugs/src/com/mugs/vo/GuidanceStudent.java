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

public class GuidanceStudent implements Serializable {
	
	private int guidanceStudentId;
	private String consultantContent;
	private Date consultantDate;
	private String stuId;
	private String proId;
	private Student student;
	private List<Student> studentList;
	
	public GuidanceStudent() {
	}

	public GuidanceStudent(int guidanceStudentId, String consultantContent, Date consultantDate, String stuId,
			String proId) {
		this.guidanceStudentId = guidanceStudentId;
		this.consultantContent = consultantContent;
		this.consultantDate = consultantDate;
		this.stuId = stuId;
		this.proId = proId;
	}

	public GuidanceStudent(int guidanceStudentId, String consultantContent, Date consultantDate, String stuId,
			String proId, Student student) {
		this.guidanceStudentId = guidanceStudentId;
		this.consultantContent = consultantContent;
		this.consultantDate = consultantDate;
		this.stuId = stuId;
		this.proId = proId;
		this.student = student;
	}

	
	
	public GuidanceStudent(int guidanceStudentId, String consultantContent, Date consultantDate, String stuId,
			String proId, Student student, List<Student> studentList) {
		super();
		this.guidanceStudentId = guidanceStudentId;
		this.consultantContent = consultantContent;
		this.consultantDate = consultantDate;
		this.stuId = stuId;
		this.proId = proId;
		this.studentList = studentList;
	}

	
	
	public List<Student> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<Student> studentList) {
		this.studentList = studentList;
	}

	public int getGuidanceStudentId() {
		return guidanceStudentId;
	}

	public void setGuidanceStudentId(int guidanceStudentId) {
		this.guidanceStudentId = guidanceStudentId;
	}

	public String getConsultantContent() {
		return consultantContent;
	}

	public void setConsultantContent(String consultantContent) {
		this.consultantContent = consultantContent;
	}

	public Date getConsultantDate() {
		return consultantDate;
	}

	public void setConsultantDate(Date consultantDate) {
		this.consultantDate = consultantDate;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@Override
	public String toString() {
		return "GuidanceStudent [guidanceStudentId=" + guidanceStudentId + ", consultantContent=" + consultantContent
				+ ", consultantDate=" + consultantDate + ", stuId=" + stuId + ", proId=" + proId + ", student="
				+ student + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((consultantContent == null) ? 0 : consultantContent.hashCode());
		result = prime * result + ((consultantDate == null) ? 0 : consultantDate.hashCode());
		result = prime * result + guidanceStudentId;
		result = prime * result + ((proId == null) ? 0 : proId.hashCode());
		result = prime * result + ((stuId == null) ? 0 : stuId.hashCode());
		result = prime * result + ((student == null) ? 0 : student.hashCode());
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
		GuidanceStudent other = (GuidanceStudent) obj;
		if (consultantContent == null) {
			if (other.consultantContent != null)
				return false;
		} else if (!consultantContent.equals(other.consultantContent))
			return false;
		if (consultantDate == null) {
			if (other.consultantDate != null)
				return false;
		} else if (!consultantDate.equals(other.consultantDate))
			return false;
		if (guidanceStudentId != other.guidanceStudentId)
			return false;
		if (proId == null) {
			if (other.proId != null)
				return false;
		} else if (!proId.equals(other.proId))
			return false;
		if (stuId == null) {
			if (other.stuId != null)
				return false;
		} else if (!stuId.equals(other.stuId))
			return false;
		if (student == null) {
			if (other.student != null)
				return false;
		} else if (!student.equals(other.student))
			return false;
		return true;
	}
}