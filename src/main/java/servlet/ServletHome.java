package servlet;

import dao.VideoDAO;
import model.Video;
import support.PageInfo;
import support.PageType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({
        "/home",
        "/",
        "/next",
        "/pre",
        "/fist",
        "/last"
})
public class ServletHome extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        VideoDAO videoDAO = new VideoDAO();
        String uri = request.getRequestURI();

        try {
            List<Video> listAll = videoDAO.findAllVDActive();
            List<Video> listVD = new ArrayList<>();
            if (listAll.size() > 0) {
                int maxPage = listAll.size() / 8;
                if (listAll.size() % 8 > 0){
                    maxPage ++;
                }
                if (uri.endsWith("/") || uri.contains("/home")) {
                    request.setAttribute("pageNum", 1);
                    listVD = videoDAO.findPage(0, 8);
                    System.out.println("list size " + listAll. size() + "/ list vd " + listVD.size());
                } else if (uri.contains("fist")) {
                    request.setAttribute("pageNum", 1);
                    listVD = videoDAO.findPage(0, 8);
                    request.setAttribute("pageNum", 1);
                } else if (uri.contains("last")) {
                    listVD = videoDAO.findPage((maxPage - 1) * 8, 8);
                    request.setAttribute("pageNum", maxPage);
                } else if (uri.contains("next")) {
                    int pageNum = Integer.parseInt(request.getParameter("pageNum"));
                    if (pageNum < maxPage) {
                        listVD = videoDAO.findPage((pageNum * 8), 8);
                    } else {
                        listVD = videoDAO.findPage((maxPage) * 8, 8);
                    }
                    pageNum = pageNum + 1;
                    request.setAttribute("pageNum", pageNum);
                } else if (uri.contains("pre")) {
                    int pageNum = Integer.parseInt(request.getParameter("pageNum"));
                    pageNum = pageNum - 1;
                    if (pageNum > 1) {
                        listVD = videoDAO.findPage((pageNum * 8), 8);
                    } else {
                        listVD = videoDAO.findPage(0, 8);
                    }

                    request.setAttribute("pageNum", pageNum);
                }
                request.setAttribute("listVD", listVD);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msgFailed", "có lỗi xảy ra khi load trang chủ");
        }
        PageInfo.prepareAndForward(request, response, PageType.SITE_HOME);
    }
}
