package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import handler.CommandHandler;

public class BandGatherWriteFormHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		/*String id = (String) request.getSession().getAttribute("memId");
		
		if(id == null || id.equals("")) {
			id = (String) request.getSession().getAttribute("adminId");
		}
		*/
		
		return "/board/gatherWriteForm.jsp";
	}
}
