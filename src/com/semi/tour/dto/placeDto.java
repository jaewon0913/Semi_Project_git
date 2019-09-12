package com.semi.tour.dto;

public class placeDto {

	private String city_name;
	private String place_name;
	private String phone;
	private String adress;
	private String latitude;
	private String longitude;
	private String place_info;
	private String guide;
	private int place_no;
	private int place_hits;
	private int place_like;
	

	public placeDto() {}
	
	public placeDto(String city_name, String place_name, String phone, String adress, String latitude, String longitude,
			String place_info, String guide, int place_no, int place_hits, int place_like) {

		this.city_name = city_name;
		this.place_name = place_name;
		this.phone = phone;
		this.adress = adress;
		this.latitude = latitude;
		this.longitude = longitude;
		this.place_info = place_info;
		this.guide = guide;
		this.place_no = place_no;
		this.place_hits = place_hits;
		this.place_like = place_like;
	}

	
	public placeDto(String city_name, String place_name, String phone, String adress, String latitude, String longitude,
			String place_info, String guide) {

		this.city_name = city_name;
		this.place_name = place_name;
		this.phone = phone;
		this.adress = adress;
		this.latitude = latitude;
		this.longitude = longitude;
		this.place_info = place_info;
		this.guide = guide;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getPlace_info() {
		return place_info;
	}
	public void setPlace_info(String place_info) {
		this.place_info = place_info;
	}
	public String getGuide() {
		return guide;
	}
	public void setGuide(String guide) {
		this.guide = guide;
	}
	
	

}
