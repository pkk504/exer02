package handlers;

import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/*
 * application Event�� Listener 2�� 
 *  
 *  - ServletContextListener: init, destroy
 *  
 *  - ServletContextAttributeListener : setAttribute, removeAttribute
 *  
 *  
 *  # ��� �����ʴ� ����� �ʿ���.(�˾Ƽ� �������� �ʴ´�.)(web.xml Ȯ��)
 */


public class ApplicationHandler implements ServletContextListener{
long begin;
Date i1;
@Override
public void contextInitialized(ServletContextEvent sce) {//���������
	   try {
		 	Class.forName("oracle.jdbc.driver.OracleDriver");
		   } catch(Exception e) {
			e.printStackTrace();
		   }
				
	System.out.println("contextInitialized..");
	begin = System.currentTimeMillis();
	//i1= new Date(begin);
	//System.out.println(i1);
	
	/*
	 * �Ű������� �����ִ� ServletContextEvent�� ���ؼ�
	 * application�� �����Ҽ� �ִ�.
	 */
	ServletContext ctx=sce.getServletContext();
	//JSP���� ���Ǵ� application �̶�� �̸��� ��ü.
	int r=(int)(Math.random()*10);
	ctx.setAttribute("r", r);
	ctx.setRequestCharacterEncoding("UTF-8"); // Listener������ ����
											//Servlet������������ ���� �޼���
	ctx.setSessionTimeout(1);
	System.out.println("done!");

}

@Override
	public void contextDestroyed(ServletContextEvent sce) {//��Ʈ���� �ɶ�
		System.out.println("contextDestroyed..");
		long end =System.currentTimeMillis();
		System.out.println("running time.." +(end-begin)+" ms");
		
	}
}
