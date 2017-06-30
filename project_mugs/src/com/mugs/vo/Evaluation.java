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
	private Date evaluationStart;
	private Date evaluationEnd;
	private Date evaluationReadStart;
	private Date evaluationReadEnd;
	private Subject subject;
	
	public Evaluation() {
	}

	public Evaluation(int evaluationId, int evaluationYear, String evaluationSemester, int evaluationTask,
			int evaluationExam, int evaluationReady, int evaluationPassion, int evaluationQuestion, String proId,
			int subjectId, Date evaluationStart, Date evaluationEnd, Date evaluationReadStart, Date evaluationReadEnd) {
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
		this.evaluationStart = evaluationStart;
		this.evaluationEnd = evaluationEnd;
		this.evaluationReadStart = evaluationReadStart;
		this.evaluationReadEnd = evaluationReadEnd;
	}

	public Evaluation(int evaluationId, int evaluationYear, String evaluationSemester, int evaluationTask,
			int evaluationExam, int evaluationReady, int evaluationPassion, int evaluationQuestion, String proId,
			int subjectId, Date evaluationStart, Date evaluationEnd, Date evaluationReadStart, Date evaluationReadEnd,
			Subject subject) {
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
		this.evaluationStart = evaluationStart;
		this.evaluationEnd = evaluationEnd;
		this.evaluationReadStart = evaluationReadStart;
		this.evaluationReadEnd = evaluationReadEnd;
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

	public Date getEvaluationStart() {
		return evaluationStart;
	}

	public void setEvaluationStart(Date evaluationStart) {
		this.evaluationStart = evaluationStart;
	}

	public Date getEvaluationEnd() {
		return evaluationEnd;
	}

	public void setEvaluationEnd(Date evaluationEnd) {
		this.evaluationEnd = evaluationEnd;
	}

	public Date getEvaluationReadStart() {
		return evaluationReadStart;
	}

	public void setEvaluationReadStart(Date evaluationReadStart) {
		this.evaluationReadStart = evaluationReadStart;
	}

	public Date getEvaluationReadEnd() {
		return evaluationReadEnd;
	}

	public void setEvaluationReadEnd(Date evaluationReadEnd) {
		this.evaluationReadEnd = evaluationReadEnd;
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
				+ subjectId + ", evaluationStart=" + evaluationStart + ", evaluationEnd=" + evaluationEnd
				+ ", evaluationReadStart=" + evaluationReadStart + ", evaluationReadEnd=" + evaluationReadEnd
				+ ", subject=" + subject + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((evaluationEnd == null) ? 0 : evaluationEnd.hashCode());
		result = prime * result + evaluationExam;
		result = prime * result + evaluationId;
		result = prime * result + evaluationPassion;
		result = prime * result + evaluationQuestion;
		result = prime * result + ((evaluationReadEnd == null) ? 0 : evaluationReadEnd.hashCode());
		result = prime * result + ((evaluationReadStart == null) ? 0 : evaluationReadStart.hashCode());
		result = prime * result + evaluationReady;
		result = prime * result + ((evaluationSemester == null) ? 0 : evaluationSemester.hashCode());
		result = prime * result + ((evaluationStart == null) ? 0 : evaluationStart.hashCode());
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
		if (evaluationEnd == null) {
			if (other.evaluationEnd != null)
				return false;
		} else if (!evaluationEnd.equals(other.evaluationEnd))
			return false;
		if (evaluationExam != other.evaluationExam)
			return false;
		if (evaluationId != other.evaluationId)
			return false;
		if (evaluationPassion != other.evaluationPassion)
			return false;
		if (evaluationQuestion != other.evaluationQuestion)
			return false;
		if (evaluationReadEnd == null) {
			if (other.evaluationReadEnd != null)
				return false;
		} else if (!evaluationReadEnd.equals(other.evaluationReadEnd))
			return false;
		if (evaluationReadStart == null) {
			if (other.evaluationReadStart != null)
				return false;
		} else if (!evaluationReadStart.equals(other.evaluationReadStart))
			return false;
		if (evaluationReady != other.evaluationReady)
			return false;
		if (evaluationSemester == null) {
			if (other.evaluationSemester != null)
				return false;
		} else if (!evaluationSemester.equals(other.evaluationSemester))
			return false;
		if (evaluationStart == null) {
			if (other.evaluationStart != null)
				return false;
		} else if (!evaluationStart.equals(other.evaluationStart))
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