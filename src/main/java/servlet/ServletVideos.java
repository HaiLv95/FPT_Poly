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
import java.util.List;

@MultipartConfig
@WebServlet({
        "/admin/add-video",
        "/admin/video-manager",
        "/admin/edit-video",
})
public class ServletVideos extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        VideoDAO videoDAO = new VideoDAO();
        if (uri.contains("video-manager")){
            try {
                List<Video> listVD = videoDAO.findAll();
                request.setAttribute("listVD", listVD);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msgFailed", "Lỗi load list video");
            }
            PageInfo.prepareAndForward(request, response, PageType.SITE_VIDEO_MANAGER);
        }else if (uri.contains("edit-video")){
            PageInfo.prepareAndForward(request, response, PageType.SITE_VIDEO_EDITOR);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uri = request.getRequestURI();
        if (uri.contains("admin/add-video")){
            doAddVideo(request, response);
        }
    }
    public  void doAddVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String method = req.getMethod();
        Support sp = new Support();
        VideoDAO videoDAO = new VideoDAO();
        Video video = new Video();
        if (method.equalsIgnoreCase("post")){
            try {
                String poster = sp.uploadImage(req);
                BeanUtils.populate(video, req.getParameterMap());
                video.setPoster(poster);
                System.out.println("video ID: " + video.getId() + "/ title: " + video.getTitle() + "/ description: " + video.getTitle() + "/ poster: " + video.getPoster());
                videoDAO.insert(video);
                req.setAttribute("msg", "Thêm video thành công");
                resp.sendRedirect(req.getContextPath() + "/home");
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("msgFailed", "Lỗi thêm video");
            }
        }
    }
}
