package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.semi.reviewboard.dao.reviewBoardDao;
import com.semi.reviewboard.dto.reviewBoardDto;


@WebServlet("/upload.do")
public class uploadcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public uploadcontroller() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 경로확인용
		String path = request.getSession().getServletContext().getRealPath("/imageUpload");
			
		// 사진 경로, 크기 multi 설정
		MultipartRequest multi = new MultipartRequest(request, path, 100000000, "UTF-8");
		String command = multi.getParameter("command");
		System.out.println("<" + command + ">");

		reviewBoardDao dao = new reviewBoardDao();

		if (command.equals("review_writeform")) {
		// request -> multi
			String category = multi.getParameter("category");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String id = multi.getParameter("id");
			System.out.println(content);
			reviewBoardDto dto = new reviewBoardDto();
			dto.setReviewboard_category(Integer.parseInt(category));
			dto.setReviewboard_title(title);
			dto.setReviewboard_content(content);
			dto.setReviewboard_id(id);
			
			int res = dao.insert(dto);
			if(res>0) {
				jsResponse("글 작성 완료", "review.do?command=reviewboard&pagenum=1&contentnum=10", response);
			}else {
				
				jsResponse("글 작성 실패", "review.do?command=writeform", response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String res = "<script type='text/javascript'>" + " alert('" + msg + "');" + " location.href='" + url + "';"
				+ "</script>";
		PrintWriter out = response.getWriter();
		out.println(res);

	}

}