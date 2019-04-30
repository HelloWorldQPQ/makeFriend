package com.qpq.pojo;

import java.sql.Date;

public class Dynamic {
	private User user;
	private int did;
	private int uid;
	private Date gettime;
	private String content;
	private int likenum;
	public Dynamic(int did, int uid, Date gettime, String content, int likenum,User user) {
		super();
		this.did = did;
		this.uid = uid;
		this.gettime = gettime;
		this.content = content;
		this.likenum = likenum;
		this.user = user;
	}
	public Dynamic() {
		super();
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Date getGettime() {
		return gettime;
	}
	public void setGettime(Date gettime) {
		this.gettime = gettime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	@Override
	public String toString() {
		return "Dynamic [did=" + did + ", uid=" + uid + ", gettime=" + gettime + ", content=" + content + ", likenum="
				+ likenum + "]";
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
