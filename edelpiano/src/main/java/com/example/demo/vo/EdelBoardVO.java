package com.example.demo.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class EdelBoardVO 
{
	private int num;
	private String title;
	private String name;
	private int hit;
	private String content;
	private String pwd;
	private Date date;
	
	public EdelBoardVO() {}
	
	public EdelBoardVO(int num, String title, String name, int hit, String content, String pwd, Date date) {
		super();
		this.num = num;
		this.title = title;
		this.name = name;
		this.hit = hit;
		this.content = content;
		this.pwd = pwd;
		this.date = date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	
	
}
