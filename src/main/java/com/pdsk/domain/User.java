package com.pdsk.domain;

public class User {
	private String id;
	private String name;
	private String password;
	private String permissions = "0";// 权限
	private String realname;// 真实姓名
	private String phone;// 手号
	private String mail;// 邮箱
	private String status;// 状态

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPermissions() {
		return permissions;
	}

	public void setPermissions(String permissions) {
		this.permissions = permissions;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public User() {

	}

	public User(String id, String name, String password, String permissions, String realname, String phone) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.permissions = permissions;
		realname = realname;
		this.phone = phone;
	}

}
