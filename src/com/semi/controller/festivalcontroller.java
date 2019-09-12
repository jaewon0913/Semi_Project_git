package com.semi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.festival.dao.FestivalDao;
import com.semi.festival.dto.FestivalDto;

@WebServlet("/festival.do")
public class festivalcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println(command);
		FestivalDao dao = new FestivalDao();
		
		// -----DB에 저장
		if (command.equals("Festival_db")) {
			String[] festivalList = request.getParameterValues("festival");
			List<FestivalDto> list = new ArrayList<>();

			System.out.println(festivalList.length);

			System.out.println(festivalList[0]);
			System.out.println(festivalList[1]);
			
			

			for (int i = 0; i < festivalList.length; i++) {
				String[] festival = festivalList[i].split("`");
				System.out.println(festival.length);
				// DB에 저장
				FestivalDto dto = new FestivalDto();
					
				dto.setFestival_name(festival[0]);
				dto.setFestival_place(festival[1]);
				dto.setFestival_start(festival[2]);
				dto.setFestival_end(festival[3]);
				dto.setFestival_img(festival[4]);
				dto.setFestival_con(festival[5]);
				dto.setFestival_num(festival[6]);
				dto.setHomepage(festival[7]);
				dto.setAddress(festival[8]);
				dto.setAgency(festival[9]);
				

				list.add(dto);
			}
			int res = dao.SaveFestivalData(list);
			if (res == list.size()) {
				System.out.println("저장성공");
			} else {
				System.out.println("저장실패");
			}
			
			// -----전체 축제 목록 보기
		} else if (command.equals("festivalList")) {
			List<FestivalDto> list = dao.FestivalList();
			request.setAttribute("list", list);
			dispatch(request, response, "festival/festivalAll.jsp");
			
			// -----월별 축제 목록
		} else if (command.equals("monthfestival")) {
			response.sendRedirect("festival/monthfestival_01.jsp");
		} else if(command.equals("month")) {
			String val = request.getParameter("val");
			List<FestivalDto> list = dao.MonthFestival(val);
			request.setAttribute("list", list);
			dispatch(request, response, "festival/monthfestival_02.jsp");
			
			//----- 축제 1개씩 보기
		}
	}
	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
