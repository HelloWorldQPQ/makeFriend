package com.qpq.pojo;

import java.util.Date;

/**
 *  对应数据库的Users表
 */
public class User {
	private int  id;
	private String  username;
	private String  loginName;
	private String  password;
	private int  age;
	private String  sex;
	private Date  birthday;
	private String  email;
	private String card;//身份证
	private String phone;
	private String job;
	private String salary;//工资
	private String marriage;//婚姻
	private String introduction;//个人说明
	private double height;
	private int weight;
	private String address;//地址
	private String education;//教育程度
	private int state;//0是没有被举报，1是被举报
	private String userImg;//个人图片
	
	
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}


	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", loginName=" + loginName + ", password=" + password
				+ ", age=" + age + ", sex=" + sex + ", birthday=" + birthday + ", email=" + email + ", card=" + card
				+ ", phone=" + phone + ", job=" + job + ", salary=" + salary + ", marriage=" + marriage
				+ ", introduction=" + introduction + ", height=" + height + ", weight=" + weight + ", address="
				+ address + ", education=" + education + ", state=" + state + ", userImg=" + userImg + "]";
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public String getMarriage() {
		return marriage;
	}
	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}
	
	
	
	
	
	
}
