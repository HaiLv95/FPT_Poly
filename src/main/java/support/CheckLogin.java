package support;

import model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebFilter({"/User/*", "/Admin/*"})
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
            if (uri.contains("/Admin")){
                if (!user.getAdmin()){
                    httpServletRequest.setAttribute("msgFailed", "Truy cập không hợp lệ");
                    PageInfo.prepareAndForward(httpServletRequest, httpServletResponse, PageType.SITE_HOME);
                }
            }
            chain.doFilter(request, response);
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
