package com.mugs.vo;

import java.io.Serializable;

public class EvaluationAnswer implements Serializable {
	
	private int evaluationAnswerId;
	private String evaluationAnswerState;
	private int evaluationAnswerYear;
	private String evaluationAnswerSemester;
	private String stuId;
	private int subjectId;
	
	private Subject subject;
	private Professor professor;
	private Course course;
	
	
	public Professor getProfessor() {
		return professor;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public EvaluationAnswer(int evaluationAnswerId, String evaluationAnswerState, int evaluationAnswerYear,
			String evaluationAnswerSemester, String stuId, int subjectId, Subject subject, Professor professor,
			Course course) {
		super();
		this.evaluationAnswerId = evaluationAnswerId;
		this.evaluationAnswerState = evaluationAnswerState;
		this.evaluationAnswerYear = evaluationAnswerYear;
		this.evaluationAnswerSemester = evaluationAnswerSemester;
		this.stuId = stuId;
		this.subjectId = subjectId;
		this.subject = subject;
		this.professor = professor;
		this.course = course;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public EvaluationAnswer() {
	}

	public EvaluationAnswer(int evaluationAnswerId, String evaluationAnswerState, int evaluationAnswerYear,
			String evaluationAnswerSemester, String stuId, int subjectId, Subject subject, Professor professor) {
		super();
		this.evaluationAnswerId = evaluationAnswerId;
		this.evaluationAnswerState = evaluationAnswerState;
		this.evaluationAnswerYear = evaluationAnswerYear;
		this.evaluationAnswerSemester = evaluationAnswerSemester;
		this.stuId = stuId;
		this.subjectId = subjectId;
		this.subject = subject;
		this.professor = professor;
	}

	public EvaluationAnswer(int evaluationAnswerId, String evaluationAnswerState, int evaluationAnswerYear,
			String evaluationAnswerSemester, String stuId, int subjectId) {
		this.evaluationAnswerId = evaluationAnswerId;
		this.evaluationAnswerState = evaluationAnswerState;
		this.evaluationAnswerYear = evaluationAnswerYear;
		this.evaluationAnswerSemester = evaluationAnswerSemester;
		this.stuId = stuId;
		this.subjectId = subjectId;
	}

	public EvaluationAnswer(int evaluationAnswerId, String evaluationAnswerState, int evaluationAnswerYear,
			String evaluationAnswerSemester, String stuId, int subjectId, Subject subject) {
		this.evaluationAnswerId = evaluationAnswerId;
		this.evaluationAnswerState = evaluationAnswerState;
		this.evaluationAnswerYear = evaluationAnswerYear;
		this.evaluationAnswerSemester = evaluationAnswerSemester;
		this.stuId = stuId;
		this.subjectId = subjectId;
		this.subject = subject;
	}

	public int getEvaluationAnswerId() {
		return evaluationAnswerId;
	}

	public void setEvaluationAnswerId(int evaluationAnswerId) {
		this.evaluationAnswerId = evaluationAnswerId;
	}

	public String getEvaluationAnswerState() {
		return evaluationAnswerState;
	}

	public void setEvaluationAnswerState(String evaluationAnswerState) {
		this.evaluationAnswerState = evaluationAnswerState;
	}

	public int getEvaluationAnswerYear() {
		return evaluationAnswerYear;
	}

	public void setEvaluationAnswerYear(int evaluationAnswerYear) {
		this.evaluationAnswerYear = evaluationAnswerYear;
	}

	public String getEvaluationAnswerSemester() {
		return evaluationAnswerSemester;
	}

	public void setEvaluationAnswerSemester(String evaluationAnswerSemester) {
		this.evaluationAnswerSemester = evaluationAnswerSemester;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
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

	@Override
	public String toString() {
		return "EvaluationAnswer [evaluationAnswerId=" + evaluationAnswerId + ", evaluationAnswerState="
				+ evaluationAnswerState + ", evaluationAnswerYear=" + evaluationAnswerYear
				+ ", evaluationAnswerSemester=" + evaluationAnswerSemester + ", stuId=" + stuId + ", subjectId="
				+ subjectId + ", subject=" + subject + ", professor=" + professor + ", course=" + course + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((course == null) ? 0 : course.hashCode());
		result = prime * result + evaluationAnswerId;
		result = prime * result + ((evaluationAnswerSemester == null) ? 0 : evaluationAnswerSemester.hashCode());
		result = prime * result + ((evaluationAnswerState == null) ? 0 : evaluationAnswerState.hashCode());
		result = prime * result + evaluationAnswerYear;
		result = prime * result + ((professor == null) ? 0 : professor.hashCode());
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
		EvaluationAnswer other = (EvaluationAnswer) obj;
		if (course == null) {
			if (other.course != null)
				return false;
		} else if (!course.equals(other.course))
			return false;
		if (evaluationAnswerId != other.evaluationAnswerId)
			return false;
		if (evaluationAnswerSemester == null) {
			if (other.evaluationAnswerSemester != null)
				return false;
		} else if (!evaluationAnswerSemester.equals(other.evaluationAnswerSemester))
			return false;
		if (evaluationAnswerState == null) {
			if (other.evaluationAnswerState != null)
				return false;
		} else if (!evaluationAnswerState.equals(other.evaluationAnswerState))
			return false;
		if (evaluationAnswerYear != other.evaluationAnswerYear)
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