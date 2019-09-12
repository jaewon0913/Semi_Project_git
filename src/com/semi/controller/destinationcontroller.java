package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import com.semi.destination.dao.destinationDao;
import com.semi.destination.dto.destinationDto;
import com.semi.paging.destinationPaging;


@WebServlet("/destination.do")
public class destinationcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public destinationcontroller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("<"+ command+ ">");
		
		destinationDao dao = new destinationDao();
		
		if(command.equals("des_list")) {
			List<destinationDto> list = dao.destinationList();
			request.setAttribute("list", list);
			dispatch(request, response, "destination/destination.jsp");
		}else if(command.equals("city_select")){
			String val = request.getParameter("val");			
			int page = 1;
			System.out.println("city_select : " + val);
			
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			destinationPaging paging = new destinationPaging();
			paging.setPage(page);
			
			int count = dao.getAllcount(val);
			paging.setTotalCount(count);
			
			List<destinationDto> list = dao.pagelist(page, val);
			
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			
			dispatch(request,response,"destination/destination_02.jsp");
			
		}else if(command.equals("destinationpagelist")) {
			int page = 1;
			String val = request.getParameter("cityname");
			System.out.println("cityname : " + val);
			
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			destinationPaging paging = new destinationPaging();
			paging.setPage(page);
			
			int count = dao.getAllcount(val);
			paging.setTotalCount(count);
			
			List<destinationDto> list = dao.pagelist(page, val);
			
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			
			dispatch("destination/destination_02.jsp",request,response);
		}else if(command.equals("detail")) {
			String primarykey = request.getParameter("primarykey");
			
			System.out.println(primarykey);
			
			destinationDto dto = dao.detail(primarykey);
			
			System.out.println("번호 : " + dto.getPlace_name());
			if(dto != null) {
				response.sendRedirect("destination/des_detail.jsp?place_name="+dto.getPlace_name()+"&place_phone="+dto.getPhon()+"&address="+dto.getAddress()+"&guide="+dto.getGuide()+"&place_info="+dto.getPlace_info());
			}
			
			
		}
	}
	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
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
