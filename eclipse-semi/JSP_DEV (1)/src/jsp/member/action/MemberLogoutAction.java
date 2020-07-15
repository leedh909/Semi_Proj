package jsp.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;

/**
 *  �α׾ƿ� �۾��� ó���ϴ� Action Ŭ����
 */
public class MemberLogoutAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// �α׾ƿ��� ���ǿ� ��� ���̵� ���� �����Ѵ�.
		request.getSession().removeAttribute("sessionID");
		
		// �α׾ƿ� �� ����ȭ������ ���ư���.
		forward.setRedirect(true);
		forward.setNextPath("MainForm.do");
		
		return forward;
	}
}
