package com.example.demo.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class EdelVideoVO2 
{
	private int video_num;
	private String video_name;
	private String mv_the_origin_url;
	private Date date;
	
	public EdelVideoVO2() {}

	public EdelVideoVO2(int video_num, String video_name, String mv_the_origin_url, Date date) {
		super();
		this.video_num = video_num;
		this.video_name = video_name;
		this.mv_the_origin_url = mv_the_origin_url;
		this.date = date;
	}

	public int getVideo_num() {
		return video_num;
	}

	public void setVideo_num(int video_num) {
		this.video_num = video_num;
	}

	public String getVideo_name() {
		return video_name;
	}

	public void setVideo_name(String video_name) {
		this.video_name = video_name;
	}

	public String getMv_the_origin_url() {
		return mv_the_origin_url;
	}

	public void setMv_the_origin_url(String mv_the_origin_url) {
		this.mv_the_origin_url = mv_the_origin_url;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
