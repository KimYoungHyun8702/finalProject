/**
 * @author Administrator
 *
 */
package com.mugs.vo;

import java.io.Serializable;

public class SubjectPlan implements Serializable {
	
	private int planId;
	private String planSummary;
	private String planMarkingMethod;
	private String planLessonGoal;
	private String planWeekContent;
	private String planBookinfo;
	private String planBibliography;
	private int planYear;
	private String planSemester;
	private String planNote;
	private String proId;
	private int subjectId;
	/**--영혀니가 넣었음--*/
	private Professor professor;
	private Subject subject;

	public SubjectPlan() {
		super();
	}
	/**-------영혀니가 넣은 생성자-------*/
	public SubjectPlan(int planId, String planSummary, String planMarkingMethod, String planLessonGoal,
			String planWeekContent, String planBookinfo, String planBibliography, int planYear, String planSemester,
			String planNote, String proId, int subjectId, Professor professor, Subject subject) {
		super();
		this.planId = planId;
		this.planSummary = planSummary;
		this.planMarkingMethod = planMarkingMethod;
		this.planLessonGoal = planLessonGoal;
		this.planWeekContent = planWeekContent;
		this.planBookinfo = planBookinfo;
		this.planBibliography = planBibliography;
		this.planYear = planYear;
		this.planSemester = planSemester;
		this.planNote = planNote;
		this.proId = proId;
		this.subjectId = subjectId;
		this.professor = professor;
		this.subject = subject;
	}

	public SubjectPlan(int planId, String planSummary, String planMarkingMethod, String planLessonGoal,
			String planWeekContent, String planBookinfo, String planBibliography, int planYear, String planSemester,
			String planNote, String proId, int subjectId) {
		super();
		this.planId = planId;
		this.planSummary = planSummary;
		this.planMarkingMethod = planMarkingMethod;
		this.planLessonGoal = planLessonGoal;
		this.planWeekContent = planWeekContent;
		this.planBookinfo = planBookinfo;
		this.planBibliography = planBibliography;
		this.planYear = planYear;
		this.planSemester = planSemester;
		this.planNote = planNote;
		this.proId = proId;
		this.subjectId = subjectId;
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public String getPlanSummary() {
		return planSummary;
	}

	public void setPlanSummary(String planSummary) {
		this.planSummary = planSummary;
	}

	public String getPlanMarkingMethod() {
		return planMarkingMethod;
	}

	public void setPlanMarkingMethod(String planMarkingMethod) {
		this.planMarkingMethod = planMarkingMethod;
	}

	public String getPlanLessonGoal() {
		return planLessonGoal;
	}

	public void setPlanLessonGoal(String planLessonGoal) {
		this.planLessonGoal = planLessonGoal;
	}

	public String getPlanWeekContent() {
		return planWeekContent;
	}

	public void setPlanWeekContent(String planWeekContent) {
		this.planWeekContent = planWeekContent;
	}

	public String getPlanBookinfo() {
		return planBookinfo;
	}

	public void setPlanBookinfo(String planBookinfo) {
		this.planBookinfo = planBookinfo;
	}

	public String getPlanBibliography() {
		return planBibliography;
	}

	public void setPlanBibliography(String planBibliography) {
		this.planBibliography = planBibliography;
	}

	public int getPlanYear() {
		return planYear;
	}

	public void setPlanYear(int planYear) {
		this.planYear = planYear;
	}

	public String getPlanSemester() {
		return planSemester;
	}

	public void setPlanSemester(String planSemester) {
		this.planSemester = planSemester;
	}

	public String getPlanNote() {
		return planNote;
	}

	public void setPlanNote(String planNote) {
		this.planNote = planNote;
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
	public Professor getProfessor() {
		return professor;
	}
	public void setProfessor(Professor professor) {
		this.professor = professor;
	}
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	@Override
	public String toString() {
		return "SubjectPlan [planId=" + planId + ", planSummary=" + planSummary + ", planMarkingMethod="
				+ planMarkingMethod + ", planLessonGoal=" + planLessonGoal + ", planWeekContent=" + planWeekContent
				+ ", planBookinfo=" + planBookinfo + ", planBibliography=" + planBibliography + ", planYear=" + planYear
				+ ", planSemester=" + planSemester + ", planNote=" + planNote + ", proId=" + proId + ", subjectId="
				+ subjectId + ", professor=" + professor + ", subject=" + subject + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((planBibliography == null) ? 0 : planBibliography.hashCode());
		result = prime * result + ((planBookinfo == null) ? 0 : planBookinfo.hashCode());
		result = prime * result + planId;
		result = prime * result + ((planLessonGoal == null) ? 0 : planLessonGoal.hashCode());
		result = prime * result + ((planMarkingMethod == null) ? 0 : planMarkingMethod.hashCode());
		result = prime * result + ((planNote == null) ? 0 : planNote.hashCode());
		result = prime * result + ((planSemester == null) ? 0 : planSemester.hashCode());
		result = prime * result + ((planSummary == null) ? 0 : planSummary.hashCode());
		result = prime * result + ((planWeekContent == null) ? 0 : planWeekContent.hashCode());
		result = prime * result + planYear;
		result = prime * result + ((proId == null) ? 0 : proId.hashCode());
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
		SubjectPlan other = (SubjectPlan) obj;
		if (planBibliography == null) {
			if (other.planBibliography != null)
				return false;
		} else if (!planBibliography.equals(other.planBibliography))
			return false;
		if (planBookinfo == null) {
			if (other.planBookinfo != null)
				return false;
		} else if (!planBookinfo.equals(other.planBookinfo))
			return false;
		if (planId != other.planId)
			return false;
		if (planLessonGoal == null) {
			if (other.planLessonGoal != null)
				return false;
		} else if (!planLessonGoal.equals(other.planLessonGoal))
			return false;
		if (planMarkingMethod == null) {
			if (other.planMarkingMethod != null)
				return false;
		} else if (!planMarkingMethod.equals(other.planMarkingMethod))
			return false;
		if (planNote == null) {
			if (other.planNote != null)
				return false;
		} else if (!planNote.equals(other.planNote))
			return false;
		if (planSemester == null) {
			if (other.planSemester != null)
				return false;
		} else if (!planSemester.equals(other.planSemester))
			return false;
		if (planSummary == null) {
			if (other.planSummary != null)
				return false;
		} else if (!planSummary.equals(other.planSummary))
			return false;
		if (planWeekContent == null) {
			if (other.planWeekContent != null)
				return false;
		} else if (!planWeekContent.equals(other.planWeekContent))
			return false;
		if (planYear != other.planYear)
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