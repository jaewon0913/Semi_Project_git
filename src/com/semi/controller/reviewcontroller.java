package com.semi.controller;

import java.io.File;



import java.io.FileInputStream;
import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.dto.memberdto;
import com.semi.reviewboard.dao.reviewBoardDao;
import com.semi.reviewboard.dto.Util;
import com.semi.reviewboard.dto.commentDto;
import com.semi.reviewboard.dto.pageMaker;
import com.semi.reviewboard.dto.reviewBoardDto;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@WebServlet("/review.do")
public class reviewcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		
		reviewBoardDao dao = new reviewBoardDao();
		Util util = new Util();
		
		if(command.equals("reviewboard")) {
			
			int pagenum = Integer.parseInt(request.getParameter("pagenum"));//현재페이지
			int contentnum = Integer.parseInt(request.getParameter("contentnum"));//한페이지에 보이는 게시글 갯수
			int totalcount = dao.getCount();
			
			System.out.println("페이지번호: "+ pagenum);
			
			pageMaker pm = new pageMaker();
			pm.setTotalcount(totalcount);
			pm.setContentnum(contentnum);
			pm.setPagenum(pagenum);
			pm.setCurrentblock(pagenum);
			pm.setLastblock(totalcount);
			pm.setStartPage(pm.getCurrentblock());
			pm.setEndPage(pm.getLastblock(), pm.getCurrentblock());
			
			if(pagenum>0 && pagenum<6) { //페이지블록이 1일 때는 이전페이지로가는 화살표 안보임
				pm.setPrev(false);
				pm.setNext(true);
			}else if(pm.getLastblock() == pm.getCurrentblock()) { //마지막 블록이 현재 블록일 때 다음블록 화살표는 안보임 
				pm.setPrev(true);
				pm.setNext(false);
			}else {
				pm.setPrev(true);
				pm.setNext(true);
			}
			pm.setStartrow(pagenum, contentnum);
			pm.setEndrow(pagenum, contentnum);
			
			List<reviewBoardDto> list = dao.selectList(pm.getStartrow(), pm.getEndrow());
			
			String text = "reviewboard";//페이징 섹션 구분을 위한 변수 
			request.setAttribute("text", text);
			request.setAttribute("list", list);
			request.setAttribute("pm", pm);
			dispatch(request, response, "review/reviewlist.jsp");
			
		}else if(command.equals("writeform")) {
			
			if(request.getParameter("id").length()<1) {
				jsResponse("로그인이 필요한 기능입니다.","history.back()",response);	
			} else {
				response.sendRedirect("review/review_writeform.jsp");
			}
						
		}else if(command.equals("reservation")) {
			
			response.sendRedirect("accommodation.jsp");
			
		}else if(command.equals("write")) {
			
			int category= Integer.parseInt(request.getParameter("category"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String id = (String)request.getSession().getAttribute("id");
			
			reviewBoardDto dto = new reviewBoardDto();
			dto.setReviewboard_category(category);
			dto.setReviewboard_title(title);
			dto.setReviewboard_content(content);
			dto.setReviewboard_id(id);
			
			int res = dao.insert(dto);
			if(res>0) {
				jsResponse("글 작성 완료", "review.do?command=reviewboard&pagenum=1&contentnum=10", response);
			}else {
				
				jsResponse("글 작성 실패", "review.do?command=writeform", response);
			}
			
		}else if(command.equals("boarddetail")) {
			
			int hits = Integer.parseInt(request.getParameter("hits"))+1;		
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			int pagenum = Integer.parseInt(request.getParameter("pagenum"));
			System.out.println("페이지 번호: " +pagenum); //글 내용보기에서 목록돌아올 때 페이지 번호가 필요하기때문에 값 받아옴
			System.out.println("글 번호: "+boardno);
			System.out.println("조회수: "+hits);
			
			int res = dao.hitsUpdate(boardno, hits);
			if(res>0) {
				System.out.println("조회수 증가");
			}else {
				System.out.println("조회수 증가 실패");
			}
			
			reviewBoardDto dto = dao.selsectOne(boardno);
			String category = util.selectCategory(dto.getReviewboard_category());//카테고리String으로 변환

			request.setAttribute("pagenum", pagenum);
			request.setAttribute("category", category);
			request.setAttribute("dto", dto);
			dispatch(request, response, "review/review_detail.jsp");			
			
		}else if(command.equals("searchitems")) {
			
			
			System.out.println("command: "+command);
			String item  = request.getParameter("item");
			String location = request.getParameter("location");
			String query = request.getParameter("query");
			
			System.out.println("item: "+item);
			System.out.println("location: "+location);
			System.out.println("query: "+query);
			
			int pagenum = Integer.parseInt(request.getParameter("pagenum"));
			int contentnum = Integer.parseInt(request.getParameter("contentnum"));
			
			int totalcount = dao.getCount_search(item, location, query);
			System.out.println("totalcount: "+totalcount);
			System.out.println("페이지번호: "+ pagenum);
			
			pageMaker pm = new pageMaker();
			pm.setTotalcount(totalcount);
			pm.setContentnum(contentnum);
			pm.setPagenum(pagenum);
			pm.setCurrentblock(pagenum);
			pm.setLastblock(totalcount);
			pm.setStartPage(pm.getCurrentblock());
			pm.setEndPage(pm.getLastblock(), pm.getCurrentblock());
			
			if(pagenum>0 && pagenum<6) { //페이지블록이 1일 때는 이전페이지로가는 화살표 안보임
				pm.setPrev(false);
				pm.setNext(true);
			}else if(pm.getLastblock() == pm.getCurrentblock()) { //마지막 블록이 현재 블록일 때 다음블록 화살표는 안보임 
				pm.setPrev(true);
				pm.setNext(false);
			}else {
				pm.setPrev(true);
				pm.setNext(true);
			}
			pm.setStartrow(pagenum, contentnum);
			pm.setEndrow(pagenum, contentnum);

			
			List<reviewBoardDto> list = dao.selectListOption(item, location, query, pm.getStartrow(),pm.getEndrow());

			
			String text = "searchitems";//페이징 섹션 구분을 위한 변수 
			request.setAttribute("text", text);
			request.setAttribute("query", query);
			request.setAttribute("location", location);
			request.setAttribute("item", item);
			request.setAttribute("list", list);
			request.setAttribute("pm", pm);
			dispatch(request, response, "review/reviewlist.jsp");		
			
		}else if(command.equals("updateform")) {
			
			int pagenum = Integer.parseInt(request.getParameter("pagenum"));
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			reviewBoardDto dto = new reviewBoardDto();
			dto = dao.selsectOne(boardno);
			
			request.setAttribute("pagenum", pagenum);
			request.setAttribute("dto", dto);
			dispatch(request, response, "review/review_updateform.jsp");
			
			
		}else if(command.equals("update")) {
			
			int pagenum = Integer.parseInt(request.getParameter("pagenum"));
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			int category= Integer.parseInt(request.getParameter("category"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			
			reviewBoardDto dto = new reviewBoardDto();
			dto.setReviewboard_category(category);
			dto.setReviewboard_title(title);
			dto.setReviewboard_content(content);
			dto.setReviewboard_no(boardno);
			
			int res = dao.update(dto);
			
			if(res>0) {
				jsResponse("글 수정이 완료되었습니다", "review.do?command=reviewboard&pagenum="+pagenum+"&contentnum=10", response);
			}else {
				jsResponse("글 수정 실패", "review.do?command=updateform&pagenum="+pagenum+"&boardno="+boardno, response);
			}
			
			
			
		}else if(command.equals("answerform")) {
			int pagenum = Integer.parseInt(request.getParameter("pagenum"));
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			
			request.setAttribute("pagenum", pagenum);
			request.setAttribute("boardno", boardno);
			dispatch(request, response, "review/review_answerform.jsp");
			
		}else if(command.equals("answerinsert")) {
			int pagenum = Integer.parseInt(request.getParameter("pagenum"));
			int parentboardno = Integer.parseInt(request.getParameter("boardno"));//부모글 번호
			int category= Integer.parseInt(request.getParameter("category"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String id = (String)request.getSession().getAttribute("id");
			
			System.out.println("answerinsert 접속");
			
			reviewBoardDto dto = new reviewBoardDto();
			dto.setReviewboard_category(category);
			dto.setReviewboard_title(title);
			dto.setReviewboard_content(content);
			dto.setReviewboard_no(parentboardno);	
			dto.setReviewboard_id(id);
			
			dao.answerUpadte(parentboardno);
			int res = dao.answerInsert(dto);

			if(res>0) {
				jsResponse("답글 작성이 완료되었습니다", "review.do?command=reviewboard&pagenum="+pagenum+"&contentnum=10", response);
			}else {
				jsResponse("답글작성 실패", "review.do?command=answerform&pagenum="+pagenum+"&boardno="+parentboardno, response);
			}
			
			
		}else if(command.equals("delete")) {
			int pagenum = Integer.parseInt(request.getParameter("pagenum"));
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			
			int res = dao.delete(boardno);
			
			if(res>0) {
				
				if(res>0) {
					jsResponse("글 삭제 완료", "review.do?command=reviewboard&pagenum="+pagenum+"&contentnum=10", response);
				}else {
					
					jsResponse("글 삭제 실패", "review.do?command=reviewboard&pagenum=1&contentnum=10", response);
				}
				
			}
			
		}else if(command.equals("fileDownload")) {
			
			String fileName = request.getParameter("file");
			String directory = this.getServletContext().getRealPath("/upload/");
			File file = new File(directory +"/"+ fileName);
			
			//어떤 정보를 주고받을지에대한것을 저장
			//파일 관련한 데이터를 주고받을때는 octet-stream 사용 (이진데이터형식의 파일을 전달할 때 사용)
			String mineType = getServletContext().getMimeType(file.toString());
			if(mineType!=null) {
				response.setContentType("application/octet-stream");
			}
		
			String downloadName = null;
			
			//현제 접속한 사용자의 사용 상태에따라서 적용하겠다
			//MSIE: 인터넷 익스플로러 의미 
			//조건1) 익스플로러로 접속한게 아니라면 : 파일 이름을 UTF-8방식으로 얻어서 8859_1형식으로 바꿔주겠다
			//		전달 할 데이터가 깨지는것을 방지하기 위함 	
			if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
				downloadName = new String(fileName.getBytes("UTF-8"), "8859_1");
				
			}else {
				downloadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
			}
			
			response.setHeader("Content-Disposition", "attachment;filename=\"" + downloadName + "\";"); 
			
			FileInputStream fileInputStream  = new FileInputStream(file);
			ServletOutputStream servletOutputStream = response.getOutputStream();
			
			//데이터를 전송할 때는 바이트단위로 쪼개서 보내야한다 
			byte b[] = new byte[1024];
			int data = 0;
			
			while((data = (fileInputStream.read(b, 0, b.length))) != -1 ){
				servletOutputStream.write(b, 0, data);
			}
			servletOutputStream.flush();
			servletOutputStream.close();
			fileInputStream.close();
		
		}else if(command.equals("commentList")) {
			
			int	boardno = Integer.parseInt(request.getParameter("num"));
			List<commentDto> list = dao.selectComment(boardno);
			int cnt = dao.commentCNT(boardno);
					
			request.setAttribute("cnt", cnt);
			request.setAttribute("list", list);
			dispatch(request, response, "review/commentList.jsp");
			
		}else if(command.equals("commentAdd")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			String content = request.getParameter("content");
			//String id = request.getParameter("id");
			
			memberdto test = (memberdto)request.getSession().getAttribute("id");
			String id = test.getMember_id();
			
			System.out.println(boardno + " : " + content + " : " + id);
			
			commentDto dto = new commentDto();
			dto.setCommentboard_boardno(boardno);
			dto.setCommentboard_id(id);
			dto.setCommentboard_content(content);
			
			dao.commentAdd(dto);			
			//실행이 끝나면 콜백함수 sucess로 넘어감
		}else if(command.equals("reviewdata")) {
			System.out.println("reviewdata실행");

			List<reviewBoardDto> list = dao.reviewdata();
			
			JSONObject object = new JSONObject(); // {}
            JSONArray array = new JSONArray(); // []
            JSONObject total = new JSONObject(); // {}
            
            for(int i = 0 ; i < list.size(); i++) {
            		object.put("boardno", list.get(i).getReviewboard_no());
            		object.put("hits", list.get(i).getReviewboard_hits());
            		object.put("title", list.get(i).getReviewboard_title());
            		object.put("content", list.get(i).getReviewboard_content());
            		
            		array.add(object);
            }
            total.put("DATA", array);
			
			out.print(total);
		}
	}
	
	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
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
