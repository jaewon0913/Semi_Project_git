package com.semi.tour.dto;

import java.util.Date;

public class paymentDto {
	
	
	private String payment_id ;
	private String payment_subject;
	private String payment_amount;
	private String payment_price;
	private String payment_mdate;
	private Date payment_regdate;
	
	public paymentDto() {}
	
	
	public paymentDto(String payment_id, String payment_subject, String payment_amount, String payment_price,
			String payment_mdate, Date payment_regdate) {

		this.payment_id = payment_id;
		this.payment_subject = payment_subject;
		this.payment_amount = payment_amount;
		this.payment_price = payment_price;
		this.payment_mdate = payment_mdate;
		this.payment_regdate = payment_regdate;
	}
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public String getPayment_subject() {
		return payment_subject;
	}
	public void setPayment_subject(String payment_subject) {
		this.payment_subject = payment_subject;
	}
	public String getPayment_amount() {
		return payment_amount;
	}
	public void setPayment_amount(String payment_amount) {
		this.payment_amount = payment_amount;
	}
	public String getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(String payment_price) {
		this.payment_price = payment_price;
	}
	public String getPayment_mdate() {
		return payment_mdate;
	}
	public void setPayment_mdate(String payment_mdate) {
		this.payment_mdate = payment_mdate;
	}
	public Date getPayment_regdate() {
		return payment_regdate;
	}
	public void setPayment_regdate(Date payment_regdate) {
		this.payment_regdate = payment_regdate;
	}
	
	
	
	
	
	
	

}
