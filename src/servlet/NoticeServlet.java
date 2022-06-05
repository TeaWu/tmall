package servlet;

import bean.Notice;
import bean.User;
import service.NoticeService;
import util.Pagination;
import util.PaginationUtil;
import util.ParseUploadUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author littlestar
 */
@WebServlet(name = "NoticeServlet", value = "/notice.servlet")
public class NoticeServlet extends BaseServlet {
    private final NoticeService service = new NoticeService();

    public String list(HttpServletRequest request, HttpServletResponse response) {
        Pagination pagination = PaginationUtil.createPagination(request, service.getTotal());
        List<Notice> notices = service.list();
        request.setAttribute("notices", notices);
        request.setAttribute("pagination", pagination);
        return "jsp/admin/listNotice.jsp";
    }

    public String delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("nid"));
        service.delete(id);
        return "@"+request.getServletContext().getContextPath()+"/admin/notice_list";
    }

    /**
     * 新增公告
     */
    public String addUpdate(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> params = new HashMap<>();
        InputStream is = ParseUploadUtil.parseUpload(request, params);
        String title = params.get("title");
        String content = params.get("content");
        User user = (User) request.getSession().getAttribute("user");
        Notice notice = new Notice();
        notice.setUser(user);
        notice.setTitle(title);
        notice.setContent(content);
        notice.setCreateDate(new Date());
        notice.setStatus(1);
        service.add(notice);
        return "@"+request.getServletContext().getContextPath()+"/admin/notice_list";
//        return "jsp/admin/listNotice.jsp";
    }
}