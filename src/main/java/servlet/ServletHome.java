package servlet;

import dao.VideoDAO;
import model.Video;
import support.PageInfo;
import support.PageType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet({
        "/home",
        "/"
})
public class ServletHome extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        VideoDAO videoDAO = new VideoDAO();
        try {
            List<Video> listVD = videoDAO.findAllVDActive();
            request.setAttribute("listVD", listVD);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msgFailed", "có lỗi xảy ra khi load trang chủ");
        }
        PageInfo.prepareAndForward(request, response, PageType.SITE_HOME);
    }
}
