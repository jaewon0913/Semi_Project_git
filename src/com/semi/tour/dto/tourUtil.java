package com.semi.tour.dto;

import java.util.List;

public class tourUtil {
	
	public static String getCalview(int j, List<itemDto>list) {
		String res = "";

		
		for( int i=0; i<list.size(); i++) {
			itemDto dto = list.get(i);
			res +="<span>"+dto.getItem_city()+"</span><br/>";

		}

		return res;
	}
	
	public static String getList(List<itemDto>list) {
		String cityres = "";
		String placeres = "";
		String citylist = "";
		
		
		for(int i=0; i<list.size(); i++) {
			
			itemDto dto = list.get(i);	
					
			cityres = "<ul>"+dto.getItem_city();
			
			if(dto.getItem_place().contains(",")) {
					
				String [] place = dto.getItem_place().split(",");			
			
			for(int j=0; j<place.length; j++) {
				
				placeres += "<a href=\"#\"><li class=\"place\">"+place[j]+"</li></a>";			
				
			}
				
		}else {
			
			placeres = "<a href=\"#\"><li class=\"place\">"+dto.getItem_place()+"</li></a>";
			
		}			
			citylist += cityres+placeres+"</ul>";
			placeres = "";
			
		}
	
	
		return citylist;
		
	}
	
	public static String setPlacelist(String place) {
		
		String res="";
		
		if(place.contains(",")) {
			String [] placeArr = place.split(",");
			for(int i=0; i<placeArr.length; i++) {
				res += "<span class=\"placename\" style=\"padding-right: 20px; cursor:pointer;\" >"+placeArr[i]+"</span>";
			}
			
		}else {
			res = "<span class=\"placename\" style=\"cursor:pointer;\" >"+place+"</span></a>";
		}
		
		return res;
	}
	


}
