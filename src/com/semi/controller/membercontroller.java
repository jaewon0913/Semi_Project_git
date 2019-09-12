package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.dao.memberdao;
import com.semi.member.dto.memberdto;

@WebServlet("/member.do")
public class membercontroller extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		memberdto dto = null;
		memberdao dao = new memberdao();

		String command = request.getParameter("command");

		System.out.println("<" + command + ">");

		if (command.equals("normalregist")) {
			String id = request.getParameter("id_chk");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			String birth = request.getParameter("birth");
			String style = request.getParameter("style");
			
			System.out.println(id + " : " + pw + " : " + name + " : " + phone  + ": " + email  + " : " + gender + " : " + birth + " : " + style );

			if (dao.insert(new memberdto(id, pw, name, phone, email, gender, birth, style)) > 0) {
				jsResponse("회원가입되었습니다.", "startpage.jsp", response);
			}
		} else if (command.equals("idchk")) {
			String id = request.getParameter("id");
			dto = dao.idchk(id);
			boolean idNotUsed = true;
			if (dto != null) {
				idNotUsed = false;
			}
			response.sendRedirect("member/idcheck.jsp?idNotUsed=" + idNotUsed);

		} else if (command.equals("selectregistform")) {
			dispatch("member/selectregistform.jsp", request, response);

		} else if (command.equals("mainhome")) {
			dispatch("mainhome.jsp", request, response);

		} else if (command.equals("normalregistform")) {
			dispatch("member/normalregistform.jsp", request, response);

		} else if (command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			dto = dao.selectOne(id);
			
			if ((dto = dao.login(id, pw)) != null) {
				request.getSession().setAttribute("id", dto);
				jsResponse(id + " 님 환영합니다", "mainhome.jsp", response);
			} else {
				jsResponse("아이디와 비밀번호를 잘못 입력하셨습니다.", "history.back()", response);
			}

		} else if (command.equals("logout")) {
			request.getSession().removeAttribute("id");;
			jsResponse("로그아웃 되었습니다.", "mainhome.jsp", response);

		} else if (command.equals("findid")) {
			dispatch("member/findId.jsp", request, response);
		} else if (command.equals("findidres")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			dto = dao.findid(name, email);
			System.out.println("controller : " + dto.getMember_id());
			if (dto != null) {
				request.setAttribute("dto", dto);
				dispatch("member/findId_res.jsp", request, response);
			} else {
				jsResponse("이름과 이메일 주소를 확인해주세요!", "history.back()", response);
			}
		} else if (command.equals("findpw")) {
			dispatch("member/findPw.jsp", request, response);
		} else if (command.equals("findpwres")) {
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String email = request.getParameter("email");

			System.out.println("name : " + name + " , id : " + id + " , email : " + email);

			dto = dao.findpw(name, id, email);
			if (dto != null) {
				request.setAttribute("dto", dto);
				dispatch("member/findPw_res.jsp", request, response);
			} else {
				jsResponse("성함과 아이디,이메일 주소 확인해주세요!", "history.back()", response);
			}
			
		} else if (command.equals("facebook")) {
			String id = request.getParameter("id") + "_fb";
			String name = request.getParameter("name");
			System.out.println("페이스북 id는 " + id);
			System.out.println("페이스북 name는 " + name);
			request.getSession().setAttribute("id", id);

			dispatch("member/test.jsp", request, response);

		} else if (command.equals("mypageform")) {
			dispatch("member/mypage.jsp", request, response);
		} else if (command.equals("membereditform")) {

			String id = request.getParameter("id");
			dto = dao.selectOne(id);

			request.setAttribute("dto", dto);
			
			dispatch("member/membership_edit_form.jsp", request, response);

		} else if (command.equals("edit")) {// 개인정보수정
			String pw = request.getParameter("pw");
			String email = request.getParameter("email");
			memberdto memberdto =  (memberdto)request.getSession().getAttribute("id");
			String id = memberdto.getMember_id();
			
			dto = dao.selectOne(id);

			memberdto.setMember_pw(pw);
			memberdto.setMember_email(email);
			memberdto.setMember_id(id);
			
			int res = dao.infoupdate(memberdto);
			
			if (res > 0) {
				request.setAttribute("dto", dto);
				jsResponse(id + " 님의 정보가 성공적으로 수정되었습니다.", "member/mypage.jsp", response);
			} else {
				jsResponse("모든 정보를 입력해 주세요!", "membership_edit_form.jsp", response);
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		doGet(request, response);
	}

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();

		if (url.contains("history.back()")) {
			String res = "<script type='text/javascript'>" + "alert('" + msg + "');" + url + ";\n" + "</script>";
			out.println(res);
		} else {
			String res = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
					+ "</script>";
			out.println(res);
		}
	}

}
