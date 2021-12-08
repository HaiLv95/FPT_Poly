package servlet;

import dao.LikeDAO;
import dao.SharedDAO;
import dao.VideoDAO;
import model.Favorite;
import model.Shared;
import model.User;
import model.Video;
import support.PageInfo;
import support.PageType;
import support.Support;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@WebServlet({
        "/view",
        "/user/like",
        "/user/shared",
})
public class ServletView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VideoDAO videoDAO = new VideoDAO();
        String uri = request.getRequestURI();
        if (uri.contains("view")){
            Video video = new Video();
            String id = request.getParameter("id");
            try {
                video = videoDAO.findById(id);
                if (video != null){
                    int view = video.getViews() + 1;
                    video.setViews(view);
                    videoDAO.update(video);
                    request.setAttribute("video", video);
                    List<Video> listDX = videoDAO.findTop5Video();
                    request.setAttribute("listDX", listDX);
                    PageInfo.prepareAndForward(request, response, PageType.SITE_VIEW_VIDEO);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if (uri.contains("like")){
            doLiked(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("shared")){
            doShared(request, response);
        }
    }
    public void doShared(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String method = req.getMethod();
        Support sp = new Support();
        VideoDAO videoDAO = new VideoDAO();
        String videoID = req.getParameter("videoID");
        String sharedEmail = req.getParameter("sharedEmail");
        if (method.equalsIgnoreCase("post")){
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");
            String subject = "Chia sẻ nhạc";
            String content = "Mời bạn nghe nhạc được chia sẻ bởi người dùng " + user.getFullname() + "(ID: " + user.getUsername() + ")"
                    + "\n Link: http://localhost:8080/Assignment/view?id=" + videoID;
            try {
                sp.sendEmail(sharedEmail, subject, content);
                SharedDAO sharedDAO = new SharedDAO();
                Shared shared = new Shared();
                shared.setUser(user);
                shared.setSharedDate(LocalDate.now());
                shared.setVideo(videoDAO.findById(videoID));
                shared.setEmails(sharedEmail);
                sharedDAO.insert(shared);
                req.setAttribute("msg", "Chia sẻ thành công");
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("msgFailed", "Lỗi chia sẻ");
            }
            resp.sendRedirect(req.getContextPath() +"/view?id=" + videoID);
        }
    }
    public void doLiked(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String videoID = request.getParameter("id");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        VideoDAO videoDAO = new VideoDAO();
        LikeDAO likeDAO = new LikeDAO();
        try {
            Video video = videoDAO.findById(videoID);
            Favorite like = new Favorite();
            like.setLikeDate(LocalDate.now());
            like.setUser(user);
            like.setVideo(video);
            likeDAO.insert(like);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() +"/view?id=" + videoID);
    }
}
