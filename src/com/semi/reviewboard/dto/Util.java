package com.semi.reviewboard.dto;

public class Util {

	public String selectCategory(int category) {
		
		switch(category){
		case 1:
			return "서울";
		case 2: 
			return "인천";
		case 3:
			return "대전";
		case 4:
			return "대구";
		case 5:
			return "광주";
		case 6:
			return "부산";
		case 7:
			return "울산";
		case 8:
			return "세종";
		case 31:
			return "경기도";
		case 32:
			return "강원도";
		case 33: 
			return "충청도";
		case 34: 
			return "경상도";
		case 35:
			return "전라도";
		case 36:
			return "제주도";
		default:
			return "error";
		}
		
	}
	
}
