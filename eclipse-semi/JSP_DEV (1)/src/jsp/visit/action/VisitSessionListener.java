package jsp.visit.action;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import jsp.visit.model.VisitCountDAO;


/**
 * �湮�� ���� ����ϴ� Ŭ����<br>
 * web.xml�� listener ����� �صξ���. �̷��� �� ��� ��Ĺ�� ����Ǹ鼭
 * �����ʰ� ����ȴ�. 
 */
public class VisitSessionListener implements HttpSessionListener
{

	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {
		
		// ������ ���� �����Ǹ� execute() �����Ѵ�.
		if(sessionEve.getSession().isNew()){
	    	execute(sessionEve);
	    }
	}

	private void execute(HttpSessionEvent sessionEve) 
	{
		VisitCountDAO dao = VisitCountDAO.getInstance();
		
		try {
			// ��ü �湮�� �� ����
			dao.setTotalCount();
			// �� �湮�� ��
			int totalCount = dao.getTotalCount();
			// ���� �湮�� ��
			int todayCount = dao.getTodayCount();
			
			HttpSession session = sessionEve.getSession();
			
			// ���ǿ� �湮�� ���� ��´�.
	        session.setAttribute("totalCount", totalCount); 
	        session.setAttribute("todayCount", todayCount);
			
		} catch (Exception e) {
			System.out.println("===== �湮�� ī���� ���� =====\n");
			e.printStackTrace();
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {}

}
