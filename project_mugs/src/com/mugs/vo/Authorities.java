package com.mugs.vo;

import java.io.Serializable;

public class Authorities implements Serializable {
	
	private String usersId;
	private String authoritiesRole;
	
	public Authorities() {
		super();
	}

	public Authorities(String usersId, String authoritiesRole) {
		super();
		this.usersId = usersId;
		this.authoritiesRole = authoritiesRole;
	}
	
	public String getUsersId() {
		return usersId;
	}
	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}
	public String getAuthoritiesRole() {
		return authoritiesRole;
	}
	public void setAuthoritiesRole(String authoritiesRole) {
		this.authoritiesRole = authoritiesRole;
	}
	
	@Override
	public String toString() {
		return "Authorities [usersId=" + usersId + ", authoritiesRole=" + authoritiesRole + "]";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((authoritiesRole == null) ? 0 : authoritiesRole.hashCode());
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
		Authorities other = (Authorities) obj;
		if (authoritiesRole == null) {
			if (other.authoritiesRole != null)
				return false;
		} else if (!authoritiesRole.equals(other.authoritiesRole))
			return false;
		if (usersId == null) {
			if (other.usersId != null)
				return false;
		} else if (!usersId.equals(other.usersId))
			return false;
		return true;
	}
}