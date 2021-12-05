package servlet;

import dao.UserDAO;
import model.User;
import support.PageInfo;
import support.PageType;
import support.Support;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(
        "/forgot-password"
)
public class ServletForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PageInfo.prepareAndForward(request, response, PageType.SITE_FORGOT_PASSWORD);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method  = request.getMethod();
        UserDAO usDAO = new UserDAO();
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        if (method.equalsIgnoreCase("post")){
            try {
                User user = usDAO.findById(username);
                if (user != null){
                    if (email.equalsIgnoreCase(user.getEmail())){
                        Support support = new Support();
                        String subject = "POLY ONLINE ENTERTAMENT";
                        String content = "Your account password is: " + user.getPassword();
                        support.sendEmail(email, subject ,content);
                        request.setAttribute("msg", "Forgot password thành công. Vui lòng check email");
                        PageInfo.prepareAndForward(request, response, PageType.SITE_HOME);
                    }else {
                        request.setAttribute("msgFailed", "Email không đúng");
                        doGet(request, response);
                    }
                }else {
                    request.setAttribute("msgFailed", "Sai Username");
                    doGet(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msgFailed", e);
            }
        }
    }
}
