package com.control.vo;

import java.sql.Date;

public class FreeCommentVO {
	
	int no;
	String Freeno;
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
	public String getFreeno() {
		return Freeno;
	}
	public void setFreeno(String freeno) {
		Freeno = freeno;
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
