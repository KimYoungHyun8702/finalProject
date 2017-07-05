/**
 * 
 */
/**
 * @author Administrator
 *
 */
package com.mugs.vo;

import java.io.Serializable;
import java.util.List;

public class Users implements Serializable {
	
	private String usersId;
	private String usersPassword;
	private String usersName;
	private String usersEngName;
	private String usersRRN;
	private String usersEmail;
	private String usersPhoneNum;
	private String usersCellNum;
	private String usersNational;
	private String usersCurrentAddr;
	private String usersBornAddr;
	private int usersEnable;
	private String usersPhoto;
	private List<Notice> noticeList;
	
	public Users() {
		super();
	}

	public Users(String usersId, String usersPassword, String usersName, String usersEngName, String usersRRN,
			String usersEmail, String usersPhoneNum, String usersCellNum, String usersNational, String usersCurrentAddr,
			String usersBornAddr, int usersEnable, String usersPhoto) {
		super();
		this.usersId = usersId;
		this.usersPassword = usersPassword;
		this.usersName = usersName;
		this.usersEngName = usersEngName;
		this.usersRRN = usersRRN;
		this.usersEmail = usersEmail;
		this.usersPhoneNum = usersPhoneNum;
		this.usersCellNum = usersCellNum;
		this.usersNational = usersNational;
		this.usersCurrentAddr = usersCurrentAddr;
		this.usersBornAddr = usersBornAddr;
		this.usersEnable = usersEnable;
		this.usersPhoto = usersPhoto;
	}

