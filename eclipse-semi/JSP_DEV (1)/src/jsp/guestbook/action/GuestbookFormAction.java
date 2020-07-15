package jsp.guestbook.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;

/**
 * 화면 전환을 처리하는 Action
 *
 */
public class GuestbookFormAction implements Action
{
	private String path = "MainForm.jsp?contentPage=guestbook/GuestbookForm.jsp";

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setNextPath(path);
		
		return forward;
	}
}
