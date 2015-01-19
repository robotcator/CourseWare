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
        //��ServletRequest��ServletResponseת��������������
        HttpServletRequest req = (HttpServletRequest)request;
        HttpSession session = req.getSession();

        //����web.xml������Filter����ȫ�����󣬿����ų�����Ҫ���˵�url
        String requestURI = req.getRequestURI();
        if(requestURI.endsWith("LoginHandle.jsp") || requestURI.endsWith("exLogin.jsp")){
            chain.doFilter(request, response);
            return;
        }

        //�ж��û��Ƿ��¼������ҳ��Ĵ���
        if(null == session.getAttribute("UserName")){
            //δ��¼�û����ض��򵽵�¼ҳ��
            ((HttpServletResponse)response).sendRedirect("exLogin.html");
            return;
        } else {
            //�ѵ�¼�û����������
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        
    }
}  