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
   private String majorName;
   private Integer proRoomOfficeId;
   private String officeName;
   private Integer proRoomLaboratoryId;
   private String laboratoryName;
   private String buildingName;
   private List<Object> list;
   
   public Professor() {
   }

   public Professor(String proId, String proUniversity, String proGradSchool, String proOfficePhoneNum,
		String proLaboratoryPhoneNum, Integer majorId, Integer proRoomOfficeId, Integer proRoomLaboratoryId) {
	this.proId = proId;
	this.proUniversity = proUniversity;
	this.proGradSchool = proGradSchool;
	this.proOfficePhoneNum = proOfficePhoneNum;
	this.proLaboratoryPhoneNum = proLaboratoryPhoneNum;
	this.majorId = majorId;
	this.proRoomOfficeId = proRoomOfficeId;
	this.proRoomLaboratoryId = proRoomLaboratoryId;
   }

   public Professor(String proId, String proUniversity, String proGradSchool, String proOfficePhoneNum,
		String proLaboratoryPhoneNum, Integer majorId, String majorName, Integer proRoomOfficeId, String officeName,
		Integer proRoomLaboratoryId, String laboratoryName, String buildingName, List<Object> list) {
	this.proId = proId;
	this.proUniversity = proUniversity;
	this.proGradSchool = proGradSchool;
	this.proOfficePhoneNum = proOfficePhoneNum;
	this.proLaboratoryPhoneNum = proLaboratoryPhoneNum;
	this.majorId = majorId;
	this.majorName = majorName;
	this.proRoomOfficeId = proRoomOfficeId;
	this.officeName = officeName;
	this.proRoomLaboratoryId = proRoomLaboratoryId;
	this.laboratoryName = laboratoryName;
	this.buildingName = buildingName;
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

public String getMajorName() {
	return majorName;
}

public void setMajorName(String majorName) {
	this.majorName = majorName;
}

public Integer getProRoomOfficeId() {
	return proRoomOfficeId;
}

public void setProRoomOfficeId(Integer proRoomOfficeId) {
	this.proRoomOfficeId = proRoomOfficeId;
}

public String getOfficeName() {
	return officeName;
}

public void setOfficeName(String officeName) {
	this.officeName = officeName;
}

public Integer getProRoomLaboratoryId() {
	return proRoomLaboratoryId;
}

public void setProRoomLaboratoryId(Integer proRoomLaboratoryId) {
	this.proRoomLaboratoryId = proRoomLaboratoryId;
}

public String getLaboratoryName() {
	return laboratoryName;
}

public void setLaboratoryName(String laboratoryName) {
	this.laboratoryName = laboratoryName;
}

public String getBuildingName() {
	return buildingName;
}

public void setBuildingName(String buildingName) {
	this.buildingName = buildingName;
}

public List<Object> getList() {
	return list;
}

public void setList(List<Object> list) {
	this.list = list;
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = super.hashCode();
	result = prime * result + ((buildingName == null) ? 0 : buildingName.hashCode());
	result = prime * result + ((laboratoryName == null) ? 0 : laboratoryName.hashCode());
	result = prime * result + ((list == null) ? 0 : list.hashCode());
	result = prime * result + ((majorId == null) ? 0 : majorId.hashCode());
	result = prime * result + ((majorName == null) ? 0 : majorName.hashCode());
	result = prime * result + ((officeName == null) ? 0 : officeName.hashCode());
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
	if (buildingName == null) {
		if (other.buildingName != null)
			return false;
	} else if (!buildingName.equals(other.buildingName))
		return false;
	if (laboratoryName == null) {
		if (other.laboratoryName != null)
			return false;
	} else if (!laboratoryName.equals(other.laboratoryName))
		return false;
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
	if (majorName == null) {
		if (other.majorName != null)
			return false;
	} else if (!majorName.equals(other.majorName))
		return false;
	if (officeName == null) {
		if (other.officeName != null)
			return false;
	} else if (!officeName.equals(other.officeName))
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

@Override
public String toString() {
	return "Professor [proId=" + proId + ", proUniversity=" + proUniversity + ", proGradSchool=" + proGradSchool
			+ ", proOfficePhoneNum=" + proOfficePhoneNum + ", proLaboratoryPhoneNum=" + proLaboratoryPhoneNum
			+ ", majorId=" + majorId + ", majorName=" + majorName + ", proRoomOfficeId=" + proRoomOfficeId
			+ ", officeName=" + officeName + ", proRoomLaboratoryId=" + proRoomLaboratoryId + ", laboratoryName="
			+ laboratoryName + ", buildingName=" + buildingName + ", list=" + list + "]";
}
   
   
   
  
}