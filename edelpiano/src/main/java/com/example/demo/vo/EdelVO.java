package com.example.demo.vo;

public class EdelVO 
{
	private int num;
	private String id;
	private String pwd;
	private String phone;
	private String email;
	
	public EdelVO() {}
	
	public EdelVO(int num, String id, String pwd, String phone, String email) {
		super();
		this.num = num;
		this.id = id;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
