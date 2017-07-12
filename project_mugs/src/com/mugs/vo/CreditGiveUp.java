package com.mugs.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CreditGiveUp implements Serializable {

	private int CGUId;
	private int CGUYear;
	private String CGUSemester;
	private Date CGUStartDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date CGUFinishDate;
	private String CGUState;
	private int creditId;
	
	private Credit credit;
	
	public CreditGiveUp() {
	}

	public CreditGiveUp(int cGUId, int cGUYear, String cGUSemester, Date cGUStartDate, Date cGUFinishDate,
			String cGUState, int creditId) {
		CGUId = cGUId;
		CGUYear = cGUYear;
		CGUSemester = cGUSemester;
		CGUStartDate = cGUStartDate;
		CGUFinishDate = cGUFinishDate;
		CGUState = cGUState;
		this.creditId = creditId;
	}

	public CreditGiveUp(int cGUId, int cGUYear, String cGUSemester, Date cGUStartDate, Date cGUFinishDate,
			String cGUState, int creditId, Credit credit) {
		CGUId = cGUId;
		CGUYear = cGUYear;
		CGUSemester = cGUSemester;
		CGUStartDate = cGUStartDate;
		CGUFinishDate = cGUFinishDate;
		CGUState = cGUState;
		this.creditId = creditId;
		this.credit = credit;
	}

	public int getCGUId() {
		return CGUId;
	}

	public void setCGUId(int cGUId) {
		CGUId = cGUId;
	}

	public int getCGUYear() {
		return CGUYear;
	}

	public void setCGUYear(int cGUYear) {
		CGUYear = cGUYear;
	}

	public String getCGUSemester() {
		return CGUSemester;
	}

	public void setCGUSemester(String cGUSemester) {
		CGUSemester = cGUSemester;
	}

	public Date getCGUStartDate() {
		return CGUStartDate;
	}

	public void setCGUStartDate(Date cGUStartDate) {
		CGUStartDate = cGUStartDate;
	}

	public Date getCGUFinishDate() {
		return CGUFinishDate;
	}

	public void setCGUFinishDate(Date cGUFinishDate) {
		CGUFinishDate = cGUFinishDate;
	}

	public String getCGUState() {
		return CGUState;
	}

	public void setCGUState(String cGUState) {
		CGUState = cGUState;
	}

	public int getCreditId() {
		return creditId;
	}

	public void setCreditId(int creditId) {
		this.creditId = creditId;
	}

	public Credit getCredit() {
		return credit;
	}

	public void setCredit(Credit credit) {
		this.credit = credit;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((CGUFinishDate == null) ? 0 : CGUFinishDate.hashCode());
		result = prime * result + CGUId;
		result = prime * result + ((CGUSemester == null) ? 0 : CGUSemester.hashCode());
		result = prime * result + ((CGUStartDate == null) ? 0 : CGUStartDate.hashCode());
		result = prime * result + ((CGUState == null) ? 0 : CGUState.hashCode());
		result = prime * result + CGUYear;
		result = prime * result + ((credit == null) ? 0 : credit.hashCode());
		result = prime * result + creditId;
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
		CreditGiveUp other = (CreditGiveUp) obj;
		if (CGUFinishDate == null) {
			if (other.CGUFinishDate != null)
				return false;
		} else if (!CGUFinishDate.equals(other.CGUFinishDate))
			return false;
		if (CGUId != other.CGUId)
			return false;
		if (CGUSemester == null) {
			if (other.CGUSemester != null)
				return false;
		} else if (!CGUSemester.equals(other.CGUSemester))
			return false;
		if (CGUStartDate == null) {
			if (other.CGUStartDate != null)
				return false;
		} else if (!CGUStartDate.equals(other.CGUStartDate))
			return false;
		if (CGUState == null) {
			if (other.CGUState != null)
				return false;
		} else if (!CGUState.equals(other.CGUState))
			return false;
		if (CGUYear != other.CGUYear)
			return false;
		if (credit == null) {
			if (other.credit != null)
				return false;
		} else if (!credit.equals(other.credit))
			return false;
		if (creditId != other.creditId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CreditGiveUp [CGUId=" + CGUId + ", CGUYear=" + CGUYear + ", CGUSemester=" + CGUSemester
				+ ", CGUStartDate=" + CGUStartDate + ", CGUFinishDate=" + CGUFinishDate + ", CGUState=" + CGUState
				+ ", creditId=" + creditId + ", credit=" + credit + "]";
	}
	
	
	
	
}