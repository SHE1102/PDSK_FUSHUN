package com.pdsk.domain;

public class Email {
	private String subjectemail;// 邮件主题
	private double mailcontent;// 邮件内容
	private String addresser;// 发件人邮箱账号
	private String password;// 发件人邮箱密码
	private String smtp;// SMTP协议 //smtp.exmail.qq.com
	private int port;// 端口 //25
	private String state;// 状态
	private int id;
	private double threshold;

	
	
	public double getThreshold() {
		return threshold;
	}

	public void setThreshold(double threshold) {
		this.threshold = threshold;
	}

	public String getSubjectemail() {
		return subjectemail;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setSubjectemail(String subjectemail) {
		this.subjectemail = subjectemail;
	}

	public double getMailcontent() {
		return mailcontent;
	}

	public void setMailcontent(double mailcontent) {
		this.mailcontent = mailcontent;
	}

	public String getAddresser() {
		return addresser;
	}

	public void setAddresser(String addresser) {
		this.addresser = addresser;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSmtp() {
		return smtp;
	}

	public void setSmtp(String smtp) {
		this.smtp = smtp;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
