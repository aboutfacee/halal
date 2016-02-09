package com.bean;
 
public class UserInfoBean {
	public UserInfoBean(){}
	 
	//private String login_id;
	private String pwd;
	private String name;
	private String userId;
	
	/*
	private String ss_usr_name;
	private String ss_company;
	private String ss_fax;
	private String ss_phone;
	private String ss_email;
	private String ss_mailyn;
	private String ss_admin_comment;
	private String ss_enterdate;
	*/
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
