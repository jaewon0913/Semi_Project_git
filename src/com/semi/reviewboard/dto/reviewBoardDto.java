package com.semi.reviewboard.dto;

import java.util.Date;

public class reviewBoardDto {
	
	private int reviewboard_no;
	private String reviewboard_id;
	private String reviewboard_title;
	private String reviewboard_content;
	private Date reviewboard_regdate;
	private int reviewboard_groupno;
	private int reviewboard_hits;
	private int reviewboard_category;
	private int reviewboard_titletab;
	private int reviewboard_groupsq;
	
	public reviewBoardDto() {}


	public reviewBoardDto(int reviewboard_no, String reviewboard_id, String reviewboard_title,
			String reviewboard_content, Date reviewboard_regdate, int reviewboard_groupno, int reviewboard_hits,
			int reviewboard_category, int reviewboard_titletab, int reviewboard_groupsq) {

		this.reviewboard_no = reviewboard_no;
		this.reviewboard_id = reviewboard_id;
		this.reviewboard_title = reviewboard_title;
		this.reviewboard_content = reviewboard_content;
		this.reviewboard_regdate = reviewboard_regdate;
		this.reviewboard_groupno = reviewboard_groupno;
		this.reviewboard_hits = reviewboard_hits;
		this.reviewboard_category = reviewboard_category;
		this.reviewboard_titletab = reviewboard_titletab;
		this.reviewboard_groupsq = reviewboard_groupsq;
	}
	
	
	
	public int getReviewboard_groupsq() {
		return reviewboard_groupsq;
	}


	public void setReviewboard_groupsq(int reviewboard_groupsq) {
		this.reviewboard_groupsq = reviewboard_groupsq;
	}


	public int getReviewboard_titletab() {
		return reviewboard_titletab;
	}


	public void setReviewboard_titletab(int reviewboard_titletab) {
		this.reviewboard_titletab = reviewboard_titletab;
	}


	public int getReviewboard_category() {
		return reviewboard_category;
	}


	public void setReviewboard_category(int reviewboard_category) {
		this.reviewboard_category = reviewboard_category;
	}


	public int getReviewboard_no() {
		return reviewboard_no;
	}


	public void setReviewboard_no(int reviewboard_no) {
		this.reviewboard_no = reviewboard_no;
	}


	public String getReviewboard_id() {
		return reviewboard_id;
	}


	public void setReviewboard_id(String reviewboard_id) {
		this.reviewboard_id = reviewboard_id;
	}


	public String getReviewboard_title() {
		return reviewboard_title;
	}


	public void setReviewboard_title(String reviewboard_title) {
		this.reviewboard_title = reviewboard_title;
	}


	public String getReviewboard_content() {
		return reviewboard_content;
	}


	public void setReviewboard_content(String reviewboard_content) {
		this.reviewboard_content = reviewboard_content;
	}


	public Date getReviewboard_regdate() {
		return reviewboard_regdate;
	}


	public void setReviewboard_regdate(Date reviewboard_regdate) {
		this.reviewboard_regdate = reviewboard_regdate;
	}


	public int getReviewboard_groupno() {
		return reviewboard_groupno;
	}


	public void setReviewboard_groupno(int reviewboard_groupno) {
		this.reviewboard_groupno = reviewboard_groupno;
	}


	public int getReviewboard_hits() {
		return reviewboard_hits;
	}


	public void setReviewboard_hits(int reviewboard_hits) {
		this.reviewboard_hits = reviewboard_hits;
	}
	
	
	
	
	
	
	

}
