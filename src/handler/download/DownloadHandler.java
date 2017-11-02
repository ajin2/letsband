package handler.download;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;

public class DownloadHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String folder = request.getSession().getServletContext().getRealPath("/save");
		File file = new File(folder);
		
		int result = 0;
		// result == 0 폴더 없음
		// result == 1 폴더 있음
		
		if(file.isDirectory()) {
			result = 1;
		} 
		request.setAttribute("result", result);
		
		File[] list = file.listFiles();
		request.setAttribute("list", list);
		
		return "/board/download.jsp";
	}
}
