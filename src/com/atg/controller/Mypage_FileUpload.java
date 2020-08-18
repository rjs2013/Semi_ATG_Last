package com.atg.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.atg.Member.biz.MemberBiz;
import com.atg.Member.biz.MemberBizImpl;
import com.atg.Member.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;

/**
 * fileSizeThreshold 서버로 파일을 저장할 때 파일의 임시 저장 사이즈 maxFileSize 1개 파일에 대한 최대 사이즈
 * maxRequestSize 서버로 전송되는 request의 최대 사이즈
 * 
 * @author "SeokRae (kslbsh@gmail.com)"
 *         https://www.journaldev.com/2122/servlet-3-file-upload-multipartconfig-part
 */
@WebServlet("/UploadService")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100) // 100 MB
public class Mypage_FileUpload extends HttpServlet {

	private static final long serialVersionUID = -4793303100936264213L;

	//private static final String UPLOAD_DIR = "filefolder";
	
	public Mypage_FileUpload() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		int maxRequestSize = 1024 * 1024 * 100;
		String encType = "UTF-8";
		// G:\Semy\mypage\WebContent\resources\img
		
		// 서버경로로 수정필요!
		//String root = "/resources/img";
		final String filePath = "resources/img/";
		String root = request.getSession().getServletContext().getRealPath(filePath);
		
		// MultipartRequest multi = new MultipartRequest(request, root, maxRequestSize,
		// encType,new DefaultFileRenamePolicy());
		MultipartRequest multi = new MultipartRequest(request, root, maxRequestSize, encType);

		// creates the save directory if it does not exists
		File fileSaveDir = new File(root);

		// 파일 경로 없으면 생성
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}


		// UPDATE
		MemberBiz biz = new MemberBizImpl();

		Enumeration formNames = multi.getFileNames();
		String fileInput = "";
		String fileName = "";
		String type = "";
		File fileObj = null;
		String originFileName = "";
		String fileExtend = "";
		String fileSize = "";
		while (formNames.hasMoreElements()) {
			fileInput = (String) formNames.nextElement(); // 파일인풋 이름
			fileName = multi.getFilesystemName(fileInput); // 파일명
			if (fileName != null) {
				type = multi.getContentType(fileInput); // 콘텐트타입
				fileObj = multi.getFile(fileInput); // 파일객체
				originFileName = multi.getOriginalFileName(fileInput); // 초기 파일명
				fileExtend = fileName.substring(fileName.lastIndexOf(".") + 1); // 파일 확장자
				fileSize = String.valueOf(fileObj.length()); // 파일크기
			}
		}

		int mb_no = Integer.parseInt(multi.getParameter("mb_no"));
		String mb_name = multi.getParameter("mb_name");
		//String mb_photo = root + "/" + fileName;
		String mb_photo = fileName;
		
		System.out.println(mb_no + " ;; " + mb_name + " ;; " + mb_photo + " :: " + fileName);

		int res = biz.update_photo(new MemberDto(mb_no, mb_name, mb_photo));

		if (res > 0) {
			
			response.sendRedirect("mypage_fileio_end.jsp");
			//response.sendRedirect("mypage.jsp");
		} else {
			response.sendRedirect("mypage_fileio_fail.jsp");
		}

	}

}