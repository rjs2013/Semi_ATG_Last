package com.atg.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.atg.Inbody.biz.InbodyBiz;
import com.atg.Inbody.biz.InbodyBizImpl;
import com.atg.Inbody.dto.InbodyDto;
import com.atg.Register.dto.RegisterDto;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import oracle.sql.DATE;

/**
 * Servlet implementation class InbodyController
 */
@WebServlet("/InbodyController")
public class InbodyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InbodyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    InbodyBiz biz = new InbodyBizImpl();
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		InbodyBiz biz = new InbodyBizImpl();
		
		if(command.equals("test")) {
			//int mb_no = Integer.parseInt(request.getParameter("mb_no"));
			HttpSession session = request.getSession();
			RegisterDto LDto = (RegisterDto) session.getAttribute("LDto");
			int mb_no = LDto.getMb_no();
			
			List<InbodyDto> list = biz.selectList(mb_no);
			
			//JSONObject data = new JSONObject();
			
			JSONArray j = new JSONArray();
			JSONArray J = new JSONArray();	
			
			j.add("datetime");
			j.add("weight");
			j.add("bmi");
			J.add(j);
			
			for(InbodyDto dto : list) {
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String date = transFormat.format(dto.getIb_date());
				String[] dateType = date.split(" ");
				JSONArray j1 = new JSONArray();
				j1.add(dateType[0]);
				j1.add(dto.getWeight());
				j1.add(dto.getBmi());
				
				J.add(j1);
			}			
			
			response.getWriter().print(J);
		} else if(command.equals("inbody_insert")) {
			response.sendRedirect("inbodyinsert.jsp");
		} else if(command.equals("inbody_insertres")) {
			System.out.println(command);
			int mb_no = Integer.parseInt(request.getParameter("mb_no"));
			int height = Integer.parseInt(request.getParameter("height"));
			int weight = Integer.parseInt(request.getParameter("weight"));
			
			int res = biz.insertInbody(new InbodyDto(mb_no, weight, height, null));
			
			if(res > 0) {
				System.out.println("성공");
				response.sendRedirect("mypage.jsp");
			}
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
