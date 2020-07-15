package jsp.guestbook.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.guestbook.model.GuestbookBean;
import jsp.guestbook.model.GuestbookDAO;

public class GuestbookUpdateAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("euc-kr");
		ActionForward forward = new ActionForward();
	
		GuestbookDAO dao = GuestbookDAO.getInstance();
		GuestbookBean guestbook = new GuestbookBean();
		
		// 파라미터 값을 가져온다.
		int guestbook_no = Integer.parseInt(request.getParameter("guestbook_no"));
		String guestbook_id = request.getParameter("guestbook_id");
		String guestbook_content = request.getParameter("guestbook_content");
		String pageNum = request.getParameter("page");
		
		guestbook.setGuestbook_no(guestbook_no);
		guestbook.setGuestbook_id(guestbook_id);
		guestbook.setGuestbook_content(guestbook_content);
		
		boolean result = dao.updateGuestbook(guestbook);
		
		if(result){
			forward.setRedirect(true);
			forward.setNextPath("GuestbookListAction.ge?page="+pageNum);
		}
		else
			return null;
		
		return forward;
	}
}
