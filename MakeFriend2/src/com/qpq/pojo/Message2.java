package com.qpq.pojo;

import java.util.Date;

public class Message2 {
	
	private int id;
	private int sendId;
	private int recId;
	private String context;
	private int status;
	private Date create_date;
	private User sendUser;
	
	public Message2() {
		
	}
	
	
	
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public int getSendId() {
		return sendId;
	}
	public void setSendId(int sendId) {
		this.sendId = sendId;
	}
	public int getRecId() {
		return recId;
	}
	public void setRecId(int recId) {
		this.recId = recId;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public User getSendUser() {
		return sendUser;
	}



	public void setSendUser(User sendUser) {
		this.sendUser = sendUser;
	}



	@Override
	public String toString() {
		return "messge2 [sendId=" + sendId + ", recId=" + recId + ", context=" + context + ", status=" + status + "]";
	}
	
	
	
	

}
