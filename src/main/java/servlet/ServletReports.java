package servlet;

import dao.FavoriteDAO;
import dao.ReportDAO;
import model.Favorite;
import model.ReportFavoriteUsers;
import model.ReportFavorites;
import model.ReportSharedFriend;
import support.PageInfo;
import support.PageType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({
        "/admin/reports-favorites",
        "/admin/reports-favorite-users",
        "/admin/reports-shared-friend",
})
public class ServletReports extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        ReportDAO rpDAO = new ReportDAO();
        String uri = request.getRequestURI();
        if (uri.contains("reports-favorites")) {
            List<ReportFavorites> listFV = rpDAO.getReportFavorites();
            request.setAttribute("listFV", listFV);
            PageInfo.prepareAndForward(request, response, PageType.SITE_REPORTS_FAVORITES);
        } else if (uri.contains("reports-favorite-users")) {
            List<ReportFavorites> listFV = rpDAO.getReportFavorites();
            request.setAttribute("listFV", listFV);
            PageInfo.prepareAndForward(request, response, PageType.SITE_REPORTS_FAVORITE_USERS);
        } else if (uri.contains("reports-shared-friend")) {
            List<ReportSharedFriend> listSF = rpDAO.listSharedFriend();
            request.setAttribute("listSF", listSF);
            PageInfo.prepareAndForward(request, response, PageType.SITE_REPORTS_SHARED_FRIEND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String url = request.getRequestURI();
        if (url.contains("reports-favorite-users")) {
            reportFavoriteUser(request, response);
        }else if (url.contains("reports-shared-friend")){
            reportSharedUser(request, response);
        }
    }

    public void reportFavoriteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getMethod();

        ReportDAO rpDAO = new ReportDAO();
        if (method.equalsIgnoreCase("post")) {
            String title = request.getParameter("title");
            request.setAttribute("title", title);
            List<ReportFavoriteUsers> listFVTitle = rpDAO.findfavoriteUser(title);
            request.setAttribute("listFVTitle", listFVTitle);
            doGet(request, response);
        }
    }
    public void reportSharedUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String method = request. getMethod();
        ReportDAO rpDAO = new ReportDAO();
        String title = request.getParameter("title");
        if (method.equalsIgnoreCase("post")){
            List<ReportSharedFriend> listSFByTitle = new ArrayList<>();
            listSFByTitle = rpDAO.findShared(title);
            request.setAttribute("listSFByTitle", listSFByTitle);
            request.setAttribute("title", title);
            doGet(request, response);
        }
    }
}
