package com.atg.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.atg.Notice.biz.NoticeBiz;
import com.atg.Notice.biz.NoticeBizImpl;
import com.atg.Notice.dto.NoticeDto;
import com.atg.paging.dto.PagingDto;

@WebServlet("/notice.do")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		NoticeBiz biz = new NoticeBizImpl();
		
		if(command.equals("notice_detail")) {
			int nt_no = Integer.parseInt(request.getParameter("nt_no"));
			
			NoticeDto dto = biz.selectOne(nt_no);
			
			request.setAttribute("dto", dto);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("notice_detail.jsp");
			dispatch.forward(request, response);
			
			
		} else if(command.equals("notice_write")) {
			String nt_title = request.getParameter("nt_title");
			String nt_content = request.getParameter("nt_content");
			
			int res = biz.insert(new NoticeDto(0, nt_title, nt_content, null));
			
			if(res > 0) {
				response.sendRedirect("adminpage.jsp");
			} else {
				response.sendRedirect("notice_write.jsp");
			}
			
			
		} else if(command.equals("notice_update")) {
			int nt_no = Integer.parseInt(request.getParameter("nt_no"));
			String nt_title = request.getParameter("nt_title");
			String nt_content = request.getParameter("nt_content");
			
			int res = biz.update(new NoticeDto(nt_no, nt_title, nt_content));
			
			if(res > 0) {
				response.sendRedirect("adminpage.jsp");
			}
			
			
		} else if(command.equals("delete")) {
			int nt_no = Integer.parseInt(request.getParameter("nt_no"));
			
			int res = biz.delete(nt_no);
			
			if(res > 0) {
				response.sendRedirect("adminpage.jsp");
			}
			
			
		} else if(command.equals("notice_user_detail")) {
			int nt_no = Integer.parseInt(request.getParameter("nt_no"));
			
			NoticeDto dto = biz.selectOne(nt_no);
			
			request.setAttribute("dto", dto);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("notice_user_detail.jsp");
			dispatch.forward(request, response);
			
			
		} else if(command.equals("notice_search")) {
			String search_op = request.getParameter("search_op");
			String search = request.getParameter("search");

			List<NoticeDto> list = biz.search(search_op, search);
			
			request.setAttribute("list", list);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("notice_search.jsp");
			dispatch.forward(request, response);
			
			
		}else if(command.equals("notice_list")) {
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
			
			List<NoticeDto> list = biz.selectList(dto);
			request.setAttribute("nt_no", num);
			request.setAttribute("paging", dto);
			request.setAttribute("list", list);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("notice_list.jsp");
			dispatch.forward(request, response);
		}  else if(command.equals("notice_user_search")) {
			String search_op = request.getParameter("search_op");
			String search = request.getParameter("search");

			List<NoticeDto> list = biz.search(search_op, search);
			
			request.setAttribute("list", list);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("notice_user_search.jsp");
			dispatch.forward(request, response);
		}
	}

}
