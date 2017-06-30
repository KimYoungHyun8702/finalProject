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

public class Professor extends Users implements Serializable {
	
	private String proId;
	private String proUniversity;
	private String proGradSchool;
	private String proOfficePhoneNum;
	private Integer majorId;
	private String proRoomOfficeId;
	private String proRoomLaboratiryId;
	private List<Object> list;
	
	public Professor() {
	}

	public Professor(String proId, String proUniversity, String proGradSchool, String proOfficePhoneNum,
			Integer majorId, String proRoomOfficeId, String proRoomLaboratiryId) {
		this.proId = proId;
		this.proUniversity = proUniversity;
		this.proGradSchool = proGradSchool;
		this.proOfficePhoneNum = proOfficePhoneNum;
		this.majorId = majorId;
		this.proRoomOfficeId = proRoomOfficeId;
		this.proRoomLaboratiryId = proRoomLaboratiryId;
	}

	public Professor(String proId, String proUniversity, String proGradSchool, String proOfficePhoneNum,
			Integer majorId, String proRoomOfficeId, String proRoomLaboratiryId, List<Object> list) {
		this.proId = proId;
		this.proUniversity = proUniversity;
		this.proGradSchool = proGradSchool;
		this.proOfficePhoneNum = proOfficePhoneNum;
		this.majorId = majorId;
		this.proRoomOfficeId = proRoomOfficeId;
		this.proRoomLaboratiryId = proRoomLaboratiryId;
		this.list = list;
	}

	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public String getProUniversity() {
		return proUniversity;
	}

	public void setProUniversity(String proUniversity) {
		this.proUniversity = proUniversity;
	}

	public String getProGradSchool() {
		return proGradSchool;
	}

	public void setProGradSchool(String proGradSchool) {
		this.proGradSchool = proGradSchool;
	}

	public String getProOfficePhoneNum() {
		return proOfficePhoneNum;
	}

	public void setProOfficePhoneNum(String proOfficePhoneNum) {
		this.proOfficePhoneNum = proOfficePhoneNum;
	}

	public Integer getMajorId() {
		return majorId;
	}

	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}

	public String getProRoomOfficeId() {
		return proRoomOfficeId;
	}

	public void setProRoomOfficeId(String proRoomOfficeId) {
		this.proRoomOfficeId = proRoomOfficeId;
	}

	public String getProRoomLaboratiryId() {
		return proRoomLaboratiryId;
	}

	public void setProRoomLaboratiryId(String proRoomLaboratiryId) {
		this.proRoomLaboratiryId = proRoomLaboratiryId;
	}

	public List<Object> getList() {
		return list;
	}

	public void setList(List<Object> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "Professor [proId=" + proId + ", proUniversity=" + proUniversity + ", proGradSchool=" + proGradSchool
				+ ", proOfficePhoneNum=" + proOfficePhoneNum + ", majorId=" + majorId + ", proRoomOfficeId="
				+ proRoomOfficeId + ", proRoomLaboratiryId=" + proRoomLaboratiryId + ", list=" + list + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((list == null) ? 0 : list.hashCode());
		result = prime * result + ((majorId == null) ? 0 : majorId.hashCode());
		result = prime * result + ((proGradSchool == null) ? 0 : proGradSchool.hashCode());
		result = prime * result + ((proId == null) ? 0 : proId.hashCode());
		result = prime * result + ((proOfficePhoneNum == null) ? 0 : proOfficePhoneNum.hashCode());
		result = prime * result + ((proRoomLaboratiryId == null) ? 0 : proRoomLaboratiryId.hashCode());
		result = prime * result + ((proRoomOfficeId == null) ? 0 : proRoomOfficeId.hashCode());
		result = prime * result + ((proUniversity == null) ? 0 : proUniversity.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Professor other = (Professor) obj;
		if (list == null) {
			if (other.list != null)
				return false;
		} else if (!list.equals(other.list))
			return false;
		if (majorId == null) {
			if (other.majorId != null)
				return false;
		} else if (!majorId.equals(other.majorId))
			return false;
		if (proGradSchool == null) {
			if (other.proGradSchool != null)
				return false;
		} else if (!proGradSchool.equals(other.proGradSchool))
			return false;
		if (proId == null) {
			if (other.proId != null)
				return false;
		} else if (!proId.equals(other.proId))
			return false;
		if (proOfficePhoneNum == null) {
			if (other.proOfficePhoneNum != null)
				return false;
		} else if (!proOfficePhoneNum.equals(other.proOfficePhoneNum))
			return false;
		if (proRoomLaboratiryId == null) {
			if (other.proRoomLaboratiryId != null)
				return false;
		} else if (!proRoomLaboratiryId.equals(other.proRoomLaboratiryId))
			return false;
		if (proRoomOfficeId == null) {
			if (other.proRoomOfficeId != null)
				return false;
		} else if (!proRoomOfficeId.equals(other.proRoomOfficeId))
			return false;
		if (proUniversity == null) {
			if (other.proUniversity != null)
				return false;
		} else if (!proUniversity.equals(other.proUniversity))
			return false;
		return true;
	}
}