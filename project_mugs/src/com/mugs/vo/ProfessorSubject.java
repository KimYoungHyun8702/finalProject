/**
 * 
 */
/**
 * @author Administrator
 *
 */
package com.mugs.vo;

import java.io.Serializable;

public class ProfessorSubject implements Serializable {

	private int proSubjectId;
	private String proSubjectSemester;
	private int proSubjectYear;
	private String proId;
	private int subjectId;
	private Subject subject;
	private Professor professor;

	public ProfessorSubject() {
	}

	public ProfessorSubject(int proSubjectId, String proSubjectSemester, int proSubjectYear, String proId,
			int subjectId) {
		this.proSubjectId = proSubjectId;
		this.proSubjectSemester = proSubjectSemester;
		this.proSubjectYear = proSubjectYear;
		this.proId = proId;
		this.subjectId = subjectId;
	}
	
	public ProfessorSubject(int proSubjectId, String proSubjectSemester, int proSubjectYear, String proId,
			int subjectId, Subject subject) {
		super();
		this.proSubjectId = proSubjectId;
		this.proSubjectSemester = proSubjectSemester;
		this.proSubjectYear = proSubjectYear;
		this.proId = proId;
		this.subjectId = subjectId;
		this.subject = subject;
	}

	public ProfessorSubject(int proSubjectId, String proSubjectSemester, int proSubjectYear, String proId,
			int subjectId, Subject subject, Professor professor) {
		this.proSubjectId = proSubjectId;
		this.proSubjectSemester = proSubjectSemester;
		this.proSubjectYear = proSubjectYear;
		this.proId = proId;
		this.subjectId = subjectId;
		this.subject = subject;
		this.professor = professor;
	}

	public int getProSubjectId() {
		return proSubjectId;
	}

	public void setProSubjectId(int proSubjectId) {
		this.proSubjectId = proSubjectId;
	}

	public String getProSubjectSemester() {
		return proSubjectSemester;
	}

	public void setProSubjectSemester(String proSubjectSemester) {
		this.proSubjectSemester = proSubjectSemester;
	}

	public int getProSubjectYear() {
		return proSubjectYear;
	}

	public void setProSubjectYear(int proSubjectYear) {
		this.proSubjectYear = proSubjectYear;
	}

	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	@Override
	public String toString() {
		return "ProfessorSubject [proSubjectId=" + proSubjectId + ", proSubjectSemester=" + proSubjectSemester
				+ ", proSubjectYear=" + proSubjectYear + ", proId=" + proId + ", subjectId=" + subjectId + ", subject="
				+ subject + ", professor=" + professor + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((proId == null) ? 0 : proId.hashCode());
		result = prime * result + proSubjectId;
		result = prime * result + ((proSubjectSemester == null) ? 0 : proSubjectSemester.hashCode());
		result = prime * result + proSubjectYear;
		result = prime * result + ((professor == null) ? 0 : professor.hashCode());
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
		ProfessorSubject other = (ProfessorSubject) obj;
		if (proId == null) {
			if (other.proId != null)
				return false;
		} else if (!proId.equals(other.proId))
			return false;
		if (proSubjectId != other.proSubjectId)
			return false;
		if (proSubjectSemester == null) {
			if (other.proSubjectSemester != null)
				return false;
		} else if (!proSubjectSemester.equals(other.proSubjectSemester))
			return false;
		if (proSubjectYear != other.proSubjectYear)
			return false;
		if (professor == null) {
			if (other.professor != null)
				return false;
		} else if (!professor.equals(other.professor))
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