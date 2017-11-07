package handler.board;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import handler.CommandHandler;
 
public class BandGatherWriteProHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		String memId = (String) request.getSession().getAttribute("memId");
		String adId = (String) request.getSession().getAttribute("adId");
		
		// write text data
		BoardDataBean boardDto = new BoardDataBean();
		boardDto.setM_id(memId);
		boardDto.setA_id(adId);
		boardDto.setValue(Integer.parseInt(request.getParameter("value")));
		boardDto.setSubject(request.getParameter("subject"));
		boardDto.setReg_date(new Timestamp(System.currentTimeMillis()));
		boardDto.setContent(request.getParameter("content"));
		boardDto.setLocation(request.getParameter("location"));
		
		// if the session died
		if((adId == null || adId.equals("")) && (memId == null || memId.equals("")) ) {
			return "/board/gatherWritePro.jsp";
		}
		
		BoardDBBean boardDao = BoardDBBean.getInstance();
		int result = boardDao.insertArticle(boardDto);
		request.setAttribute("result", result);
		
		// write file data
		/*String path = application.getRealPath("/bandsave");
		new File(path).mkdir();
		MultipartRequest multi = new MultipartRequest(request, path, 
				1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
		String originName1 = multi.getOriginalFileName("load1");
		String systemName1 = multi.getFilesystemName("load1");
		
		FileDataBean fileDto = new FileDataBean();
		fileDto.setF_id(Integer.parseInt(request.getParameter("f_id")));
		fileDto.setOri(originName1);
		fileDto.setSys(systemName1);
		fileDto.setF_size(Integer.parseInt(request.getParameter("f_size")));
		
		int fileresult = boardDao.insertFile(fileDto);
		request.setAttribute("fileresult", fileresult);*/
		
		return "/board/gatherWritePro.jsp";
	}
}
