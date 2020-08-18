package com.atg.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.atg.paging.dto.PagingDto;
import com.atg.review.biz.ReviewBiz;
import com.atg.review.biz.ReviewBizImpl;
import com.atg.review.dto.ReviewDto;
import com.atg.reviewReply.biz.ReviewReplyBiz;
import com.atg.reviewReply.biz.ReviewReplyBizImpl;
import com.atg.reviewReply.dto.ReviewReplyDto;

@WebServlet("/review.do")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		
		ReviewBiz biz = new ReviewBizImpl();
		
		
		//리뷰비즈 추가 
		ReviewReplyBiz Replybiz = new ReviewReplyBizImpl();
		
		if(command.equals("detail")) {
			int rv_no = Integer.parseInt(request.getParameter("rv_no"));
			System.out.println(rv_no);
			
			ReviewDto dto = biz.selectOne(rv_no);
			
			request.setAttribute("dto", dto);
			
			//리뷰 추가
			// 리뷰는 디테일 댓글은 리스트로 뿌리기
			List<ReviewReplyDto> Rlist = Replybiz.seleList(rv_no);
			System.out.println("컨트롤러=====>" + Rlist);
			
			request.setAttribute("Rlist", Rlist);
			System.out.println("Rlist==>" + Rlist);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("review_detail.jsp");
			dispatch.forward(request, response);
			
		} else if(command.equals("review_insert")) {
			
			RequestDispatcher dispatch = request.getRequestDispatcher("review_insert.jsp");
			dispatch.forward(request, response);
		} else if(command.equals("insert")) {
			String rv_title = request.getParameter("rv_title");
			String mb_id = request.getParameter("mb_id");
			int rv_rate = Integer.parseInt(request.getParameter("rv_rate"));
			String rv_content = request.getParameter("rv_content");
			System.out.println(rv_rate);
			System.out.println(rv_rate);
			
			int res = biz.insert(new ReviewDto(0, rv_title, rv_content, null, rv_rate, mb_id));
			
			if(res > 0) {
				response.sendRedirect("ReviewController.do?command=review_list&nt_no=1");
			} else {
				response.sendRedirect("review_insert.jsp");
			}
			
		} else if(command.equals("update")) {
			int rv_no = Integer.parseInt(request.getParameter("rv_no"));
			ReviewDto dto = biz.selectOne(rv_no);
			request.setAttribute("dto", dto);
			int res = biz.update(new ReviewDto());
			
			RequestDispatcher dispatch = request.getRequestDispatcher("review_update.jsp");
			dispatch.forward(request, response);
			
		} else if(command.equals("review_update")) {
			int rv_no = Integer.parseInt(request.getParameter("rv_no"));
			String rv_title = request.getParameter("rv_title");
			String rv_content = request.getParameter("rv_content");
			String mb_id = request.getParameter("mb_id");
			
			int res = biz.update(new ReviewDto(rv_no, rv_title, rv_content, null, 0, mb_id));
			
			if(res > 0) {
				response.sendRedirect("ReviewController.do?command=review_list&nt_no=1");
			} 
			
		} else if(command.equals("delete")) {
		
			int rv_no = Integer.parseInt(request.getParameter("rv_no"));
			String mb_id = request.getParameter("mb_id");
			
			int res = biz.delete(rv_no, mb_id);
			
			if(res > 0) {
				response.sendRedirect("ReviewController.do?command=review_list&nt_no=1");
			}
			
		} else if(command.equals("review_list")) {
			
			int num = Integer.parseInt(request.getParameter("nt_no"));
			if(num == 0) {
				num = 1;
			} 
			PagingDto dto = new PagingDto();
			dto.setCountList(biz.countPage());
			
			if(num > dto.getCountList()/10+1) {
				num = dto.getCountList()/10+1;
			}
			dto.setStartList(num);
			dto.setLastList(num);			
			dto.setStartPage();
			dto.setLastPage();
			
			List<ReviewDto> list = biz.selectList(dto);
			request.setAttribute("nt_no", num);
			request.setAttribute("paging", dto);
			request.setAttribute("list", list);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("review_list.jsp");
			dispatch.forward(request, response);
			
		} else if(command.equals("go_login")) {
			String next = request.getParameter("next");
			
			RequestDispatcher dispatch = request.getRequestDispatcher("login.jsp?next="+next);
			dispatch.forward(request, response);
		}
		
		
		
	}

}
