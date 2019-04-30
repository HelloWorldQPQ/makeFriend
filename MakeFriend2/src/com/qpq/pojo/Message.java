package com.qpq.pojo;

import java.util.Date;

public class Message {
	
	private int uid;
	private String context;
	private Date date;
	private User user;
	public Message() {
	}
	
	
	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Message(int uid, String context, Date date, User user) {
		super();
		this.uid = uid;
		this.context = context;
		this.date = date;
		this.user = user;
	}


	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "Message [uid=" + uid + ", context=" + context + ", date=" + date + "]";
	}
	
}
