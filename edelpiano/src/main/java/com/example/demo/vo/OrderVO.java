package com.example.demo.vo;

import org.springframework.stereotype.Component;

@Component
public class OrderVO {
	
	private int num;
	private String uid;
	private int no;
	private int price;
	private String date;
	private String title;
	private String pub;
	private String describe;
	private String pubdate;
	private int qty;
	
	public OrderVO() {}
	
	public OrderVO(String line) {
		String[] token = line.split("\\|");
		setNum(Integer.parseInt(token[0]));
		setUid(token[1]);
		setNo(Integer.parseInt(token[2]));
		setTitle(token[3]);
		setPrice(Integer.parseInt(token[4]));
		setPub(token[5]);
		setPubdate(token[6]);
		setQty(Integer.parseInt(token[7]));
		setDate(token[8]);
		//setTotal(token[9]);
	}
	
	
	
	

	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPub() {
		return pub;
	}


	public void setPub(String pub) {
		this.pub = pub;
	}


	public String getDescribe() {
		return describe;
	}


	public void setDescribe(String describe) {
		this.describe = describe;
	}


	public String getPubdate() {
		return pubdate;
	}


	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}


	public String getUid() {
		return uid;
	}
	
	
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	
	public int getNo() {
		return no;
	}
	
	
	public void setNo(int no) {
		this.no = no;
	}

	
	public String getDate() {
		return date;
	}
	
	
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
