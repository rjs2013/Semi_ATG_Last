package com.atg.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.atg.Member.biz.MemberBiz;
import com.atg.Member.biz.MemberBizImpl;
import com.atg.Member.dto.MemberDto;
import com.atg.Notice.biz.NoticeBiz;
import com.atg.Notice.biz.NoticeBizImpl;
import com.atg.Notice.dto.NoticeDto;
import com.atg.paging.dto.PagingDto;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		NoticeBiz notice_biz = new NoticeBizImpl();
		MemberBiz member_biz = new MemberBizImpl();
		
		if(command.equals("admin_list")) {
			
			int notice_num = Integer.parseInt(request.getParameter("notice_no"));
			if(notice_num == 0) {
				notice_num = 1;
			} 
			PagingDto notice_dto = new PagingDto();
			notice_dto.setCountList(notice_biz.countPage());
			
			if(notice_num > notice_dto.getCountList()/10+1) {
				notice_num = notice_dto.getCountList()/10+1;
			}
			notice_dto.setStartList(notice_num);
			notice_dto.setLastList(notice_num);			
			notice_dto.setStartPage();
			notice_dto.setLastPage();
			
			List<NoticeDto> notice_list = notice_biz.selectList(notice_dto);
			request.setAttribute("notice_no", notice_num);
			request.setAttribute("notice_paging", notice_dto);
			request.setAttribute("notice_list", notice_list);
			
			int member_num = Integer.parseInt(request.getParameter("member_no"));
			if(member_num == 0) {
				member_num = 1;
			} 
			PagingDto member_dto = new PagingDto();
			member_dto.setCountList(member_biz.countPage());
			
			if(member_num > member_dto.getCountList()/10+1) {
				member_num = member_dto.getCountList()/10+1;
			}
			member_dto.setStartList(member_num);
			member_dto.setLastList(member_num);			
			member_dto.setStartPage();
			member_dto.setLastPage();
			
			List<MemberDto> member_list = member_biz.selectList(member_dto);
			
			request.setAttribute("member_no", member_num);
			request.setAttribute("member_paging", member_dto);
			request.setAttribute("member_list", member_list);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("adminpage.jsp");
			dispatch.forward(request, response);
			
			
		}
	}

}
