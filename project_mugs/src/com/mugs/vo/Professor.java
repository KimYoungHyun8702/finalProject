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
	private String proLaboratoryPhoneNum;
	private Integer majorId;
	private String proRoomOfficeId;
	private String proRoomLaboratoryId;
	private List<Object> list;
	
	
	
	public Professor(String proId, String proUniversity, String proGradSchool, String proOfficePhoneNum) {
		super();
		this.proId = proId;
		this.proUniversity = proUniversity;
		this.proGradSchool = proGradSchool;
		this.proOfficePhoneNum = proOfficePhoneNum;
	}

	public Professor(){
		super();
	}

	public Professor(String proId, String proUniversity, String proGradSchool, String proOfficePhoneNum,
			String proLaboratoryPhoneNum, Integer majorId, String proRoomOfficeId, String proRoomLaboratoryId,
			List<Object> list) {
		super();
		this.proId = proId;
		this.proUniversity = proUniversity;
		this.proGradSchool = proGradSchool;
		this.proOfficePhoneNum = proOfficePhoneNum;
		this.proLaboratoryPhoneNum = proLaboratoryPhoneNum;
		this.majorId = majorId;
		this.proRoomOfficeId = proRoomOfficeId;
		this.proRoomLaboratoryId = proRoomLaboratoryId;
		this.list = list;
	}

	public Professor(String proId, String proUniversity, String proGradSchool, String proOfficePhoneNum,
			String proLaboratoryPhoneNum, Integer majorId, String proRoomOfficeId, String proRoomLaboratoryId) {
		super();
		this.proId = proId;
		this.proUniversity = proUniversity;
		this.proGradSchool = proGradSchool;
		this.proOfficePhoneNum = proOfficePhoneNum;
		this.proLaboratoryPhoneNum = proLaboratoryPhoneNum;
		this.majorId = majorId;
		this.proRoomOfficeId = proRoomOfficeId;
		this.proRoomLaboratoryId = proRoomLaboratoryId;
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

	public String getProLaboratoryPhoneNum() {
		return proLaboratoryPhoneNum;
	}

	public void setProLaboratoryPhoneNum(String proLaboratoryPhoneNum) {
		this.proLaboratoryPhoneNum = proLaboratoryPhoneNum;
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

	public String getProRoomLaboratoryId() {
		return proRoomLaboratoryId;
	}

	public void setProRoomLaboratoryId(String proRoomLaboratoryId) {
		this.proRoomLaboratoryId = proRoomLaboratoryId;
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
				+ ", proOfficePhoneNum=" + proOfficePhoneNum + ", proLaboratoryPhoneNum=" + proLaboratoryPhoneNum
				+ ", majorId=" + majorId + ", proRoomOfficeId=" + proRoomOfficeId + ", proRoomLaboratoryId="
				+ proRoomLaboratoryId + ", list=" + list + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((list == null) ? 0 : list.hashCode());
		result = prime * result + ((majorId == null) ? 0 : majorId.hashCode());
		result = prime * result + ((proGradSchool == null) ? 0 : proGradSchool.hashCode());
		result = prime * result + ((proId == null) ? 0 : proId.hashCode());
		result = prime * result + ((proLaboratoryPhoneNum == null) ? 0 : proLaboratoryPhoneNum.hashCode());
		result = prime * result + ((proOfficePhoneNum == null) ? 0 : proOfficePhoneNum.hashCode());
		result = prime * result + ((proRoomLaboratoryId == null) ? 0 : proRoomLaboratoryId.hashCode());
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
		if (proLaboratoryPhoneNum == null) {
			if (other.proLaboratoryPhoneNum != null)
				return false;
		} else if (!proLaboratoryPhoneNum.equals(other.proLaboratoryPhoneNum))
			return false;
		if (proOfficePhoneNum == null) {
			if (other.proOfficePhoneNum != null)
				return false;
		} else if (!proOfficePhoneNum.equals(other.proOfficePhoneNum))
			return false;
		if (proRoomLaboratoryId == null) {
			if (other.proRoomLaboratoryId != null)
				return false;
		} else if (!proRoomLaboratoryId.equals(other.proRoomLaboratoryId))
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