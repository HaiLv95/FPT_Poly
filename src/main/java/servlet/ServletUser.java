package servlet;

import dao.UserDAO;
import model.User;
import org.apache.commons.beanutils.BeanUtils;
import support.PageInfo;
import support.PageType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet({
        "/User",
        "/Admin",
        "/Sign-in",
        "/User/Sign-up",
        "/Sign-out",
        "/User/Edit-profile",
        "/User/Forgot-password",
        "/User/Change-password",
        "/Admin/Edit-profile",
        "/Admin/Forgot-password",
        "/Admin/Change-password",
        "/Admin/Sign-up",

})
public class ServletUser extends HttpServlet {
    HttpSession session;

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    public void destroy() {
        session.setAttribute("user", null);
        session.setAttribute("remember", null);
        super.destroy();
    }


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        session = req.getSession();
        String uri = req.getRequestURI().toLowerCase();
        if (uri.contains("sign-in")) {
            doSignin(req, resp);
        }  else if (uri.contains("sign-up")) {
            doSignup(req, resp);
        } else if (uri.contains("sign-out")) {
            session.setAttribute("user", null);
            PageInfo.prepareAndForward(req, resp, PageType.SITE_HOME);
        } else  if (uri.contains("edit-profile")){
                doEditprofile(req, resp);
        }else if(uri.contains("user/change-password")){
                doChangePassword(req,resp);
        }
    }

    public void doSignin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PageType pageType = PageType.SITE_SIGNIN_USER;
        UserDAO userDAO = new UserDAO();
        String method = req.getMethod();
        User usSession = (User) session.getAttribute("user");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");
        if (session.getAttribute("remember") != null){
            req.setAttribute("username", usSession.getUsername());
            req.setAttribute("password", usSession.getPassword());
        }
        User user;
        if (method.equalsIgnoreCase("Post")) {
            try {
                user = userDAO.findById(username);
                if (password.equals(user.getPassword())) {
                        session.setAttribute("user", user);
                    if (remember != null) {
                        session.setAttribute("remember", "remember");
                    } else {
                        session.setAttribute("remember", null);
                    }
                    req.setAttribute("msg", "Đăng nhập thành công");
                    pageType = PageType.SITE_HOME;
                } else {
                    req.setAttribute("msgFailed", "Sai tài khoản hoặc mật khẩu");
                }
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("msgFailed", "Đăng nhập không thành công" + e);
            }
        }
        PageInfo.prepareAndForward(req, resp, pageType);
    }

    public void doSignup(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PageType pageType = PageType.SITE_REGISTER_USER;
        UserDAO userDAO = new UserDAO();
        String method = req.getMethod();
        User user = new User();
        if (method.equalsIgnoreCase("Post")) {
            try {
                BeanUtils.populate(user, req.getParameterMap());
                userDAO.insert(user);
                req.setAttribute("msg", "Đăng ký thành công");
                pageType = PageType.SITE_SIGNIN_USER;
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("msgFailed", "Đăng ký không thành công" + e);
            }
        }
        PageInfo.prepareAndForward(req, resp, pageType);
    }
    public void doEditprofile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PageType pageType = PageType.SITE_EDIT_PROFILE;
        UserDAO userDAO = new UserDAO();
        String method = req.getMethod();
        User user = (User) session.getAttribute("user");
        if (method.equalsIgnoreCase("Post")) {
            try {
                if (req.getParameter("passwordcf").equals(user.getPassword())){
                    BeanUtils.populate(user, req.getParameterMap());
                    userDAO.update(user);
                    req.setAttribute("msg", "Cập nhật thông tin thành công");
                }else {
                    req.setAttribute("msgFailed", "Mật khẩu không chính xác!");
                }
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("msgFailed", "Cập nhật không thành công không thành công" + e);
            }
        }
        PageInfo.prepareAndForward(req, resp, pageType);
    }
    protected void doChangePassword(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException{
        PageType pageType = PageType.SITE_CHANGE_PASSWORD;
        UserDAO userDAO = new UserDAO();
        String method = req.getMethod();
        User user = (User) session.getAttribute("user");
        if (method.equalsIgnoreCase("Post")){
            try {
                BeanUtils.populate(user, req.getParameterMap());
                userDAO.update(user);
                req.setAttribute("msg", "Đổi mật khẩu thành công");
                pageType = PageType.SITE_SIGNIN_USER;
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("msgFailed", "Đổi mật khẩu không thành công không thành công" + e);
            }
        }
        PageInfo.prepareAndForward(req, resp, pageType);
    }
}
