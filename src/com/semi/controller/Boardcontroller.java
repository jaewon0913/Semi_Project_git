package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.freeboard.dao.freeboarddao;
import com.semi.freeboard.dto.freeboarddto;
import com.semi.noticeboard.dao.noticeboarddao;
import com.semi.noticeboard.dto.noticeboarddto;
import com.semi.paging.Paging;

@WebServlet("/board.do")
public class Boardcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		freeboarddao dao = new freeboarddao();
		freeboarddto dto = new freeboarddto();
		
		noticeboarddao noticedao = new noticeboarddao();
		noticeboarddto noticedto = new noticeboarddto();
				
		String command = request.getParameter("command");

		
		System.out.println("<"+command+">");
		if(command.equals("mainhome")) {
			dispatch("mainhome.jsp",request,response);
		} else if(command.equals("noticeboardform")) {
			int page = 1;

			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			Paging paging = new Paging();
			paging.setPage(page);
			int count = noticedao.getAllcount();

			paging.setTotalCount(count);
			
			List<noticeboarddto> list = noticedao.pagelist(page);
			
			for(noticeboarddto nbdto : list) {
				if(nbdto.getNoticeboard_title().length() > 10) {
					nbdto.setNoticeboard_title(nbdto.getNoticeboard_title().substring(0, 10) + "...");
				} 
			}
			
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			
			dispatch("board/notice/noticeboard.jsp", request, response);
		} else if(command.equals("noticeboardselectone")) {
			String noticeboardno = request.getParameter("noticeboardno");
			
			noticedto = noticedao.selectone(noticeboardno);
			request.setAttribute("dto", noticedto);
			dispatch("board/notice/noticeboard_selectone.jsp", request, response);
		} else if(command.equals("noticeboardwriteform")) {
			System.out.println(request.getParameter("id"));
			
			if(request.getParameter("id").equals("admin")) {
				dispatch("board/notice/noticeboard_write.jsp",request,response);
			} else {
				jsResponse("관리자만 이용 가능한 기능입니다.","history.back()",response);	
			}
		} else if(command.equals("noticeboardwrite")) {
			int res = 0;
			noticedto.setNoticeboard_id(request.getParameter("id"));
			noticedto.setNoticeboard_title(request.getParameter("title"));
			noticedto.setNoticeboard_content(request.getParameter("content"));
			res = noticedao.write(noticedto);
			if(res>0) {
				jsResponse("글 작성 성공","board.do?command=noticeboardform",response);
			} else {
				jsResponse("글 작성 실패","history.back()",response);
			}
		} else if(command.equals("noticeboardpagelist")) {
			int page = 1;
			
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			Paging paging = new Paging();
			paging.setPage(page);
			
			int count = noticedao.getAllcount();
			paging.setTotalCount(count);
			
			List<noticeboarddto> list = noticedao.pagelist(page);
			
			for(noticeboarddto nbdto : list) {
				if(nbdto.getNoticeboard_title().length() > 10) {
					nbdto.setNoticeboard_title(nbdto.getNoticeboard_title().substring(0, 10) + "...");
				} 
			}
			
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			
			dispatch("board/notice/noticeboard.jsp",request,response);
	
			
		} else if(command.equals("freeboardform")) {
			int page = 1;

			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			Paging paging = new Paging();
			paging.setPage(page);
			int count = dao.getAllcount();
			paging.setTotalCount(count);
			
			List<freeboarddto> list = dao.pagelist(page);
			
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			
			dispatch("board/free/freeboard.jsp", request, response);
		} else if(command.equals("freeboardwriteform")) {
			System.out.println(request.getParameter("id"));

			if(request.getParameter("id").length()<1) {
				jsResponse("로그인이 필요한 기능입니다.","history.back()",response);	
			} else {
				dispatch("board/free/freeboard_write.jsp",request,response);
			}
		} else if(command.equals("freeboardwrite")) {
			int res = 0;
			dto.setFreeboard_id(request.getParameter("id"));
			dto.setFreeboard_title(request.getParameter("title"));
			dto.setFreeboard_content(request.getParameter("content"));
			res = dao.write(dto);
			if(res>0) {
				jsResponse("글 작성 성공","board.do?command=freeboardform",response);
			} else {
				jsResponse("글 작성 실패","history.back()",response);
			}
		} else if(command.equals("freeboardselectone")) {
			String freeboardno = request.getParameter("freeboardno");
			
			dto = dao.selectone(freeboardno);
			request.setAttribute("dto", dto);
			dispatch("board/free/freeboard_selectone.jsp", request, response);
		} else if(command.equals("freeboardpagelist")) {
			int page = 1;
			
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			Paging paging = new Paging();
			paging.setPage(page);
			
			int count = dao.getAllcount();
			paging.setTotalCount(count);
			
			List<freeboarddto> list = dao.pagelist(page);
			
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			
			dispatch("board/free/freeboard.jsp",request,response);
		} else if(command.equals("planning")) {
			dispatch("plan/planning.jsp",request,response);
		} else if(command.equals("accommodationform")) {
			dispatch("accommodation.jsp",request,response);
		} else if(command.equals("tourform")) {
			dispatch("tour.jsp",request, response);
		} else if(command.equals("payment")) {
			dispatch("payment.jsp",request,response);
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
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		
		if(url.equals("history.back()")) {
		String res = "<script type='text/javascript'>"
					+	"alert('" + msg + "');"
					+	url + ";\n"
					+	"</script>";
		out.println(res);
		} else {
		String res = "<script type='text/javascript'>"
				+	"alert('" + msg + "');"
				+	"location.href='" + url + "';"
				+	"</script>";
		out.println(res);
		}
	}
}
