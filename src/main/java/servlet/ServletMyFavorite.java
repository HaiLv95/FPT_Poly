package servlet;

import dao.LikeDAO;
import dao.VideoDAO;
import model.Favorite;
import model.User;
import model.Video;
import support.PageInfo;
import support.PageType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet({
        "/user/myfavorite",
        "/user/unlike"
})
public class ServletMyFavorite extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        String userID = request.getParameter("userid");
        LikeDAO likeDAO = new LikeDAO();
        if (uri.contains("myfavorite")) {
            try {
                List<Video> myFavorites = likeDAO.myFavorite(userID);
                request.setAttribute("myFavorites", myFavorites);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msgFailed", "Lỗi load my favorite");
            }
            PageInfo.prepareAndForward(request, response, PageType.SITE_MYFAVORITES);
        }else  if (uri.contains("unlike")){
            doUnlike(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public void doUnlike(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String videoID = request.getParameter("id");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        VideoDAO videoDAO = new VideoDAO();
        LikeDAO likeDAO = new LikeDAO();
        try {
            Video video = videoDAO.findById(videoID);
            List<Favorite> listCheck = likeDAO.CheckLike(user.getUsername(), videoID);
           if (listCheck.size() > 0){
               likeDAO.delete(listCheck.get(0).getId());
           }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/user/myfavorite?userid=" + user.getUsername());
    }
}
