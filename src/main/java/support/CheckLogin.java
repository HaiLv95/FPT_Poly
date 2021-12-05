package support;

import model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebFilter({"/user/*", "/admin/*"})
public class CheckLogin implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpSession session = httpServletRequest.getSession();
        String uri = httpServletRequest.getRequestURI();
        User user = (User) session.getAttribute("user");
        if (user == null){
            httpServletRequest.setAttribute("msgFailed", "Bạn chưa đăng nhập");
            PageInfo.prepareAndForward(httpServletRequest, httpServletResponse, PageType.SITE_SIGNIN_USER);
        }else {
            if(uri.contains("/admin/")){
                if (user.getAdmin()){
                    chain.doFilter(request, response);
                }else {
                    httpServletRequest.setAttribute("msgFailed", "Tài khoản của bạn không có quyền truy cập");
                    httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/home");
                }
            }else {
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
