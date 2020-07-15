package jsp.guestbook.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.guestbook.model.GuestbookDAO;

public class GuestbookPwCheckAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 파라미터 값을 가져온다.
		String inputPW = request.getParameter("pw");
		String g_no = request.getParameter("num");
		int guestbook_no = Integer.parseInt(g_no);
		
		GuestbookDAO dao = GuestbookDAO.getInstance();
		String dbPW = dao.getPassword(guestbook_no);
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		if(!dbPW.equals(inputPW))	
			out.println("0"); // 비밀번호가 틀릴 경우
		else	
			out.println("1"); // 비밀번호 일치
		
		out.close();
		return null;
	}
}
