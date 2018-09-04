package filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class JoinFilter extends HttpFilter{
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session= request.getSession();
		if(session.getAttribute("join")==null ) {
			response.sendRedirect(request.getContextPath()+"/join/join.jsp");
		}else if(session.getAttribute("join")!=null){
			chain.doFilter(request, response);
		}
		
		
	}
}
