package handler.download;

import java.io.File;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import handler.CommandHandler;

public class FileUploadHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
	request.setCharacterEncoding("utf-8");
		
	String path = request.getSession().getServletContext().getRealPath("/save");
	new File( path ).mkdir();
	
	request.setAttribute("path", path);
	
	MultipartRequest multi 
		= new MultipartRequest( request, path, 1024*1024*10, 
			"utf-8", new DefaultFileRenamePolicy() );
	request.setAttribute("multi", multi);
	
	String originName1 = multi.getOriginalFileName( "file1" );
	String systemName1 = multi.getFilesystemName( "file1" );
	String title = multi.getParameter("title");
	
	request.setAttribute("originName1", originName1);
	request.setAttribute("systemName1", systemName1);
	request.setAttribute("title", title);

	String originName11 = URLEncoder.encode( originName1, "utf-8" );
	String systemName11 = URLEncoder.encode( systemName1, "utf-8" );
	
	request.setAttribute("originName11", originName11);
	request.setAttribute("systemName11", systemName11);

		return "/board/fileUpload.jsp";
	}

}
