package com.semi.tour.dto;

public class itemDto {
	
	private int item_no;
	private String item_day;
	private String item_city;
	private String item_place;
	
	
	public itemDto() {}
	
	public itemDto(int item_no, String item_day, String item_city, String item_place) {

		this.item_no = item_no;
		this.item_day = item_day;
		this.item_city = item_city;
		this.item_place = item_place;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public String getItem_day() {
		return item_day;
	}

	public void setItem_day(String item_day) {
		this.item_day = item_day;
	}

	public String getItem_city() {
		return item_city;
	}

	public void setItem_city(String item_city) {
		this.item_city = item_city;
	}

	public String getItem_place() {
		return item_place;
	}

	public void setItem_place(String item_place) {
		this.item_place = item_place;
	}
	
	

}
