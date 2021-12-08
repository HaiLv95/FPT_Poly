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
import java.util.List;

@WebServlet({
        "/admin/user-manager",
        "/admin/user-editor",
        "/admin/delete-user",
        "/admin/user-add",
})
public class ServletUserManager extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        UserDAO userDAO = new UserDAO();
        String id = request.getParameter("id");
        if (uri.contains("user-manager") || uri.contains("user-add")){
            try {
                List<User> listUs = userDAO.findAll();
                request.setAttribute("listUs", listUs);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msgFailed", "Lỗi load danh sách người dùng");
            }
            PageInfo.prepareAndForward(request, response, PageType.SITE_USER_MANAGER);
        }else if(uri.contains("user-editor")){
            try {
                request.setAttribute("userEdit", userDAO.findById(id));
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msgFailed", "Lỗi cập nhật người dùng");
            }
            PageInfo.prepareAndForward(request, response, PageType.SITE_USER_EDITOR);
        }else if (uri.contains("delete-user")){
            try {
                userDAO.delete(id);
                request.setAttribute("msg", "Xóa người dùng thành công");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msgFailed", "Xóa người dùng thất bại");
            }
            PageInfo.prepareAndForward(request, response, PageType.SITE_USER_MANAGER);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        if (uri.contains("user-add")){
            doAddUser(request, response);
        }else if(uri.contains("user-editor")){
           doUpdateUser(request, response);
        }
    }
    public void doAddUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String method = req.getMethod();
        User userAdd = new User();
        UserDAO userDAO = new UserDAO();
        if (method.equalsIgnoreCase("post")){
            try {
                BeanUtils.populate(userAdd, req.getParameterMap());
                userDAO.insert(userAdd);
                resp.sendRedirect(req.getContextPath()+"/admin/user-manager");
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("msg", "Lỗi thêm mới người dùng");
                PageInfo.prepareAndForward(req, resp, PageType.SITE_USER_MANAGER);
            }
        }
    } public void doUpdateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String method = req.getMethod();
        User userUpdate = new User();
        String id = req.getParameter("username");
        UserDAO userDAO = new UserDAO();
        if (method.equalsIgnoreCase("post")){
            try {
                userUpdate = userDAO.findById(id);
                BeanUtils.populate(userUpdate, req.getParameterMap());
                userDAO.update(userUpdate);
                resp.sendRedirect(req.getContextPath()+"/admin/user-manager");
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("msg", "Lỗi cập nhật người dùng");
                PageInfo.prepareAndForward(req, resp, PageType.SITE_USER_MANAGER);
            }
        }
    }
}
