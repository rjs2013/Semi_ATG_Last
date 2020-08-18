package com.atg.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.atg.Cal.biz.CalBiz;
import com.atg.Cal.biz.CalBizImpl;

import net.sf.json.JSONObject;

@WebServlet("/countajax.do")
public class CalCountAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CalCountAjax() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/json; charset=UTF-8");
		
		String mb_id = request.getParameter("mb_id");
		String yyyyMMdd = request.getParameter("yyyyMMdd");
		System.out.println("mb_id : " + mb_id + "\t yyyyMMdd : " + yyyyMMdd);
		
		CalBiz cal_biz = new CalBizImpl();
		
		int count = cal_biz.getViewCount(mb_id, yyyyMMdd);
		System.out.println("일정 갯수 : " + count);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("calcount", count);
		
		JSONObject obj = JSONObject.fromObject(map);
		PrintWriter out = response.getWriter();
		obj.write(out);
		

		
	}

}
