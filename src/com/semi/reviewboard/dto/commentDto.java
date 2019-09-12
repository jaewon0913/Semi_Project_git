package com.semi.reviewboard.dto;

import java.util.Date;

public class commentDto {
	
	private int commentboard_no;
	private int commentboard_boardno;
	private String commentboard_id;
	private String commentboard_content;
	private Date commentboard_regdate;
	private String commentboard_delflag;
	
	
	public commentDto() {}
	
	public commentDto(int commentboard_no, int commentboard_boardno, String commentboard_id,
			String commentboard_content, Date commentboard_regdate, String commentboard_delflag) {

		this.commentboard_no = commentboard_no;
		this.commentboard_boardno = commentboard_boardno;
		this.commentboard_id = commentboard_id;
		this.commentboard_content = commentboard_content;
		this.commentboard_regdate = commentboard_regdate;
		this.commentboard_delflag = commentboard_delflag;
	}
	public int getCommentboard_no() {
		return commentboard_no;
	}
	public void setCommentboard_no(int commentboard_no) {
		this.commentboard_no = commentboard_no;
	}
	public int getCommentboard_boardno() {
		return commentboard_boardno;
	}
	public void setCommentboard_boardno(int commentboard_boardno) {
		this.commentboard_boardno = commentboard_boardno;
	}
	public String getCommentboard_id() {
		return commentboard_id;
	}
	public void setCommentboard_id(String commentboard_id) {
		this.commentboard_id = commentboard_id;
	}
	public String getCommentboard_content() {
		return commentboard_content;
	}
	public void setCommentboard_content(String commentboard_content) {
		this.commentboard_content = commentboard_content;
	}
	public Date getCommentboard_regdate() {
		return commentboard_regdate;
	}
	public void setCommentboard_regdate(Date commentboard_regdate) {
		this.commentboard_regdate = commentboard_regdate;
	}
	public String getCommentboard_delflag() {
		return commentboard_delflag;
	}
	public void setCommentboard_delflag(String commentboard_delflag) {
		this.commentboard_delflag = commentboard_delflag;
	}

	@Override
	public String toString() {
		return "commentDto [commentboard_no=" + commentboard_no + ", commentboard_boardno=" + commentboard_boardno
				+ ", commentboard_id=" + commentboard_id + ", commentboard_content=" + commentboard_content
				+ ", commentboard_regdate=" + commentboard_regdate + ", commentboard_delflag=" + commentboard_delflag
				+ "]";
	}
	
	
	
	
	

}
