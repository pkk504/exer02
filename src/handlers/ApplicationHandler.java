package handlers;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

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
	   Set<String> set=new LinkedHashSet<>();
				
	System.out.println("contextInitialized..");
	begin = System.currentTimeMillis();
	//i1= new Date(begin);
	//System.out.println(i1);
	
	/*
	 * �Ű������� �����ִ� ServletContextEvent�� ���ؼ�
	 * application�� �����Ҽ� �ִ�.
	 */
	ServletContext ctx=sce.getServletContext();
	ctx.setAttribute("users", new LinkedHashSet<>());
	
	
	//JSP���� ���Ǵ� application �̶�� �̸��� ��ü.
	int r=(int)(Math.random()*10);
	ctx.setAttribute("r", r);
	ctx.setRequestCharacterEncoding("UTF-8"); // Listener������ ����
											//Servlet������������ ���� �޼���
	/*ctx.setSessionTimeout(1);*/
	System.out.println("done!");

}

@Override
	public void contextDestroyed(ServletContextEvent sce) {//��Ʈ���� �ɶ�
		System.out.println("contextDestroyed..");
		long end =System.currentTimeMillis();
		
		
		System.out.println("running time.." +(end-begin)+" ms");
		
		
	}
}
