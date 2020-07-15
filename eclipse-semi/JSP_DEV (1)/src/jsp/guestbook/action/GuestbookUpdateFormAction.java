package jsp.guestbook.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.guestbook.model.GuestbookBean;
import jsp.guestbook.model.GuestbookDAO;

public class GuestbookUpdateFormAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		
		// 방명록 글번호와 페이지 번호를 가져온다.
		int guestbook_no = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("page");
		
		// DB에서 해당 방명록의 정보를 가져온다.
		GuestbookDAO dao = GuestbookDAO.getInstance();
		GuestbookBean guestbook = dao.getGuestbook(guestbook_no);
		
		// 방명록의 정보와 페이지번호를 request에 세팅한다.
		request.setAttribute("guestbook", guestbook);
		request.setAttribute("pageNum", pageNum);
		
		forward.setRedirect(false);
		forward.setNextPath("guestbook/GuestbookUpdateForm.jsp");
		
		return forward;
	}
}
