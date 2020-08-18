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
import javax.websocket.SendResult;

import com.atg.Basket.biz.BasketBiz;
import com.atg.Basket.biz.BasketBizImpl;
import com.atg.Basket.dto.BasketDto;
import com.atg.Register.dto.RegisterDto;

@WebServlet("/Basketcontroller")
public class Basketcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Basketcontroller() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		BasketBiz biz = new BasketBizImpl();

		String command = request.getParameter("command");

		
		
		if (command.equals("gobasket")) {
			
			int mb_no = Integer.parseInt(request.getParameter("mb_no"));
			System.out.println(mb_no);
			
			//유효성검사
			if (mb_no == 0) { //로그인안되어 있으면
				int item_no = Integer.parseInt(request.getParameter("item_no"));
				String next = request.getParameter("next");
				
				
				dispatch(request, response, "login.jsp");
				
			}else {  //로그인이 되어있으면, 바로 insert
				
				int item_no = Integer.parseInt(request.getParameter("item_no"));
				int bas_count = Integer.parseInt(request.getParameter("count"));
				
				System.out.println(mb_no);
				System.out.println(item_no);
				System.out.println(bas_count);
				
				BasketDto dto = new BasketDto(0, mb_no, item_no, bas_count);
				int res = biz.insert(dto);
				
				if(res > 0) {
					//들어갔으면 장바구니 페이지로 보내기
					dispatch(request, response, "Basketcontroller.do?command=list"); 
					
				}else { //안들어갔으면, 다시 아이템디테일 페이지로
					dispatch(request, response, "itemdetail.jsp");
				}
			}
			
		//장바구니 리스트 출력
		}else if(command.equals("list")) {
				int mb_no = Integer.parseInt(request.getParameter("mb_no"));	
				
				List<BasketDto> list = biz.selectList(mb_no);
				request.setAttribute("list", list);
				
				dispatch(request, response, "basket.jsp");
			
			
		//여러개 삭제!		
		}else if(command.equals("muldel")) {
			int mb_no = Integer.parseInt(request.getParameter("mb_no"));

			String[] seq = request.getParameterValues("chk");

			if (seq == null || seq.length == 0) { //하나도 선택안했을때,

				dispatch(request, response, "Basketcontroller.do?command=list&mb_no="+mb_no);
				
			} else {
				int res = biz.multiDelete(seq);
				if (res > 0) { //값이 하나 들어가면, 
					
					dispatch(request, response, "Basketcontroller.do?command=list&mb_no="+mb_no);
					
				} else {
					
					dispatch(request, response, "Basketcontroller.do?command=list&mb_no="+mb_no);
					
				}
			}
			
			
		//결제하기 버튼!!!	
		}else if(command.equals("pay")) {
			int mb_no = Integer.parseInt(request.getParameter("mb_no"));
			int bas_no = Integer.parseInt(request.getParameter("bas_no"));
			
			BasketDto dto = biz.selectPay(mb_no, bas_no);
			
			request.setAttribute("dto", dto);
			
			dispatch(request, response, "basket_pay.jsp");
			
			
		//결제내역	
		}else if(command.equals("paylist")) {
			int mb_no = Integer.parseInt(request.getParameter("mb_no"));
			int bas_no = Integer.parseInt(request.getParameter("bas_no"));
			String bas_pay = request.getParameter("bas_pay");
			
			int res = biz.update(new BasketDto(bas_no, bas_pay));
			
			if(res > 0) {
				dispatch(request, response, "Basketcontroller.do?command=list&mb_no="+mb_no);
			}
			
		}
	}

	
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String res = "<script> alert('" + msg + "'); location.href='" + url + "'; </script>";
		out.print(res);
	}

	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
