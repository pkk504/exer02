package handlers;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/*
 * ServletContextListener/
 * 	ServletContextAttributeListener�� ServletContext�� ���õ� �̺�Ʈ ������ ���ٸ�,
 * 
 * HttpSession�� ���õ� �̺�Ʈ �����ʸ� ���캸���� �ϴµ�
 * 	-HttpSessionListener : Session�� ���������, �ı��ɶ��� �̺�Ʈ ������
 * 	-HttpSessionAttributeListener : Session�� attribute�� ��ȭ�� �Ͼ���� �̺�Ʈ ������
 * 
 */

public class SessionHandler implements HttpSessionListener{
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		//���ο� ������ ������ �۵�.. ������ ���� �ʴ� ������� ���� ����� �۵�
		HttpSession session=se.getSession();
		System.out.println("[Session] created.."+session.getId());
		session.setAttribute("auth", false);
		ServletContext ctx = session.getServletContext();
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// �̹� ������ ������� ������ ������ �۵�...
		// ��ȿ�ð��� ���ŵ��� �ʰų�, invalidate() ��Ű�� �۵��ȴ�.
		HttpSession session = se.getSession();
		System.out.println("[Session] destroyed.."+session.getId());
		
		
	}
	
	
	
}
