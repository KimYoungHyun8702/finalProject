package com.mugs.vo;

import java.io.Serializable;
import java.util.Date;

public class AcademicCalendar implements Serializable {


	private int calendarId;
	private Date calendarStart;
	private Date calendarFinish;
	private int calendarYear;
	private String calendarName;

	public AcademicCalendar() {
	}

	public AcademicCalendar(int calendarId, Date calendarStart, Date calendarFinish, int calendarYear,
			String calendarName) {
		super();
		this.calendarId = calendarId;
		this.calendarStart = calendarStart;
		this.calendarFinish = calendarFinish;
		this.calendarYear = calendarYear;
		this.calendarName = calendarName;
	}

	public int getCalendarId() {
		return calendarId;
	}

	public void setCalendarId(int calendarId) {
		this.calendarId = calendarId;
	}

	public Date getCalendarStart() {
		return calendarStart;
	}

	public void setCalendarStart(Date calendarStart) {
		this.calendarStart = calendarStart;
	}

	public Date getCalendarFinish() {
		return calendarFinish;
	}

	public void setCalendarFinish(Date calendarFinish) {
		this.calendarFinish = calendarFinish;
	}

	public int getCalendarYear() {
		return calendarYear;
	}

	public void setCalendarYear(int calendarYear) {
		this.calendarYear = calendarYear;
	}

	public String getCalendarName() {
		return calendarName;
	}

	public void setCalendarName(String calendarName) {
		this.calendarName = calendarName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((calendarFinish == null) ? 0 : calendarFinish.hashCode());
		result = prime * result + calendarId;
		result = prime * result + ((calendarName == null) ? 0 : calendarName.hashCode());
		result = prime * result + ((calendarStart == null) ? 0 : calendarStart.hashCode());
		result = prime * result + calendarYear;
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
		AcademicCalendar other = (AcademicCalendar) obj;
		if (calendarFinish == null) {
			if (other.calendarFinish != null)
				return false;
		} else if (!calendarFinish.equals(other.calendarFinish))
			return false;
		if (calendarId != other.calendarId)
			return false;
		if (calendarName == null) {
			if (other.calendarName != null)
				return false;
		} else if (!calendarName.equals(other.calendarName))
			return false;
		if (calendarStart == null) {
			if (other.calendarStart != null)
				return false;
		} else if (!calendarStart.equals(other.calendarStart))
			return false;
		if (calendarYear != other.calendarYear)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "AcademicCalendar [calendarId=" + calendarId + ", calendarStart=" + calendarStart + ", calendarFinish="
				+ calendarFinish + ", calendarYear=" + calendarYear + ", calendarName=" + calendarName + "]";
	}

}
