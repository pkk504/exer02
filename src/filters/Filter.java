package filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Filter extends HttpFilter{
	

 
protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
		throws IOException, ServletException {
	 HttpSession session =request.getSession();
	String query= request.getQueryString();
		String uri = request.getRequestURI();
	
		
		
	 
	if(session.getAttribute("loginid")!=null) {
		
			
	
		chain.doFilter(request, response);
		session.removeAttribute("uri");
		session.removeAttribute("query");
		
	 
	}else if(session.getAttribute("loginid")==null){
		session.setAttribute("uri", uri);
		session.setAttribute("query", query);
	
		response.sendRedirect("/index.jsp");
	}


	
	
	
}
}
 
 
 

