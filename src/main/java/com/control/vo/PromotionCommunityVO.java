package com.control.vo;

import java.sql.Date;

public class PromotionCommunityVO {
	
	int no;
	
	String id;
	String nickname;
	String title;
	String text;
	Date signdate;
	int likenum;
	int dislikenum;
	int views;
	int total_record;
	
	String sumnail;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	public int getDislikenum() {
		return dislikenum;
	}
	public void setDislikenum(int dislikenum) {
		this.dislikenum = dislikenum;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getTotal_record() {
		return total_record;
	}
	public void setTotal_record(int total_record) {
		this.total_record = total_record;
	}
	public String getSumnail() {
		return sumnail;
	}
	public void setSumnail(String sumnail) {
		this.sumnail = sumnail;
	}
	
}
