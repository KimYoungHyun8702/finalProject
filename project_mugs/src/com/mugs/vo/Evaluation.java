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

public class Evaluation implements Serializable {
	
	private int evaluationId;
	private int evaluationYear;
	private String evaluationSemester;
	private int evaluationTask;
	private int evaluationExam;
	private int evaluationReady;
	private int evaluationPassion;
	private int evaluationQuestion;
	private String proId;
	private int subjectId;
	private Subject subject;
	
	public Evaluation() {
	}

	public Evaluation(int evaluationId, int evaluationYear, String evaluationSemester, int evaluationTask,
			int evaluationExam, int evaluationReady, int evaluationPassion, int evaluationQuestion, String proId,
			int subjectId) {
		this.evaluationId = evaluationId;
		this.evaluationYear = evaluationYear;
		this.evaluationSemester = evaluationSemester;
		this.evaluationTask = evaluationTask;
		this.evaluationExam = evaluationExam;
		this.evaluationReady = evaluationReady;
		this.evaluationPassion = evaluationPassion;
		this.evaluationQuestion = evaluationQuestion;
		this.proId = proId;
		this.subjectId = subjectId;
	}

	public Evaluation(int evaluationId, int evaluationYear, String evaluationSemester, int evaluationTask,
			int evaluationExam, int evaluationReady, int evaluationPassion, int evaluationQuestion, String proId,
			int subjectId, Subject subject) {
		this.evaluationId = evaluationId;
		this.evaluationYear = evaluationYear;
		this.evaluationSemester = evaluationSemester;
		this.evaluationTask = evaluationTask;
		this.evaluationExam = evaluationExam;
		this.evaluationReady = evaluationReady;
		this.evaluationPassion = evaluationPassion;
		this.evaluationQuestion = evaluationQuestion;
		this.proId = proId;
		this.subjectId = subjectId;
		this.subject = subject;
	}

	public int getEvaluationId() {
		return evaluationId;
	}

	public void setEvaluationId(int evaluationId) {
		this.evaluationId = evaluationId;
	}

	public int getEvaluationYear() {
		return evaluationYear;
	}

	public void setEvaluationYear(int evaluationYear) {
		this.evaluationYear = evaluationYear;
	}

	public String getEvaluationSemester() {
		return evaluationSemester;
	}

	public void setEvaluationSemester(String evaluationSemester) {
		this.evaluationSemester = evaluationSemester;
	}

	public int getEvaluationTask() {
		return evaluationTask;
	}

	public void setEvaluationTask(int evaluationTask) {
		this.evaluationTask = evaluationTask;
	}

	public int getEvaluationExam() {
		return evaluationExam;
	}

	public void setEvaluationExam(int evaluationExam) {
		this.evaluationExam = evaluationExam;
	}

	public int getEvaluationReady() {
		return evaluationReady;
	}

	public void setEvaluationReady(int evaluationReady) {
		this.evaluationReady = evaluationReady;
	}

	public int getEvaluationPassion() {
		return evaluationPassion;
	}

	public void setEvaluationPassion(int evaluationPassion) {
		this.evaluationPassion = evaluationPassion;
	}

	public int getEvaluationQuestion() {
		return evaluationQuestion;
	}

	public void setEvaluationQuestion(int evaluationQuestion) {
		this.evaluationQuestion = evaluationQuestion;
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

	@Override
	public String toString() {
		return "Evaluation [evaluationId=" + evaluationId + ", evaluationYear=" + evaluationYear
				+ ", evaluationSemester=" + evaluationSemester + ", evaluationTask=" + evaluationTask
				+ ", evaluationExam=" + evaluationExam + ", evaluationReady=" + evaluationReady + ", evaluationPassion="
				+ evaluationPassion + ", evaluationQuestion=" + evaluationQuestion + ", proId=" + proId + ", subjectId="
				+ subjectId + ", subject=" + subject + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + evaluationExam;
		result = prime * result + evaluationId;
		result = prime * result + evaluationPassion;
		result = prime * result + evaluationQuestion;
		result = prime * result + evaluationReady;
		result = prime * result + ((evaluationSemester == null) ? 0 : evaluationSemester.hashCode());
		result = prime * result + evaluationTask;
		result = prime * result + evaluationYear;
		result = prime * result + ((proId == null) ? 0 : proId.hashCode());
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
		Evaluation other = (Evaluation) obj;
		if (evaluationExam != other.evaluationExam)
			return false;
		if (evaluationId != other.evaluationId)
			return false;
		if (evaluationPassion != other.evaluationPassion)
			return false;
		if (evaluationQuestion != other.evaluationQuestion)
			return false;
		if (evaluationReady != other.evaluationReady)
			return false;
		if (evaluationSemester == null) {
			if (other.evaluationSemester != null)
				return false;
		} else if (!evaluationSemester.equals(other.evaluationSemester))
			return false;
		if (evaluationTask != other.evaluationTask)
			return false;
		if (evaluationYear != other.evaluationYear)
			return false;
		if (proId == null) {
			if (other.proId != null)
				return false;
		} else if (!proId.equals(other.proId))
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