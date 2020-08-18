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

import com.atg.Item.biz.ItemBiz;
import com.atg.Item.biz.ItemBizImpl;
import com.atg.Item.dto.ItemDto;


@WebServlet("/Itemcontroller")
public class Itemcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Itemcontroller() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ItemBiz biz = new ItemBizImpl();
		
		

		String command = request.getParameter("command");
		
		if(command.equals("itemlist")) {
			List<ItemDto> list = biz.selectList();
			request.setAttribute("list", list);
			
			dispatch(request, response, "item.jsp");
			
			
		}else if(command.equals("itemdetail")) {
			int item_no = Integer.parseInt(request.getParameter("item_no"));
			//int groupno = Integer.parseInt(request.getParameter("groupno"));
			
			ItemDto dto = biz.selectOne(item_no);
			request.setAttribute("dto", dto);
			
			
			dispatch(request, response, "itemdetail"+item_no+".jsp");
			
		}else if(command.equals("itemdetail2")) {
			int item_no = Integer.parseInt(request.getParameter("item_no"));
			
			ItemDto dto = biz.selectOne(item_no);
			request.setAttribute("dto", dto);
			//팝업창띄우기
			//dispatchPop(request, response, "itemdetail.jsp");
			
			//jsResPop("itemdetail.jsp", request, response);
			dispatch(request, response, "itemdetail.jsp");
		}
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String res = "<script> alert('" + msg + "'); location.href='" + url + "'; </script>";
		out.print(res);
	}
	
	private void jsResPop(String url,HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String res = "<script> window.open('basket_popup.jsp','','width=300px, height=300px');location.href='"+url+"';</script>";
		out.print(res);
		
	}

	private void dispatchPop(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		PrintWriter out = response.getWriter();
		String res = "<script> window.open('basket_popup.jsp','','width=300px, height=300px');</script>";
		out.print(res);
		dispatch.forward(request, response);
	}

	private void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}


}
