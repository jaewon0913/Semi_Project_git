package com.semi.noticeboard.dto;

import java.sql.Date;

public class noticeboarddto {
	private int row_num;
	private int noticeboard_no;
	private String noticeboard_id;
	private String noticeboard_title;
	private String noticeboard_content;
	private Date noticeboard_regdate;
	private int noticeboard_click_count;
	
	public noticeboarddto() {
		
	}

	public noticeboarddto(int noticeboard_no, String noticeboard_id, String noticeboard_title,
			String noticeboard_content, Date noticeboard_regdate, int noticeboard_click_count) {
		super();
		this.noticeboard_no = noticeboard_no;
		this.noticeboard_id = noticeboard_id;
		this.noticeboard_title = noticeboard_title;
		this.noticeboard_content = noticeboard_content;
		this.noticeboard_regdate = noticeboard_regdate;
		this.noticeboard_click_count = noticeboard_click_count;
	}


	public int getNoticeboard_no() {
		return noticeboard_no;
	}

	public void setNoticeboard_no(int noticeboard_no) {
		this.noticeboard_no = noticeboard_no;
	}

	public String getNoticeboard_id() {
		return noticeboard_id;
	}

	public void setNoticeboard_id(String noticeboard_id) {
		this.noticeboard_id = noticeboard_id;
	}

	public String getNoticeboard_title() {
		return noticeboard_title;
	}

	public void setNoticeboard_title(String noticeboard_title) {
		this.noticeboard_title = noticeboard_title;
	}

	public String getNoticeboard_content() {
		return noticeboard_content;
	}

	public void setNoticeboard_content(String noticeboard_content) {
		this.noticeboard_content = noticeboard_content;
	}

	public Date getNoticeboard_regdate() {
		return noticeboard_regdate;
	}

	public void setNoticeboard_regdate(Date noticeboard_regdate) {
		this.noticeboard_regdate = noticeboard_regdate;
	}

	public int getNoticeboard_click_count() {
		return noticeboard_click_count;
	}

	public void setNoticeboard_click_count(int noticeboard_click_count) {
		this.noticeboard_click_count = noticeboard_click_count;
	}

	public int getRow_num() {
		return row_num;
	}

	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}
}
