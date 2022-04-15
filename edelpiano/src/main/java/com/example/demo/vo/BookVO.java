package com.example.demo.vo;

import org.springframework.stereotype.Component;

@Component
public class BookVO 
{
	private String uid;
	private int no;
	private String title;
	private int price;
	private String pub;
	private String pubdate;
	private String describe;
	private int qty;
	private int total;

	public BookVO() {}
	
	public BookVO(String line) {
		String[] token = line.split("\\|");
		setNo(Integer.parseInt(token[0]));
		setTitle(token[1]);
		setPrice(Integer.parseInt(token[2]));
		setPub(token[3]);
		setPubdate(token[4]);
		setDescribe(token[5]);
	}
	
	



	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPub() {
		return pub;
	}

	public void setPub(String pub) {
		this.pub = pub;
	}

	public String getPubdate() {
		return pubdate;
	}

	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}
	
}
