package jsp.guestbook.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.guestbook.model.GuestbookBean;
import jsp.guestbook.model.GuestbookDAO;

public class GuestbookReplyFormAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
	
		// �θ���� �۹�ȣ�� �����´�.
		int guestbook_no = Integer.parseInt(request.getParameter("num"));
		// ��� �ۼ� �� ���� �������� ���ư��� ���� ������ ��ȣ�� �ʿ��ϴ�.
		String pageNum = request.getParameter("page");

		// �θ� ������ ������ DB���� �����´�
		GuestbookDAO dao = GuestbookDAO.getInstance();
		GuestbookBean guestbook = dao.getGuestbook(guestbook_no);
		
		// ���� ������ ������ ��ȣ�� request�� �����Ѵ�.
		request.setAttribute("guestbook", guestbook);
		request.setAttribute("pageNum", pageNum);
		
		forward.setRedirect(false);
		forward.setNextPath("guestbook/GuestbookReplyForm.jsp");
		
		return forward;
	}
}
