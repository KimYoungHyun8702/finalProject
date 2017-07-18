package com.mugs.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class LeaveReturnApplication implements Serializable {
	
	private int LRApplicationId;
	private String LRApplicationType;
	private Date LRApplicationStartDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date LRApplicationFinishDate;
	private String LRApplicationState;
	private String stuId;
	
	private String usersName;
	private String usersId;
	private String majorName;
	
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

	public LeaveReturnApplication(int lRApplicationId, String lRApplicationType, Date lRApplicationStartDate,
			Date lRApplicationFinishDate, String lRApplicationState, String stuId, String usersName, String usersId,
			String majorName) {
		LRApplicationId = lRApplicationId;
		LRApplicationType = lRApplicationType;
		LRApplicationStartDate = lRApplicationStartDate;
		LRApplicationFinishDate = lRApplicationFinishDate;
		LRApplicationState = lRApplicationState;
		this.stuId = stuId;
		this.usersName = usersName;
		this.usersId = usersId;
		this.majorName = majorName;
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

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
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
		result = prime * result + ((majorName == null) ? 0 : majorName.hashCode());
		result = prime * result + ((stuId == null) ? 0 : stuId.hashCode());
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
		if (majorName == null) {
			if (other.majorName != null)
				return false;
		} else if (!majorName.equals(other.majorName))
			return false;
		if (stuId == null) {
			if (other.stuId != null)
				return false;
		} else if (!stuId.equals(other.stuId))
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
		return "LeaveReturnApplication [LRApplicationId=" + LRApplicationId + ", LRApplicationType=" + LRApplicationType
				+ ", LRApplicationStartDate=" + LRApplicationStartDate + ", LRApplicationFinishDate="
				+ LRApplicationFinishDate + ", LRApplicationState=" + LRApplicationState + ", stuId=" + stuId
				+ ", usersName=" + usersName + ", usersId=" + usersId + ", majorName=" + majorName + "]";
	}

	
}