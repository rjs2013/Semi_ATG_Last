package com.atg.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.atg.Cal.biz.CalBiz;
import com.atg.Cal.biz.CalBizImpl;
import com.atg.Cal.dto.CalDto;
import com.atg.util.Utils;

@WebServlet("/cal.co")
public class CalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public CalController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		CalBiz cal_biz = new CalBizImpl();
		
		if(command.equals("calendar")) {
			response.sendRedirect("mypage.jsp");
		} else if(command.equals("cal_insert")) {
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String date = request.getParameter("date");
			String hour = request.getParameter("hour");
			String min = request.getParameter("min");
			
			String ca_mdate = year + Utils.isTwo(month) + Utils.isTwo(date) + Utils.isTwo(hour) + Utils.isTwo(min);
			
			String mb_id = request.getParameter("mb_id");
			String ca_title = request.getParameter("ca_title");
			String ca_content = request.getParameter("ca_content");
			
			int res = cal_biz.insertCal(new CalDto(0, ca_title, ca_content, ca_mdate, null, mb_id));
			
			if(res > 0) {
				response.sendRedirect("mypage.jsp");
			} 
		} else if(command.equals("cal_list")) {
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String date = request.getParameter("date");
			String yyyyMMdd = year + Utils.isTwo(month) + Utils.isTwo(date);
			
			String mb_id = request.getParameter("mb_id");
			
			List<CalDto> list = cal_biz.getCalList(mb_id, yyyyMMdd);
			
			request.setAttribute("list", list);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("mypage.jsp");
			dispatch.forward(request, response);
		} else if(command.equals("cal_detail")) {
			int ca_no = Integer.parseInt(request.getParameter("ca_no"));
			
			CalDto dto = cal_biz.selectOne(ca_no);
			
			request.setAttribute("dto", dto);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("cal_detail.jsp");
			dispatch.forward(request, response);
		} else if(command.equals("cal_update")) {
			int ca_no = Integer.parseInt(request.getParameter("ca_no"));
			String ca_title = request.getParameter("ca_title");
			String ca_content = request.getParameter("ca_content");
		
			int res = cal_biz.update(new CalDto(ca_no, ca_title, ca_content));
			
			if(res > 0) {
				RequestDispatcher dispatch = request.getRequestDispatcher("mypage.jsp");
				dispatch.forward(request, response);
			}
		} else if(command.equals("cal_delete")) {
			int ca_no = Integer.parseInt(request.getParameter("ca_no"));
			
			int res = cal_biz.delete(ca_no);
			
			if(res > 0) {
				response.sendRedirect("mypage.jsp");
			}
		} else if(command.equals("calListView")) {
			String mb_id = request.getParameter("mb_id");
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String date = request.getParameter("date");
			
			String yyyyMMdd = year + Utils.isTwo(month) + Utils.isTwo(date);
			List<CalDto> list = cal_biz.getCalList(mb_id, yyyyMMdd);
			
			request.setAttribute("list", list);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("cal_list.jsp");
			dispatch.forward(request, response);
			
	}
		
	}

}
