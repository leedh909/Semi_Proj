package jsp.guestbook.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.guestbook.model.GuestbookBean;
import jsp.guestbook.model.GuestbookDAO;

public class GuestbookWriteAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("euc-kr"); // 인코딩
		ActionForward forward = new ActionForward();
		
		// 파리미터를 가져온다.
		String guestbook_id = request.getParameter("guestbook_id");
		String guestbook_password = request.getParameter("guestbook_password");
		String guestbook_content = request.getParameter("guestbook_content");

		GuestbookDAO dao = GuestbookDAO.getInstance();
	
		// 파라미터 값을 GuestbookBean에 세팅한다.
		GuestbookBean guestbook = new GuestbookBean();
		guestbook.setGuestbook_no(dao.getSeq());
		guestbook.setGuestbook_id(guestbook_id);
		guestbook.setGuestbook_password(guestbook_password);
		guestbook.setGuestbook_content(guestbook_content);
	
		boolean result = dao.guestbookInsert(guestbook);
		
		if(result){
			forward.setRedirect(true);
			forward.setNextPath("GuestbookListAction.ge");
		}
		
		return forward;
	}
}