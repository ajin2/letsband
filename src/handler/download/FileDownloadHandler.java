package handler.download;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;

public class FileDownloadHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String originName = request.getParameter( "originName" );
		String systemName = request.getParameter( "systemName" );
		originName = URLDecoder.decode( originName, "utf-8" );
		systemName = URLDecoder.decode( systemName, "utf-8" );
		
		request.setAttribute("originName", originName);
		request.setAttribute("systemName", systemName);

		//out.clear();
		//out = pageContext.pushBody();
		String path = request.getSession().getServletContext().getRealPath( "/save" );
		String fileName = path + "/" + systemName;
		
		request.setAttribute("path", path);
		request.setAttribute("fileName", fileName);
		
		BufferedInputStream bis 
			= new BufferedInputStream( new FileInputStream( fileName ) );
		
		BufferedOutputStream bos
			= new BufferedOutputStream( response.getOutputStream() );
		
		response.setContentType( "text/unknown" );
		response.setHeader( "content-disposition", 
			"attachment;filename=" 
			+ URLEncoder.encode( originName, "utf-8" ) + ";" );
		
		byte buffer[] = new byte[1024];
		int length = 0;
		while( ( length = bis.read( buffer, 0, buffer.length ) ) != -1 ) {
			bos.write( buffer, 0, length );
		}
		
		bis.close();
		bos.close();
			
		return "/board/fileDownload.jsp";
	}

}
