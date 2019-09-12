package com.semi.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.semi.tour.dao.doDao;
import com.semi.tour.dao.tourDao;

import com.semi.tour.dto.itemDto;
import com.semi.tour.dto.paymentDto;
import com.semi.tour.dto.placeDto;

@WebServlet("/tour.do")
public class tourController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doPost(request,response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
			
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		

		tourDao dao = new tourDao();
		
		
		if(command.equals("item01insert")) {
			
			String obj = request.getParameter("obj");
			System.out.println(obj);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(obj);
			
			List<itemDto> list  = new ArrayList<itemDto>();
			doDao daoa = new doDao();
			PrintWriter out = response.getWriter();
			
			for(int i = 0; i<element.getAsJsonObject().get("DATA").getAsJsonArray().size(); i++) {
				JsonObject temp = element.getAsJsonObject().get("DATA").getAsJsonArray().get(i).getAsJsonObject();
				

				JsonElement item_day_j = temp.get("DAY");
				JsonElement item_city_j = temp.get("CITY");
				JsonElement item_place_j = temp.get("PLACE");
				
				String item_day = item_day_j.getAsString();
				String item_city = item_city_j.getAsString();
				String item_place = item_place_j.getAsString();
				
				itemDto dto = new itemDto();
				dto.setItem_day(item_day);
				dto.setItem_city(item_city);
				dto.setItem_place(item_place);
				
				list.add(dto);
				
				System.out.printf("%s %s %s", item_day, item_city, item_place);
				System.out.println("");
				
			}
			
			int res = daoa.insertitem01(list);
			
			if(res==list.size()) {
				System.out.println("저장성공");
			}else {
				System.out.println("저장실패");
			}
			
			out.println(res);
			
		}else if(command.equals("product")) {
			
			List<itemDto> listday1 = new ArrayList<itemDto>();
			List<itemDto> listday2 = new ArrayList<itemDto>();
			List<itemDto> listday3 = new ArrayList<itemDto>();
			List<itemDto> listday4 = new ArrayList<itemDto>();
			List<itemDto> listday5 = new ArrayList<itemDto>();
			List<itemDto> listday6 = new ArrayList<itemDto>();
			List<itemDto> listday7 = new ArrayList<itemDto>();
			
			String day1 = "DAY1";
			String day2 = "DAY2";
			String day3 = "DAY3";
			String day4 = "DAY4";
			String day5 = "DAY5";
			String day6 = "DAY6";
			String day7 = "DAY7";	
			
			listday1 = dao.selectList(day1);
			listday2 = dao.selectList(day2);
			listday3 = dao.selectList(day3);
			listday4 = dao.selectList(day4);
			listday5 = dao.selectList(day5);
			listday6 = dao.selectList(day6);
			listday7 = dao.selectList(day7);
			
			
			
			int cost = 1200000;
			String subject = "7days in Korea";
			
			request.setAttribute("listday1", listday1);
			request.setAttribute("listday2", listday2);
			request.setAttribute("listday3", listday3);
			request.setAttribute("listday4", listday4);
			request.setAttribute("listday5", listday5);
			request.setAttribute("listday6", listday6);
			request.setAttribute("listday7", listday7);
			
			request.setAttribute("subject",	subject);
			request.setAttribute("cost",cost);	
			dispatch(request, response,"tour.jsp");
		
			
		}else if(command.equals("placeinsert")) {
			
			String obj = request.getParameter("obj");
			System.out.println(obj);

			JsonParser parser = new JsonParser(); 
			JsonElement element = parser.parse(obj);
			
			List<placeDto> list = new ArrayList<placeDto>();
			doDao daoa = new doDao();
			PrintWriter out = response.getWriter();
			
			for(int i=0; i< element.getAsJsonObject().get("DATA").getAsJsonArray().size(); i++) {
				JsonObject temp = 
						element.getAsJsonObject().get("DATA").getAsJsonArray().get(i).getAsJsonObject();
				
				JsonElement city_name_j = temp.get("city");
				JsonElement place_name_j = temp.get("place");
				JsonElement phone_j = temp.get("phone");
				JsonElement adress_j = temp.get("adress");
				JsonElement latitude_j = temp.get("latitude");
				JsonElement longitude_j = temp.get("longitude");
				JsonElement place_info_j = temp.get("info");
				JsonElement guide_j = temp.get("guide");
				
				String city_name = city_name_j.getAsString();
				String place_name = place_name_j.getAsString();
				String phone = phone_j.getAsString();
				String adress = adress_j.getAsString();
				String latitude = latitude_j.getAsString();
				String longitude = longitude_j.getAsString();
				String place_info  = place_info_j.getAsString();
				String guide = guide_j.getAsString();
				
				placeDto dto  = new placeDto(city_name, place_name, phone, adress, latitude, longitude, place_info, guide);
				
				list.add(dto);
				
				System.out.printf("%s %s %s %s %s %s %s %s ", city_name, place_name, phone, adress, latitude, longitude, place_info, guide);
				System.out.println("");
			}
			
			int res = daoa.insertPlace(list);
			
			if(res==list.size()) {
				System.out.println("저장성공");
			}else {
				System.out.println("저장실패");
			}
			
			out.println(res);
		}else if(command.equals("payment")) {
		int peoplecount = Integer.parseInt(request.getParameter("peoplecount"));
		int cost = Integer.parseInt(request.getParameter("cost"));
		System.out.println("CTRpeoplecount: "+peoplecount);	
		System.out.println("CTRcost: "+cost);
			String msg = (peoplecount*cost)+"";
		System.out.println("msg: "+msg);	
			PrintWriter out = response.getWriter();
			out.println(msg);
		}else if(command.equals("paymentInsert")) {
			String id = request.getParameter("id");
			String subject = request.getParameter("subject");
			String price = request.getParameter("price");
			String amount = request.getParameter("amount");
			String month = request.getParameter("month");
	
			
			System.out.println("id : "+id);
			System.out.println("subject : "+subject);
			System.out.println("price : "+price);
			System.out.println("amount : "+amount);
			System.out.println("month : "+month);
			
			
			paymentDto dto = new paymentDto();
			dto.setPayment_id(id);
			dto.setPayment_subject(subject);
			dto.setPayment_amount(amount);
			dto.setPayment_price(price);
			dto.setPayment_mdate(month);
			
			dao.insertPayment(dto);
			
		}else if(command.equals("payinfoform")) {
			
			String id=request.getParameter("id");
			System.out.println("id: "+ id);
			
			List<paymentDto> list = dao.selectOnePayment(id);
			
			request.setAttribute("list", list);
			dispatch(request, response, "payment.jsp");
			
		}else if(command.equals("placedetail")) {
			
			String query = request.getParameter("query");
			System.out.println(query);
		}else if(command.equals("paymenterror")) {
			
			response.sendRedirect("paymenterror.jsp");
			
			
		}
		
		
		
	}
	
	
	
	
	
	

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String res = "<script type='text/javascript'>"
					+ " alert('"+msg+"');"
					+ " location.href='"+url+"';"
					+ "</script>";
		
		PrintWriter out = response.getWriter();
		out.println(res);
				
	}
	
	
}
