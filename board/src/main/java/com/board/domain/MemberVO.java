package com.board.domain;

import java.util.Date;

public class MemberVO {

	/*
	 * userId VARCHAR(30) NOT NULL,
	 * userPass VARCHAR(100) NOT NULL,
	 * userName VARCHAR(30) NOT NULL,
	 * regDate DATE DEFAULT SYSDATE()
	 */

	private String userId;
	private String userpass;
	private String username;
	private Date regDate;

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}
