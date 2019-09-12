package com.semi.freeboard.dto;

public class freeboarddto {
	private int freeboard_no;
	private String freeboard_id;
	private String freeboard_title;
	private String freeboard_content;
	private String freeboard_regdate;
	private int freeboard_groupno;
	private int freeboard_grouporder;
	private int freeboard_titletab;
	private String freeboard_delenabled;
	
	public freeboarddto() {
		
	}
	
	public freeboarddto(int freeboard_no, String freeboard_id, String freeboard_title,
			String freeboard_content, String freeboard_regdate, int freeboard_groupno, int freeboard_grouporder,
			int freeboard_titletab, String freeboard_delenabled) {
		this.freeboard_no = freeboard_no;
		this.freeboard_id = freeboard_id;
		this.freeboard_title = freeboard_title;
		this.freeboard_content = freeboard_content;
		this.freeboard_regdate = freeboard_regdate;
		this.freeboard_groupno = freeboard_groupno;
		this.freeboard_grouporder = freeboard_grouporder;
		this.freeboard_titletab = freeboard_titletab;
		this.freeboard_delenabled = freeboard_delenabled;
	}
	
	public int getFreeboard_no() {
		return freeboard_no;
	}
	public void setFreeboard_no(int freeboard_no) {
		this.freeboard_no = freeboard_no;
	}

	public String getFreeboard_id() {
		return freeboard_id;
	}
	public void setFreeboard_id(String freeboard_id) {
		this.freeboard_id = freeboard_id;
	}
	public String getFreeboard_title() {
		return freeboard_title;
	}
	public void setFreeboard_title(String freeboard_title) {
		this.freeboard_title = freeboard_title;
	}
	public String getFreeboard_content() {
		return freeboard_content;
	}
	public void setFreeboard_content(String freeboard_content) {
		this.freeboard_content = freeboard_content;
	}
	public String getFreeboard_regdate() {
		return freeboard_regdate;
	}
	public void setFreeboard_regdate(String freeboard_regdate) {
		this.freeboard_regdate = freeboard_regdate;
	}
	public int getFreeboard_groupno() {
		return freeboard_groupno;
	}
	public void setFreeboard_groupno(int freeboard_groupno) {
		this.freeboard_groupno = freeboard_groupno;
	}
	public int getFreeboard_grouporder() {
		return freeboard_grouporder;
	}
	public void setFreeboard_grouporder(int freeboard_grouporder) {
		this.freeboard_grouporder = freeboard_grouporder;
	}
	public int getFreeboard_titletab() {
		return freeboard_titletab;
	}
	public void setFreeboard_titletab(int freeboard_titletab) {
		this.freeboard_titletab = freeboard_titletab;
	}

	public String getFreeboard_delenabled() {
		return freeboard_delenabled;
	}

	public void setFreeboard_delenabled(String freeboard_delenabled) {
		this.freeboard_delenabled = freeboard_delenabled;
	}
	
	
}
