package handler.download;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;

public class FileDeleteHandler implements CommandHandler{

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      
      String folder = request.getSession().getServletContext().getRealPath("/save/");
      String delname = request.getParameter("originName");
      
      File file = new File(folder+delname);
      
      int result = 0;
      
      if(file.exists()) {
         file.delete();
         result = 1;
      } 
      request.setAttribute("result", result);
      
      return "/board/fileDelete.jsp";
   }

}