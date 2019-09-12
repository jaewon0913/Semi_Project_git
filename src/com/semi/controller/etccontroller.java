package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.semi.weather.finedust;
import com.semi.weather.weather;


@WebServlet("/etc.do")
public class etccontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		PrintWriter out = response.getWriter();
		
		System.out.println("<"+command+">");
		
		if(command.equals("weather")) {
			String[] weather_data = new weather().getweatherdata();
			
			JSONObject object = new JSONObject(); // {}
            JSONArray array = new JSONArray(); // []
            JSONObject total = new JSONObject(); // {}
            
            String[] split_data = null;
            
            for (int i = 0; i < weather_data.length; i++) {
            		split_data = weather_data[i].split("/");
                object.put("city", split_data[0]);
                object.put("wf", split_data[1]);
                object.put("tmn", split_data[2]);
                object.put("tmx", split_data[3]);

                array.add(object);
             }
             total.put("DATA", array);

             out.print(total);
		} else if (command.equals("finedust")) {
			String location = request.getParameter("location");
			
			JSONObject object = new JSONObject(); // {}
            JSONArray array = new JSONArray(); // []
            JSONObject total = new JSONObject(); // {}
			
			try {
				String[] finedust_data = new finedust().getfinedust(location);
				object.put("finedust", finedust_data[0]);
				object.put("highfinedust", finedust_data[1]);
				
				array.add(object);
				total.put("DATA", array);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				out.print(total);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doGet(request, response);
	}

}
