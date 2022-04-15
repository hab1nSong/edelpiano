package com.example.demo.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class EdelReplyNoVO 
{
	private int reply_num;
	private int num;
	private String reply_name;
	private String content;
	private Date date;
	
	public EdelReplyNoVO() {}

	public EdelReplyNoVO(int reply_num, int num, String reply_name, String content, Date date) {
		super();
		this.reply_num = reply_num;
		this.num = num;
		this.reply_name = reply_name;
		this.content = content;
		this.date = date;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getReply_name() {
		return reply_name;
	}

	public void setReply_name(String reply_name) {
		this.reply_name = reply_name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
