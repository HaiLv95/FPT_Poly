package support;

import org.apache.commons.collections.map.HashedMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class PageInfo {
    public static Map<PageType, PageInfo> pageRoute = new HashedMap();
    static {
//		sử dụng hash map để map key là pagetype và value là thông tin page gồm có title, contentUrl, scriptUrl
        pageRoute.put(PageType.SITE_HOME, new PageInfo("Home", "/views/user/content-home.jsp"));
        pageRoute.put(PageType.SITE_REGISTER_USER, new PageInfo("Register", "/views/user/sign-up.jsp"));
        pageRoute.put(PageType.SITE_SIGNIN_USER, new PageInfo("Sign in", "/views/user/sign-in.jsp"));
        pageRoute.put(PageType.SITE_EDIT_PROFILE, new PageInfo("Edit-Profile", "/views/user/edit-profile.jsp"));
        pageRoute.put(PageType.SITE_CHANGE_PASSWORD, new PageInfo("Change-Password", "/views/user/change-password.jsp"));
        pageRoute.put(PageType.SITE_FORGOT_PASSWORD, new PageInfo("Forgot-Password", "/views/user/forgot-password.jsp"));
        pageRoute.put(PageType.SITE_VIDEO_MANAGER, new PageInfo("Videos Manager", "/views/admin/video-manager.jsp"));
        pageRoute.put(PageType.SITE_VIDEO_EDITOR, new PageInfo("Videos Editor", "/views/admin/video-editor.jsp"));
        pageRoute.put(PageType.SITE_VIEW_VIDEO, new PageInfo("View", "/views/user/content-view.jsp"));
        pageRoute.put(PageType.SITE_MYFAVORITES, new PageInfo("My Favorite", "/views/user/favoritelist.jsp"));
        pageRoute.put(PageType.SITE_USER_MANAGER, new PageInfo("User manager", "/views/admin/user-manager.jsp"));
        pageRoute.put(PageType.SITE_USER_EDITOR, new PageInfo("User Editor", "/views/admin/user-editor.jsp"));
        pageRoute.put(PageType.SITE_REPORTS_FAVORITES, new PageInfo("Report", "/views/admin/favorite-list.jsp"));
        pageRoute.put(PageType.SITE_REPORTS_FAVORITE_USERS, new PageInfo("Report", "/views/admin/favorite-user.jsp"));
        pageRoute.put(PageType.SITE_REPORTS_SHARED_FRIEND, new PageInfo("Report", "/views/admin/shared-friend.jsp"));
    }

    public static void prepareAndForward(HttpServletRequest req, HttpServletResponse resp, PageType pageType) throws ServletException, IOException {
        PageInfo page = pageRoute.get(pageType);
        req.setAttribute("page", page);
        req.getRequestDispatcher("/views/user/home.jsp").forward(req, resp);
    }


    private String title, contentUrl;

    public PageInfo(String title, String contentUrl) {
        super();
        this.title = title;
        this.contentUrl = contentUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContentUrl() {
        return contentUrl;
    }

    public void setContentUrl(String contentUrl) {
        this.contentUrl = contentUrl;
    }

}
