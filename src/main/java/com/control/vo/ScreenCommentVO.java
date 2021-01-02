package com.control.vo;

import java.sql.Date;

public class ScreenCommentVO {
	
	int no;
	String Screenno;
	String id;
	String nickname;
	String text;
	Date signdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getScreenno() {
		return Screenno;
	}
	public void setScreenno(String screenno) {
		Screenno = screenno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getSigndate() {
		return signdate;
	}
	public void setSigndate(Date signdate) {
		this.signdate = signdate;
	}

}
