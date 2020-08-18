package com.atg.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class SendEmailUtills extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "seungmimo032");//서버 아이디만 쓰기 
		props.put("mail.smtp.host", "smtp.gmail.com");//구글 SMTP
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable", "true"); 
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		
		Authenticator auth = new MyAuthentication();
		
		//session 생성 및 MimeMessage 생성
		Session session = Session.getDefaultInstance(props,auth);
		MimeMessage msg = new MimeMessage(session);
		
		int result = 1;
		
		
		try {
			//편지 보낸시간
			msg.setSentDate(new Date());
			
			InternetAddress from = new InternetAddress("ATG@gmail.com");
			
			//이메일 발신자 
			msg.setFrom(from);
			
			//이메일 수신자 
			String email = request.getParameter("receiver"); // 사용자가입력한 메일받아오기
			
			System.out.println(email+"사용자이메일 갖고온것");
			
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			
			//이메일 제목
			msg.setSubject("비밀번호 인증번호", "UTF-8");
			
			//이메일 내용
			String code = request.getParameter("random");//인증번호 값 받기
			
			
			
			request.setAttribute("code", code);
			msg.setText(code,"UTF-8");
			
			//이메일 헤더
			msg.setHeader("content-Type", "text/html");
			
			//메일 보내기
			
			javax.mail.Transport.send(msg);
			System.out.println("보냄");
			
		} catch (AddressException e) {
			e.printStackTrace();
			result = 0;
		} catch (MessagingException e) {
			e.printStackTrace();
			result = 0;
		}
		
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		
		PrintWriter pw = response.getWriter();
		pw.println(obj.toJSONString());
	}
	class MyAuthentication extends Authenticator{
		
		PasswordAuthentication pa;
		
		
		public MyAuthentication() {
			String id ="seungmimo032@gmail.com";  // 구글 ID
			String pw = "5899tmdals~"; // 구글 비밀번호
			
			
			System.out.println("구글아이디 비밀번호");
			
			//ID와 비밀번호를 입력한다.
			pa = new PasswordAuthentication(id, pw);
 		}
		
		//시스템에서 사용하는 인증정보
		
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
		
		
	}
	
    public SendEmailUtills() {
    
    }
}
