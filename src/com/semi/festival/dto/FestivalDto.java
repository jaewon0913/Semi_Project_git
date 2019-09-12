package com.semi.festival.dto;

public class FestivalDto {
	
	private int festival_seq;
	private String festival_name;
	private String festival_place;
	private String festival_start;
	private String festival_end;
	private String festival_con;
	private String festival_num;
	private String homepage;
	private String address;
	private String agency;
	private String festival_img;
	
	public FestivalDto() {
		
	}
	public FestivalDto(int festival_seq, String festival_name, String festival_place, String festival_start, String festival_end, String festival_con
			, String festival_num, String homepage, String address, String agency, String festival_img) {
		this.festival_seq=festival_seq;
		this.festival_name=festival_name;
		this.festival_place=festival_place;
		this.festival_start=festival_start;
		this.festival_end=festival_end;
		this.festival_con=festival_con;
		this.festival_num=festival_num;
		this.homepage=homepage;
		this.address=address;
		this.agency=agency;
		this.festival_img=festival_img;
		
	}
	public String getFestival_name() {
		return festival_name;
	}
	public void setFestival_name(String festival_name) {
		this.festival_name = festival_name;
	}
	public String getFestival_place() {
		return festival_place;
	}
	public void setFestival_place(String festival_place) {
		this.festival_place = festival_place;
	}
	public String getFestival_start() {
		return festival_start;
	}
	public void setFestival_start(String festival_start) {
		this.festival_start = festival_start;
	}
	public String getFestival_end() {
		return festival_end;
	}
	public void setFestival_end(String festival_end) {
		this.festival_end = festival_end;
	}
	public String getFestival_con() {
		return festival_con;
	}
	public void setFestival_con(String festival_con) {
		this.festival_con = festival_con;
	}
	public String getFestival_num() {
		return festival_num;
	}
	public void setFestival_num(String festival_num) {
		this.festival_num = festival_num;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAgency() {
		return agency;
	}
	public void setAgency(String agency) {
		this.agency = agency;
	}
	public int getFestival_seq() {
		return festival_seq;
	}
	public void setFestival_seq(int festival_seq) {
		this.festival_seq = festival_seq;
	}
	public String getFestival_img() {
		return festival_img;
	}
	public void setFestival_img(String festival_img) {
		this.festival_img = festival_img;
	}
	
	
}
