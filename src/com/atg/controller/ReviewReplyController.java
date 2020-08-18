
package com.atg.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.atg.reviewReply.biz.ReviewReplyBiz;
import com.atg.reviewReply.biz.ReviewReplyBizImpl;
import com.atg.reviewReply.dto.ReviewReplyDto;

@WebServlet("/ReviewReplycontroller")
public class ReviewReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewReplyController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");


		HttpSession session = request.getSession();

		ReviewReplyBiz biz = new ReviewReplyBizImpl();


		String command = request.getParameter("command");
		System.out.println("command==>"+command);


	
			// 댓글 글작성  
		if (command.equals("ReviewReplyinsert")) {
			int rv_no = Integer.parseInt(request.getParameter("Rv_no"));
			String mb_id = request.getParameter("id");
			String RR_content = request.getParameter("content");
			System.out.println(rv_no+"리뷰번호"+mb_id+"내아이디"+RR_content+"내용");
			
			
			ReviewReplyDto dto = new ReviewReplyDto(0,rv_no,0,0,mb_id,RR_content,null);
			int res = biz.insert(dto);
			System.out.println("컨트롤러 res 부분 "+res);
			 if(res>0) { 
				 jsResponse(response, "ReviewController.do?command=detail&rv_no="+rv_no, "글작성 성공");
			 }else {
				 jsResponse(response, "ReviewController.do?command=detail&rv_no="+rv_no,"글작성 실패"); 
				 }
			
		}else if (command.equals("ReviewReplydelete")) {
			// 0809  컨트롤러 Lmb_id 값 추가 성고 실패 추가 biz패키지 ,dao 패키지 db mapper 수정 
			String Lmb_id = request.getParameter("id");
			
		
			
			int RR_no = Integer.parseInt(request.getParameter("rr_no"));
			int rv_no =	Integer.parseInt(request.getParameter("Rv_no"));
			System.out.println("삭제할 댓글번호 --->"+RR_no);
			int res = biz.delete(RR_no,Lmb_id);
			if(res>0) {
				jsResponse(response, "ReviewController.do?command=detail&rv_no="+rv_no, "삭제되었습니다.");
			}else{
				jsResponse(response, "ReviewController.do?command=detail&rv_no="+rv_no, "본인만 삭제 가능합니다.");
				
			}
			
			
		}else if (command.equals("RRupdate")) {
			int rv_no= Integer.parseInt(request.getParameter("Rv_no"));
			int rr_no = Integer.parseInt(request.getParameter("rr_no"));
			String Lmb_id =request.getParameter("id");
			String mb_id = request.getParameter("mb_id");
			String rr_content=request.getParameter("rr_content");
		
			System.out.println("댓글번호==>"+rr_no+"아이디==>"+mb_id+"내용==>"+rr_content);
			
			
			System.out.println("lmb_id====로그인 아이디 ========>"+Lmb_id);
			System.out.println("mb_id글수정====로그인 아이디 ========>"+mb_id);
			
			
		if(Lmb_id.equals(mb_id)){
		ReviewReplyDto dto = new ReviewReplyDto(rr_no,mb_id,rr_content);
		System.out.println("컨트롤러 dto값 ==>"+dto);
		
		int res = biz.update(dto);
		
		System.out.println("int res 값 ==>"+res);
		
		if(res>0) {
			jsResponse(response, "ReviewController.do?command=detail&rv_no="+rv_no, "수정성공");
		}else {
			jsResponse(response, "ReviewController.do?command=detail&rv_no="+rv_no, "수정실패");
		}
			}else {
				jsResponse(response, "ReviewController.do?command=detail&rv_no="+rv_no, "본인만 수정이가능합니다.");
			}
			
			
		}else if (command.equals("RR_Answer")) {
			int rv_no = Integer.parseInt(request.getParameter("Rv_no"));
			int parentRr_no = Integer.parseInt(request.getParameter("parentRr_no"));
			String mb_id= request.getParameter("mb_id");
			String AnswerContent = request.getParameter("AnswerContent");
			
			ReviewReplyDto dto = new ReviewReplyDto(parentRr_no,0,0,0,mb_id,AnswerContent,null);
			
			int res = biz.answerProc(dto);
			if(res>0) {
				jsResponse(response, "ReviewController.do?command=detail&rv_no="+rv_no, "답글성공");
			}else {
				jsResponse(response, "ReviewController.do?command=detail&rv_no="+rv_no, "답글실패");
			}
		}
		
		
		
		// 댓글 달기(글작성) =---------------------------------------------------------------------------
		/*
			 * else if(command.equals("ReplyInsert")) {
			 * 
			 * 
			 * String ReplyRv_no= request.getParameter("ReplyRv_no"); String ReplyId =
			 * request.getParameter("ReplyId"); String ReplyContent =
			 * request.getParameter("ReplyContent");
			 * 
			 * System.out.println("부모넘버값"+ReplyRv_no+"리플아이디값-->" + ReplyId + "리플내용값--->" +
			 * ReplyContent);
			 * 
			 * Map<String , String> param = new HashMap<String, String>();
			 * 
			 * param.put("rv_no", ReplyRv_no); param.put("mb_id", ReplyId);
			 * param.put("rr_content", ReplyContent);
			 * 
			 * 
			 * ReviewReplyDto dto = biz.insert(param);
			 * 
			 * 
			 * System.out.println("컨트롤부분'param' ==>"+param);
			 * 
			 * JSONObject obj = new JSONObject();
			 * 
			 * if(dto == null) { obj.put("result", "0"); }else { // 앞에 키 값은 뒤에는 value 값으로
			 * 앞에는 별칭으로 붙여주면된다. 뒤에는 해당 불러오는 키값으로 설정 obj.put("ReplyRv_no", dto.getRv_no());
			 * obj.put("ReplyId", dto.getMb_Id()); obj.put("ReplyContent",
			 * dto.getRr_content()); obj.put("result", "1");
			 * System.out.println("obj ====> "+obj); } PrintWriter pw =
			 * response.getWriter(); pw.println(obj.toJSONString());
			 * 
			 * 
			 * 
			 * 
			 * 
			 * //댓글삭제
			 * =---------------------------------------------------------------------------
			 * }else if (command.equals("ReplyReplyDelete")) { String RR_no =
			 * request.getParameter("RR_no"); System.out.println("RR_no"+RR_no);
			 * 
			 * Map<String, String> param= new HashMap<String, String>();
			 * 
			 * param.put("rr_no", RR_no); System.out.println("컨트롤러---->"+param);
			 * 
			 * 
			 * ReviewReplyDto dto = biz.delete(param);
			 * System.out.println("dto에 저장된값확인"+dto);
			 * 
			 * 
			 * JSONObject obj = new JSONObject();
			 * 
			 * if(dto == null) { obj.put("result", "0"); }else { obj.put("RR_no",
			 * dto.getRr_no()); obj.put("result", "1");
			 * System.out.println("obj컨트롤러=======>"+obj); } PrintWriter pw
			 * =response.getWriter(); pw.println(obj.toJSONString());
			 * 
			 * 
			 * 
			 * 
			 * 
			 * //댓글수정
			 * =----------------------------------------------------------------------------
			 * ------------ }else if(command.equals("ReplyReplyUpdate")) { String
			 * RR_content= request.getParameter("RR_content");
			 * System.out.println("RR_content 내용수정값====>"+RR_content);
			 * 
			 * Map<String, String> param = new HashMap<String, String>();
			 * System.out.println("param에 값 확인"+param); ReviewReplyDto dto =
			 * biz.delete(param); System.out.println("dto 값 저장확인"+dto);
			 * 
			 * JSONObject obj = new JSONObject();
			 * 
			 * if(dto ==null) { obj.put("result", "0"); }else {
			 * obj.put("RR_content",dto.getRr_content()); obj.put("Rr_no", dto.getRr_no());
			 * obj.put("result", "1");
			 * 
			 * System.out.println("obj else---->"+obj); } PrintWriter pw =
			 * response.getWriter(); pw.println(obj.toJSONString()); //writer(출력)
			 * 
			 * 
			 * 
			 * //---------------------------------------댓글 답변 부분 }else if
			 * (command.equals("ReplyReplyContent")) { String parentRR_no =
			 * request.getParameter("parentRR_no"); String ReReAnswerID =
			 * request.getParameter("ReReAnswerID"); String RRContent =
			 * request.getParameter("RRContent");
			 * 
			 * System.out.println("아이디 "+ReReAnswerID +"부모글번호"+parentRR_no +"내용"+RRContent);
			 * 
			 * Map<String, String> param = new HashMap<String, String>();
			 * param.put("ReReAnswerID", ReReAnswerID); param.put("parentRR_no",
			 * parentRR_no); param.put("RRContent", RRContent); int result =
			 * biz.answerProc(param);
			 * 
			 * if (result > 0) { this.jsResponse(response,
			 * "ReviewReplycontroller.do?command=ReviewReplylist", "답변작성성공"); } else {
			 * this.jsResponse(response, "ReviewReplycontroller.do?command=ReviewReplylist",
			 * "답변작성 실패"); }
			 * 
			 * }
			 */

	}
	private void jsResponse(HttpServletResponse response, String url, String msg) throws IOException {
		PrintWriter out = response.getWriter();
		String res = "<script> alert('"+msg+"'); location.href='"+url+"'; </script>";

		out.print(res);
	}

}
