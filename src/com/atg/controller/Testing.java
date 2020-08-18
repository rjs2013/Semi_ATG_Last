package com.atg.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.atg.Itemsearch.api.R_GoogleVisionApi;

@WebServlet("/Testing")
@MultipartConfig(fileSizeThreshold=1024*1024*10,    // 10 MB 
            maxFileSize=1024*1024*50,         // 50 MB
            maxRequestSize=1024*1024*100)   // 100 MB
public class Testing extends HttpServlet {
   
   private static final long serialVersionUID = -4793303100936264213L;

   private static final String UPLOAD_DIR = "filefolder";

   public Testing() {

   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      doPost(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");

      // 서버의 실제 경로
      String applicationPath = request.getServletContext().getRealPath("");
      String uploadFilePath = applicationPath + UPLOAD_DIR;
      //String uploadFilePath = "D:/";

      System.out.println(" LOG :: [서버 루트 경로] :: " + applicationPath);
      System.out.println(" LOG :: [파일 저장 경로] :: " + uploadFilePath);

      // creates the save directory if it does not exists
      File fileSaveDir = new File(uploadFilePath);

      // 파일 경로 없으면 생성
      if (!fileSaveDir.exists()) {
         fileSaveDir.mkdirs();
      }

      String fileName = null;
      // Get all the parts from request and write it to the file on server
      for (Part part : request.getParts()) {
         //getPartConfig(part);
         fileName = getFileName(part);
         //System.out.println(" LOG :: [ 업로드 파일 경로 ] :: " + uploadFilePath + File.separator + fileName);
         part.write(uploadFilePath + File.separator + fileName);
      }
      
      // 구글비젼
      String[] list = null;
      try {
         list = R_GoogleVisionApi.detectLabels(uploadFilePath + File.separator + fileName);
      } catch (IOException e) {
         
         /*
          * request.setAttribute("itemName", ""); RequestDispatcher dispatcher =
          * request.getRequestDispatcher("itemsearch.jsp"); dispatcher.forward(request,
          * response);
          */
         
         PrintWriter out = response.getWriter();
         String res = "<script> alert('" +"운동기구를 찾는데 실패했습니다."+ "'); location.href='" +"itemsearch.jsp"+ "'; </script>";
         out.print(res);
               
         
         e.printStackTrace();
      }
      
      String[] compare = {"Dumbbell","Kettlebell","Ball","Stepper","Running Machine","Foam roller",
            "Hula hoop","Rowing machine","Push-up bar","Step box"};
      
      boolean stop = false;
      for(int i = 0; i <= compare.length; i ++) {
                  
         for(int j = 0; j < list.length; j++) {
            
            if(list[j].equals(compare[i])) {
               
               System.out.println("찾아따");
                              
               request.setAttribute("itemName", list[j]);
               RequestDispatcher dispatcher = request.getRequestDispatcher("itemsearch.jsp");
               dispatcher.forward(request, response);
               
               stop = true;
               break;
            } 
            
         }
         
         if(stop == true) {            
            break;
         }
         
         //System.out.println(i+" / "+compare.length);
         if (i >= compare.length-1) {
            
            System.out.println("못찾아따");
            
            request.setAttribute("itemName", "해당 운동기구를 찾지 못했습니다.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("itemsearch.jsp");
            dispatcher.forward(request, response);
            
            break;
         }
      }
      
   }
   
   /*
   private void getPartConfig(Part part) {
      System.out.println("------------------------------------------------------------");
      System.out.println(" LOG :: [HTML태그의 폼태그 이름] :: " + part.getName());
      System.out.println(" LOG :: [ 파일 사이즈 ] :: " + part.getSize());
      for (String name : part.getHeaderNames()) {
         System.out.println(" LOG :: HeaderName :: " + name + ", HeaderValue :: " + part.getHeader(name) + "\n");
      }
      System.out.println("------------------------------------------------------------");
   }
   */
   private String getFileName(Part part) {
      String contentDisp = part.getHeader("content-disposition");
      //System.out.println(" LOG :: content-disposition 헤더 :: = " + contentDisp);
      String[] tokens = contentDisp.split(";");
      for (String token : tokens) {
         if (token.trim().startsWith("filename")) {
            //System.out.println(" LOG :: 파일 이름 :: " + token);
            return token.substring(token.indexOf("=") + 2, token.length() - 1);
         }
      }
      return "";
   }

}