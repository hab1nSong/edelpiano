package com.example.demo.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class EdelNoticeVO 
{
	private int num;
	private String title;
	private String name;
	private String content;
	private int hit;
	private Date date;
	private String nj_url;
	private int offset;
	
	public EdelNoticeVO() {}

	public EdelNoticeVO(int num, String title, String name, String content, int hit, Date date, String nj_url, int offset) {
		super();
		this.num = num;
		this.title = title;
		this.name = name;
		this.content = content;
		this.hit = hit;
		this.date = date;
		this.nj_url = nj_url;
		this.offset = offset;
	}
	
	
	
	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getNj_url() {
		return nj_url;
	}

	public void setNj_url(String nj_url) {
		this.nj_url = nj_url;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
