package jsp.member.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;

/**
 * ��� ȸ�������� �����ִ� Action
 */
public class MemberListAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// ȸ�������� �����´�.
		MemberDAO dao = MemberDAO.getInstance();
		ArrayList<MemberBean> memberList = dao.getMemberList();
		
		// MemberListForm.jsp�� ȸ�������� �����ϱ� ���� request�� MemberBean�� �����Ѵ�.
		request.setAttribute("memberList", memberList);

		// request�� �����ؾ� �ϹǷ� setRedirect(false)�� �����Ѵ�.
		forward.setRedirect(false);
		forward.setNextPath("MemberListForm.do");
		
		return forward;
	}
}
