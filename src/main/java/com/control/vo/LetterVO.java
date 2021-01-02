package com.control.vo;

import java.sql.Date;

public class LetterVO {
	
	int no;
	String Fromid;
	String Toid;
	String title;
	String text;
	Date signdate;
	String Fromnickname;
	String Tonickname;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFromid() {
		return Fromid;
	}
	public void setFromid(String fromid) {
		Fromid = fromid;
	}
	public String getToid() {
		return Toid;
	}
	public void setToid(String toid) {
		Toid = toid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getFromnickname() {
		return Fromnickname;
	}
	public void setFromnickname(String fromnickname) {
		Fromnickname = fromnickname;
	}
	public String getTonickname() {
		return Tonickname;
	}
	public void setTonickname(String tonickname) {
		Tonickname = tonickname;
	}

}
