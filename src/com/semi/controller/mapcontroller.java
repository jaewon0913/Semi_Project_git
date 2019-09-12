package com.semi.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/map.do")
public class mapcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		System.out.println("<"+ command +">");
		
		if(command.equals("planning")) {
			dispatch("plan/planning.jsp", request, response);
		} else if(command.equals("province_detail")) {
			
			String proviece_name = request.getParameter("province_name");
			
			Map<String, Float> map_w = new HashMap<String, Float>();
			
			switch(proviece_name) {
			case "seoul":
				map_w = new HashMap<String, Float>();
				map_w.put("lat", (float) 37.210644 );
				map_w.put("lng", (float) 126.824799 );
				break;
			case "gyeonggi" :
				map_w = new HashMap<String, Float>();
				map_w.put("lat", (float) 37.499443);
				map_w.put("lng", (float) 127.034806);
				break;
			case "incheon" :
				map_w = new HashMap<String, Float>();
				map_w.put("lat", (float) 37.437793);
				map_w.put("lng", (float) 126.975861);
				break;
			case "chungcheong":
				map_w = new HashMap<String, Float>();
				map_w.put("lat", (float) 36.476515);
				map_w.put("lng", (float) 127.082977);
				break;
			case "gangwon":
				map_w = new HashMap<String, Float>();
				map_w.put("lat", (float) 37.53151);
				map_w.put("lng", (float) 129.098969);
				break;
			case "jeonla":
				map_w = new HashMap<String, Float>();
				map_w.put("lat", (float) 36.348315);
				map_w.put("lng", (float) 127.390594);
				break;
			case "gyeongsang":
				map_w = new HashMap<String, Float>();
				map_w.put("lat", (float) 35.691852);
				map_w.put("lng", (float) 127.908231);
				break;
			case "jeju":
				map_w = new HashMap<String, Float>();
				map_w.put("lat", (float) 33.420237);
				map_w.put("lng", (float) 126.555823);
				break;
			}
			
			request.setAttribute("map_w", map_w);
			dispatch("plan/pro_detail.jsp", request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
}
