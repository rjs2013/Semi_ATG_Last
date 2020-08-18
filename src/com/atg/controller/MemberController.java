package com.atg.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/member.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		MemberBiz biz = new MemberBizImpl();
		
		if(command.equals("member_detail")) {
			int mb_no = Integer.parseInt(request.getParameter("mb_no"));
			
			MemberDto dto = biz.selectOne(mb_no);
			
			request.setAttribute("dto", dto);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("member_detail.jsp");
			dispatch.forward(request, response);
		} else if(command.equals("member_update")) {
			int mb_no = Integer.parseInt(request.getParameter("mb_no"));
			String mb_grade = request.getParameter("mb_grade");
			
			int res = biz.update(new MemberDto(mb_no, mb_grade));
			
			if(res > 0) {
				response.sendRedirect("adminpage.jsp");
			}
		} else if(command.equals("member_search")) {
			String search_op = request.getParameter("search_op");
			String search = request.getParameter("search");

			List<MemberDto> list = biz.search(search_op, search);
			
			request.setAttribute("list", list);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("member_search.jsp");
			dispatch.forward(request, response);
			
			
		} else if(command.equals("member_pw_check")) {			// 비밀번호 확인(비밀번호가 맞으면 개인정보 수정 창으로)
			int mb_no = Integer.parseInt(request.getParameter("mb_no"));
			String mb_pw = request.getParameter("pw_check");
			
			MemberDto dto = biz.privarcy(mb_no, mb_pw);
			
			if(dto != null) {
				request.setAttribute("dto", dto);
				
				RequestDispatcher dispatch = request.getRequestDispatcher("member_privarcy_update.jsp");
				dispatch.forward(request, response);
			} else {
				jsResponse("패스워드를 다시 입력해주세요", "member_pw_check.jsp", response);
			}
		} else if(command.equals("member_privarcy_update")) {		// 개인정보 수정(mb_addr값을 썼으면 새 주소로, 아니면 전 주소로)
			int mb_no = Integer.parseInt(request.getParameter("mb_no"));
			String mb_pw = request.getParameter("mb_pw");
			String mb_email = request.getParameter("email");
			String mb_addr1 = request.getParameter("addr1");
			String mb_addr2 = request.getParameter("addr2");
			String mb_addr3 = request.getParameter("addr3");

			String mb_addr=mb_addr1+"/"+mb_addr2+"/"+mb_addr3;
			
			if(mb_addr != null) {
				int res = biz.updateUser(new MemberDto(mb_no, mb_pw, mb_email, mb_addr));
				
				if(res > 0) {
					response.sendRedirect("main.jsp");
				}
			} else {
				String mb_ddr = request.getParameter("mb_addr");
				int res = biz.updateUser(new MemberDto(mb_no, mb_pw, mb_email, mb_addr));
				
				if(res > 0) {
					response.sendRedirect("main.jsp");
				}
			}
		} else if(command.equals("delete")) {
			int mb_no = Integer.parseInt(request.getParameter("mb_no"));
			
			int res = biz.delete(mb_no);
			
			if(res > 0) {
				jsResponse("탈퇴가 완료되었습니다.", "main.jsp", response);
			}
		}
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String res = "<script> alert('" + msg + "'); location.href='" + url + "'; </script>";
		out.print(res);
	}

}
