package servlet;

import dao.VideoDAO;
import model.Video;
import org.apache.commons.beanutils.BeanUtils;
import support.PageInfo;
import support.PageType;
import support.Support;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig
@WebServlet({
        "/admin/add-video",
        "/admin/video-manager",
        "/admin/edit-video",
        "/admin/delete-video",
})
public class ServletVideos extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        VideoDAO videoDAO = new VideoDAO();
        List<Video> listVD = new ArrayList<>();
        try {
            listVD = videoDAO.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msgFailed", "Lỗi load list video");
        }
        if (uri.contains("video-manager")) {
            request.setAttribute("listVD", listVD);
            PageInfo.prepareAndForward(request, response, PageType.SITE_VIDEO_MANAGER);
        } else if (uri.contains("edit-video")) {
            String id = request.getParameter("id");
            for (Video video : listVD) {
                if (id.equals(video.getId())) {
                    request.setAttribute("video", video);
                }
            }
            PageInfo.prepareAndForward(request, response, PageType.SITE_VIDEO_EDITOR);
        }else if (uri.contains("delete-video")){
            String id = request.getParameter("id");
            try {
                videoDAO.delete(id);
                request.setAttribute("msg", "Xóa video thành công");
                response.sendRedirect(request.getContextPath() + "/admin/video-manager");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msgFailed", "Lỗi xóa video");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        System.out.println("do post");
        String uri = request.getRequestURI();
        if (uri.contains("admin/add-video")) {
            doAddVideo(request, response);
        } else if (uri.contains("admin/edit-video")) {
            doUpdateVideo(request, response);
        }
    }

    public void doAddVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getMethod();
        Support sp = new Support();
        VideoDAO videoDAO = new VideoDAO();
        Video video = new Video();
        if (method.equalsIgnoreCase("post")) {
            try {
                String poster = sp.uploadImage(req);
                BeanUtils.populate(video, req.getParameterMap());
                video.setPoster(poster);
                videoDAO.insert(video);
                req.setAttribute("msg", "Thêm video thành công");
                resp.sendRedirect(req.getContextPath() + "/home");
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("msgFailed", "Lỗi thêm video");
            }
        }
    }

    public void doUpdateVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getMethod();
        Support sp = new Support();
        VideoDAO videoDAO = new VideoDAO();
        Video video = new Video();
        if (method.equalsIgnoreCase("post")) {
            try {
                String poster = sp.uploadImage(req);
                BeanUtils.populate(video, req.getParameterMap());
                video.setPoster(poster);
                videoDAO.update(video);
                System.out.println(video.getPoster());
                req.setAttribute("msg", "Cập nhật video thành công");

            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("msgFailed", "Lỗi cập nhật video");
            }
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }
}
