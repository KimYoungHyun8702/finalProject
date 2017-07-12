package com.mugs.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class LeaveReturnApplication {
	
	private int LRApplicationId;
	private String LRApplicationType;
	private Date LRApplicationStartDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date LRApplicationFinishDate;
	private String LRApplicationState;
	private String stuId;
	
	public LeaveReturnApplication() {
	}

	public LeaveReturnApplication(int lRApplicationId, String lRApplicationType, Date lRApplicationStartDate,
			Date lRApplicationFinishDate, String lRApplicationState, String stuId) {
		LRApplicationId = lRApplicationId;
		LRApplicationType = lRApplicationType;
		LRApplicationStartDate = lRApplicationStartDate;
		LRApplicationFinishDate = lRApplicationFinishDate;
		LRApplicationState = lRApplicationState;
		this.stuId = stuId;
	}

	public int getLRApplicationId() {
		return LRApplicationId;
	}

	public void setLRApplicationId(int lRApplicationId) {
		LRApplicationId = lRApplicationId;
	}

	public String getLRApplicationType() {
		return LRApplicationType;
	}

	public void setLRApplicationType(String lRApplicationType) {
		LRApplicationType = lRApplicationType;
	}

	public Date getLRApplicationStartDate() {
		return LRApplicationStartDate;
	}

	public void setLRApplicationStartDate(Date lRApplicationStartDate) {
		LRApplicationStartDate = lRApplicationStartDate;
	}

	public Date getLRApplicationFinishDate() {
		return LRApplicationFinishDate;
	}

	public void setLRApplicationFinishDate(Date lRApplicationFinishDate) {
		LRApplicationFinishDate = lRApplicationFinishDate;
	}

	public String getLRApplicationState() {
		return LRApplicationState;
	}

	public void setLRApplicationState(String lRApplicationState) {
		LRApplicationState = lRApplicationState;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	@Override
	public String toString() {
		return "LeaveReturnApplication [LRApplicationId=" + LRApplicationId + ", LRApplicationType=" + LRApplicationType
				+ ", LRApplicationStartDate=" + LRApplicationStartDate + ", LRApplicationFinishDate="
				+ LRApplicationFinishDate + ", LRApplicationState=" + LRApplicationState + ", stuId=" + stuId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((LRApplicationFinishDate == null) ? 0 : LRApplicationFinishDate.hashCode());
		result = prime * result + LRApplicationId;
		result = prime * result + ((LRApplicationStartDate == null) ? 0 : LRApplicationStartDate.hashCode());
		result = prime * result + ((LRApplicationState == null) ? 0 : LRApplicationState.hashCode());
		result = prime * result + ((LRApplicationType == null) ? 0 : LRApplicationType.hashCode());
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
		LeaveReturnApplication other = (LeaveReturnApplication) obj;
		if (LRApplicationFinishDate == null) {
			if (other.LRApplicationFinishDate != null)
				return false;
		} else if (!LRApplicationFinishDate.equals(other.LRApplicationFinishDate))
			return false;
		if (LRApplicationId != other.LRApplicationId)
			return false;
		if (LRApplicationStartDate == null) {
			if (other.LRApplicationStartDate != null)
				return false;
		} else if (!LRApplicationStartDate.equals(other.LRApplicationStartDate))
			return false;
		if (LRApplicationState == null) {
			if (other.LRApplicationState != null)
				return false;
		} else if (!LRApplicationState.equals(other.LRApplicationState))
			return false;
		if (LRApplicationType == null) {
			if (other.LRApplicationType != null)
				return false;
		} else if (!LRApplicationType.equals(other.LRApplicationType))
			return false;
		if (stuId == null) {
			if (other.stuId != null)
				return false;
		} else if (!stuId.equals(other.stuId))
			return false;
		return true;
	}
}