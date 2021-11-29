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