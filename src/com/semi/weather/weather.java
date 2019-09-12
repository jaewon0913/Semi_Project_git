package com.semi.weather;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class weather {
	private String[] weatherdata = null;
	
	public String[] getweatherdata() {
		String url = "http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108";
		Document doc = null;
		
		try {
			doc=Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Elements elements_test = doc.getElementsByTag("location");
		
		weatherdata = new String[elements_test.size()];
		
		for(int i = 0 ; i <elements_test.size() ; i ++) {
			weatherdata[i] = elements_test.get(i).getElementsByTag("city").text() + "/" 
			+ elements_test.get(i).getElementsByTag("data").get(0).getElementsByTag("wf").text() + "/"
			+ elements_test.get(i).getElementsByTag("data").get(0).getElementsByTag("tmn").text() + "/"
			+ elements_test.get(i).getElementsByTag("data").get(0).getElementsByTag("tmx").text();
		}
		
		String[] choice_data = new String[12];
		choice_data[0] = weatherdata[0];
		choice_data[1] = weatherdata[1];
		choice_data[2] = weatherdata[6];
		choice_data[3] = weatherdata[8];
		choice_data[4] = weatherdata[12];
		choice_data[5] = weatherdata[9];
		choice_data[6] = weatherdata[33];
		choice_data[7] = weatherdata[27];
		choice_data[8] = weatherdata[38];
		choice_data[9] = weatherdata[21];
		choice_data[10] = weatherdata[16];
		choice_data[11] = weatherdata[39];
		
		return choice_data;
		
	}
}
