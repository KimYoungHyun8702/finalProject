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

public class Building implements Serializable {
	
	private int buildingId;
	private String buildingName;
	private String buildingURL;
	
	private List<Room> roomList;

	public Building() {
	}

	public Building(int buildingId, String buildingName, String buildingURL) {
		this.buildingId = buildingId;
		this.buildingName = buildingName;
		this.buildingURL = buildingURL;
	}

	public Building(int buildingId, String buildingName, String buildingURL, List<Room> roomList) {
		this.buildingId = buildingId;
		this.buildingName = buildingName;
		this.buildingURL = buildingURL;
		this.roomList = roomList;
	}

	public int getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(int buildingId) {
		this.buildingId = buildingId;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public String getBuildingURL() {
		return buildingURL;
	}

	public void setBuildingURL(String buildingURL) {
		this.buildingURL = buildingURL;
	}

	public List<Room> getRoomList() {
		return roomList;
	}

	public void setRoomList(List<Room> roomList) {
		this.roomList = roomList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + buildingId;
		result = prime * result + ((buildingName == null) ? 0 : buildingName.hashCode());
		result = prime * result + ((buildingURL == null) ? 0 : buildingURL.hashCode());
		result = prime * result + ((roomList == null) ? 0 : roomList.hashCode());
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
		Building other = (Building) obj;
		if (buildingId != other.buildingId)
			return false;
		if (buildingName == null) {
			if (other.buildingName != null)
				return false;
		} else if (!buildingName.equals(other.buildingName))
			return false;
		if (buildingURL == null) {
			if (other.buildingURL != null)
				return false;
		} else if (!buildingURL.equals(other.buildingURL))
			return false;
		if (roomList == null) {
			if (other.roomList != null)
				return false;
		} else if (!roomList.equals(other.roomList))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Building [buildingId=" + buildingId + ", buildingName=" + buildingName + ", buildingURL=" + buildingURL
				+ ", roomList=" + roomList + "]";
	}

}