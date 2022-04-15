package com.example.demo.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class EdelOrderVO 
{
	private int num;
	private String name;
	private String detail;
	private int price;
	private int total;
	private Date orddate;
	private String file;
	private String thumbnail;
	
	public EdelOrderVO() {}

	public EdelOrderVO(String thumbnail, String file, int num, String name, String detail, int price, int total, Date orddate) {
		super();
		this.num = num;
		this.name = name;
		this.detail = detail;
		this.price = price;
		this.total = total;
		this.orddate = orddate;
		this.file = file;
	}

	
	
	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Date getOrddate() {
		return orddate;
	}

	public void setOrddate(Date orddate) {
		this.orddate = orddate;
	}

	
}
