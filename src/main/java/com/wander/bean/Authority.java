package com.wander.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="AUTHORITIES")
public class Authority {
	@Id
	private String username;
	private String authority;
	public Authority() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Authority(String username, String authority) {
		super();
		this.username = username;
		this.authority = authority;
	}
	@Override
	public String toString() {
		return "Authority [username=" + username + ", authority=" + authority + "]";
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	

}
