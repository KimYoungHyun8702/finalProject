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

public class Notice implements Serializable {
	
	private int noticeId;
	private String noticeContent;
	private Date noticeDate;
	private String usersId;
	
	public Notice() {
	}

	public Notice(int noticeId, String noticeContent, Date noticeDate, String usersId) {
		this.noticeId = noticeId;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.usersId = usersId;
	}

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}

	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate
				+ ", usersId=" + usersId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((noticeContent == null) ? 0 : noticeContent.hashCode());
		result = prime * result + ((noticeDate == null) ? 0 : noticeDate.hashCode());
		result = prime * result + noticeId;
		result = prime * result + ((usersId == null) ? 0 : usersId.hashCode());
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
		Notice other = (Notice) obj;
		if (noticeContent == null) {
			if (other.noticeContent != null)
				return false;
		} else if (!noticeContent.equals(other.noticeContent))
			return false;
		if (noticeDate == null) {
			if (other.noticeDate != null)
				return false;
		} else if (!noticeDate.equals(other.noticeDate))
			return false;
		if (noticeId != other.noticeId)
			return false;
		if (usersId == null) {
			if (other.usersId != null)
				return false;
		} else if (!usersId.equals(other.usersId))
			return false;
		return true;
	}
}