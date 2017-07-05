package com.mugs.vo;

import java.io.Serializable;
import java.util.Date;

public class AcademicCalendar implements Serializable {
	
	private int calendarId;
	private Date calendarStart;
	private Date calendarFinsh;
	private int calendarYear;
	private String calendarName;
	
	public AcademicCalendar() {
	}

	public AcademicCalendar(int calendarId, Date calendarStart, Date calendarFinsh, int calendarYear,
			String calendarName) {
		this.calendarId = calendarId;
		this.calendarStart = calendarStart;
		this.calendarFinsh = calendarFinsh;
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

	public Date getCalendarFinsh() {
		return calendarFinsh;
	}

	public void setCalendarFinsh(Date calendarFinsh) {
		this.calendarFinsh = calendarFinsh;
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
	public String toString() {
		return "AcademicCalendar [calendarId=" + calendarId + ", calendarStart=" + calendarStart + ", calendarFinsh="
				+ calendarFinsh + ", calendarYear=" + calendarYear + ", calendarName=" + calendarName + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((calendarFinsh == null) ? 0 : calendarFinsh.hashCode());
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
		if (calendarFinsh == null) {
			if (other.calendarFinsh != null)
				return false;
		} else if (!calendarFinsh.equals(other.calendarFinsh))
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
}
