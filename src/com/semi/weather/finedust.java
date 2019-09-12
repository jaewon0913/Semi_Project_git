package com.semi.weather;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.BufferedReader;

public class finedust {
	public finedust() {
		
	}
	
	public String[] getfinedust(String location) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?sidoName="+location+"&searchCondition=DAILY&pageNo=1&numOfRows=10&ServiceKey=M4SIVt0fxN4MtZjcTCcQUKKMl0qcsMbAEVbKle2pTOxRylyoosmbgoMoOyy43REZZ%2BwBHVUBDZEH78IHklMB7w%3D%3D");
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		
		String[] data = new String[400];
		int i = 0;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
			data[i] = line;
			i++;

		}
		rd.close();
		conn.disconnect();
		String test = sb.toString().replaceAll("							", "").replaceAll("				    ", "")
				.replaceAll("				", "").replaceAll("		", "").replaceAll("	", "").replaceAll("        ", "")
				.replaceAll("        ", "").replaceAll("><", "> <");
		String[] splittest = test.split(" ");

		String[] finedust_data = new String[2];
		finedust_data[0] = splittest[19].replaceAll("<pm10Value>", "").replaceAll("</pm10Value>", "");
		finedust_data[1] = splittest[20].replaceAll("<pm25Value>", "").replaceAll("</pm25Value>", "");
		
		return finedust_data;
	}
}