	public Users(String usersId, String usersPassword, String usersName, String usersEngName, String usersRRN,
			String usersEmail, String usersPhoneNum, String usersCellNum, String usersNational, String usersCurrentAddr,
			String usersBornAddr, int usersEnable, String usersPhoto, List<Notice> noticeList) {
		super();
		this.usersId = usersId;
		this.usersPassword = usersPassword;
		this.usersName = usersName;
		this.usersEngName = usersEngName;
		this.usersRRN = usersRRN;
		this.usersEmail = usersEmail;
		this.usersPhoneNum = usersPhoneNum;
		this.usersCellNum = usersCellNum;
		this.usersNational = usersNational;
		this.usersCurrentAddr = usersCurrentAddr;
		this.usersBornAddr = usersBornAddr;
		this.usersEnable = usersEnable;
		this.usersPhoto = usersPhoto;
		this.noticeList = noticeList;
	}

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}

	public String getUsersPassword() {
		return usersPassword;
	}

	public void setUsersPassword(String usersPassword) {
		this.usersPassword = usersPassword;
	}

	public String getUsersName() {
		return usersName;
	}

	public void setUsersName(String usersName) {
		this.usersName = usersName;
	}

	public String getUsersEngName() {
		return usersEngName;
	}

	public void setUsersEngName(String usersEngName) {
		this.usersEngName = usersEngName;
	}

	public String getUsersRRN() {
		return usersRRN;
	}

	public void setUsersRRN(String usersRRN) {
		this.usersRRN = usersRRN;
	}

	public String getUsersEmail() {
		return usersEmail;
	}

	public void setUsersEmail(String usersEmail) {
		this.usersEmail = usersEmail;
	}

	public String getUsersPhoneNum() {
		return usersPhoneNum;
	}

	public void setUsersPhoneNum(String usersPhoneNum) {
		this.usersPhoneNum = usersPhoneNum;
	}

	public String getUsersCellNum() {
		return usersCellNum;
	}

	public void setUsersCellNum(String usersCellNum) {
		this.usersCellNum = usersCellNum;
	}

	public String getUsersNational() {
		return usersNational;
	}

	public void setUsersNational(String usersNational) {
		this.usersNational = usersNational;
	}

	public String getUsersCurrentAddr() {
		return usersCurrentAddr;
	}

	public void setUsersCurrentAddr(String usersCurrentAddr) {
		this.usersCurrentAddr = usersCurrentAddr;
	}

	public String getUsersBornAddr() {
		return usersBornAddr;
	}

	public void setUsersBornAddr(String usersBornAddr) {
		this.usersBornAddr = usersBornAddr;
	}

	public int getUsersEnable() {
		return usersEnable;
	}

	public void setUsersEnable(int usersEnable) {
		this.usersEnable = usersEnable;
	}

	public String getUsersPhoto() {
		return usersPhoto;
	}

	public void setUsersPhoto(String usersPhoto) {
		this.usersPhoto = usersPhoto;
	}

	public List<Notice> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(List<Notice> noticeList) {
		this.noticeList = noticeList;
	}

	@Override
	public String toString() {
		return "Users [usersId=" + usersId + ", usersPassword=" + usersPassword + ", usersName=" + usersName
				+ ", usersEngName=" + usersEngName + ", usersRRN=" + usersRRN + ", usersEmail=" + usersEmail
				+ ", usersPhoneNum=" + usersPhoneNum + ", usersCellNum=" + usersCellNum + ", usersNational="
				+ usersNational + ", usersCurrentAddr=" + usersCurrentAddr + ", usersBornAddr=" + usersBornAddr
				+ ", usersEnable=" + usersEnable + ", usersPhoto=" + usersPhoto + ", noticeList=" + noticeList + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((noticeList == null) ? 0 : noticeList.hashCode());
		result = prime * result + ((usersBornAddr == null) ? 0 : usersBornAddr.hashCode());
		result = prime * result + ((usersCellNum == null) ? 0 : usersCellNum.hashCode());
		result = prime * result + ((usersCurrentAddr == null) ? 0 : usersCurrentAddr.hashCode());
		result = prime * result + ((usersEmail == null) ? 0 : usersEmail.hashCode());
		result = prime * result + usersEnable;
		result = prime * result + ((usersEngName == null) ? 0 : usersEngName.hashCode());
		result = prime * result + ((usersId == null) ? 0 : usersId.hashCode());
		result = prime * result + ((usersName == null) ? 0 : usersName.hashCode());
		result = prime * result + ((usersNational == null) ? 0 : usersNational.hashCode());
		result = prime * result + ((usersPassword == null) ? 0 : usersPassword.hashCode());
		result = prime * result + ((usersPhoneNum == null) ? 0 : usersPhoneNum.hashCode());
		result = prime * result + ((usersPhoto == null) ? 0 : usersPhoto.hashCode());
		result = prime * result + ((usersRRN == null) ? 0 : usersRRN.hashCode());
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
		Users other = (Users) obj;
		if (noticeList == null) {
			if (other.noticeList != null)
				return false;
		} else if (!noticeList.equals(other.noticeList))
			return false;
		if (usersBornAddr == null) {
			if (other.usersBornAddr != null)
				return false;
		} else if (!usersBornAddr.equals(other.usersBornAddr))
			return false;
		if (usersCellNum == null) {
			if (other.usersCellNum != null)
				return false;
		} else if (!usersCellNum.equals(other.usersCellNum))
			return false;
		if (usersCurrentAddr == null) {
			if (other.usersCurrentAddr != null)
				return false;
		} else if (!usersCurrentAddr.equals(other.usersCurrentAddr))
			return false;
		if (usersEmail == null) {
			if (other.usersEmail != null)
				return false;
		} else if (!usersEmail.equals(other.usersEmail))
			return false;
		if (usersEnable != other.usersEnable)
			return false;
		if (usersEngName == null) {
			if (other.usersEngName != null)
				return false;
		} else if (!usersEngName.equals(other.usersEngName))
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
		if (usersNational == null) {
			if (other.usersNational != null)
				return false;
		} else if (!usersNational.equals(other.usersNational))
			return false;
		if (usersPassword == null) {
			if (other.usersPassword != null)
				return false;
		} else if (!usersPassword.equals(other.usersPassword))
			return false;
		if (usersPhoneNum == null) {
			if (other.usersPhoneNum != null)
				return false;
		} else if (!usersPhoneNum.equals(other.usersPhoneNum))
			return false;
		if (usersPhoto == null) {
			if (other.usersPhoto != null)
				return false;
		} else if (!usersPhoto.equals(other.usersPhoto))
			return false;
		if (usersRRN == null) {
			if (other.usersRRN != null)
				return false;
		} else if (!usersRRN.equals(other.usersRRN))
			return false;
		return true;
	}


	
}