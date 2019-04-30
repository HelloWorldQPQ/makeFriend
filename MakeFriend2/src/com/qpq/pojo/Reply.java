package com.qpq.pojo;

import java.sql.Date;

public class Reply {
	private int rid ;
	private int uid;
	private int did;
	private Date gettime;
	private String content;
	private User user; 
	private Dynamic dynamic;
	private int likenum;
	
	
	public Dynamic getDynamic() {
		return dynamic;
	}
	public void setDynamic(Dynamic dynamic) {
		this.dynamic = dynamic;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
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
	public Reply() {
		super();
	}
	@Override
	public String toString() {
		return "Reply [rid=" + rid + ", uid=" + uid + ", gettime=" + gettime + ", content=" + content + ", likenum="
				+ likenum + "]";
	}
	
	
}
