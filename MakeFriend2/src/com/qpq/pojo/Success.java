package com.qpq.pojo;

import java.sql.Date;

public class Success {
	private int sid;
	private int uid;
	private String content;
	private Date ptime;
	private int likecount;
	private String img;
	private User user;
	public Success(int sid, int uid, String content, Date ptime, int likecount, String img, User user) {
		super();
		this.sid = sid;
		this.uid = uid;
		this.content = content;
		this.ptime = ptime;
		this.likecount = likecount;
		this.img = img;
		this.user = user;
	}
	@Override
	public String toString() {
		return "Success [sid=" + sid + ", uid=" + uid + ", content=" + content + ", ptime=" + ptime + ", likecount="
				+ likecount + ", img=" + img + ", user=" + user + "]";
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPtime() {
		return ptime;
	}
	public void setPtime(Date ptime) {
		this.ptime = ptime;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Success() {
		super();
	}
	
}
