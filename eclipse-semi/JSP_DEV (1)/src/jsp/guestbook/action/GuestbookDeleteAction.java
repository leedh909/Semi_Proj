package jsp.guestbook.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.guestbook.model.GuestbookDAO;

public class GuestbookDeleteAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// �Ķ���� ���� �����´�.
		String inputPW = request.getParameter("pw");
		String g_no = request.getParameter("num");
		int guestbook_no = Integer.parseInt(g_no);
		
		GuestbookDAO dao = GuestbookDAO.getInstance();
		String dbPW = dao.getPassword(guestbook_no);
		
		// ��й�ȣ�� Ʋ�� ���
		if(!dbPW.equals(inputPW))
		{	
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("0");
			out.close();

			return null;
		}

		boolean result = dao.deleteGuestbook(guestbook_no);
		if(result){
			forward.setRedirect(true);
			forward.setNextPath("GuestbookListAction.ge");	
		}
		else 
			return null;

		return forward;	
	}
}
