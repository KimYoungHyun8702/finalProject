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

public class Course implements Serializable {
	
	private int courseId;
	private int courseYear;
	private String courseSemester;
	private int subjectId;
	private String stuId;
	private String proId;
	private Subject subject;
	private Student student;
	private Professor professor;
	

	public Course() {
	}

	public Course(int courseId, int courseYear, String courseSemester, int subjectId, String stuId, String proId) {
		this.courseId = courseId;
		this.courseYear = courseYear;
		this.courseSemester = courseSemester;
		this.subjectId = subjectId;
		this.stuId = stuId;
		this.proId = proId;
	}

	public Course(int courseId, int courseYear, String courseSemester, int subjectId, String stuId, String proId,
			Subject subject, Student student, Professor professor) {
		this.courseId = courseId;
		this.courseYear = courseYear;
		this.courseSemester = courseSemester;
		this.subjectId = subjectId;
		this.stuId = stuId;
		this.proId = proId;
		this.subject = subject;
		this.student = student;
		this.professor = professor;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getCourseYear() {
		return courseYear;
	}

	public void setCourseYear(int courseYear) {
		this.courseYear = courseYear;
	}

	public String getCourseSemester() {
		return courseSemester;
	}

	public void setCourseSemester(String courseSemester) {
		this.courseSemester = courseSemester;
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

	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", courseYear=" + courseYear + ", courseSemester=" + courseSemester
				+ ", subjectId=" + subjectId + ", stuId=" + stuId + ", proId=" + proId + ", subject=" + subject
				+ ", student=" + student + ", professor=" + professor + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + courseId;
		result = prime * result + ((courseSemester == null) ? 0 : courseSemester.hashCode());
		result = prime * result + courseYear;
		result = prime * result + ((proId == null) ? 0 : proId.hashCode());
		result = prime * result + ((professor == null) ? 0 : professor.hashCode());
		result = prime * result + ((stuId == null) ? 0 : stuId.hashCode());
		result = prime * result + ((student == null) ? 0 : student.hashCode());
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
		Course other = (Course) obj;
		if (courseId != other.courseId)
			return false;
		if (courseSemester == null) {
			if (other.courseSemester != null)
				return false;
		} else if (!courseSemester.equals(other.courseSemester))
			return false;
		if (courseYear != other.courseYear)
			return false;
		if (proId == null) {
			if (other.proId != null)
				return false;
		} else if (!proId.equals(other.proId))
			return false;
		if (professor == null) {
			if (other.professor != null)
				return false;
		} else if (!professor.equals(other.professor))
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