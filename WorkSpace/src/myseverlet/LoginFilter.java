package myseverlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class LoginFilter implements Filter {  
	@Override
    public void init(FilterConfig filterConfig) throws ServletException {
       
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        //把ServletRequest和ServletResponse转换成真正的类型
        HttpServletRequest req = (HttpServletRequest)request;
        HttpSession session = req.getSession();

        //由于web.xml中设置Filter过滤全部请求，可以排除不需要过滤的url
        String requestURI = req.getRequestURI();
        if(requestURI.endsWith("LoginHandle.jsp") || requestURI.endsWith("exLogin.jsp")){
            chain.doFilter(request, response);
            return;
        }

        //判断用户是否登录，进行页面的处理
        if(null == session.getAttribute("UserName")){
            //未登录用户，重定向到登录页面
            ((HttpServletResponse)response).sendRedirect("exLogin.html");
            return;
        } else {
            //已登录用户，允许访问
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        
    }
}  