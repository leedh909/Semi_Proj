package jsp.guestbook.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;

public class GuestbookDeleteFormAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// 글번호를 가져온다.
		int guestbook_no = Integer.parseInt(request.getParameter("num"));
		
		request.setAttribute("guestbook_no", guestbook_no);
		
		forward.setRedirect(false);
		forward.setNextPath("guestbook/GuestbookDeleteForm.jsp");
		
		return forward;
	}
}
