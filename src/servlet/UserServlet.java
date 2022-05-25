package servlet;

import bean.User;
import service.UserService;
import util.Pagination;
import util.PaginationUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author littlestar
 */
@WebServlet(name = "UserServlet", value = "/user.servlet")
public class UserServlet extends BaseServlet {
    private final UserService service = new UserService();

    public String list(HttpServletRequest request, HttpServletResponse response) {
        Pagination pagination = PaginationUtil.createPagination(request, service.getTotal());
        List<User> users = service.list(pagination.getStart(), pagination.getCount());
        request.setAttribute("users", users);
        request.setAttribute("pagination", pagination);
        return "jsp/admin/listUser.jsp";
    }

    /**
     * littlestar : 冻结用户
     */
    public String freeze(HttpServletRequest request, HttpServletResponse response) {
        service.freeze(Integer.parseInt(request.getParameter("uid")));
        return "@" + request.getServletContext().getContextPath() + "/admin/user_list";
    }

    /**
     * littlestar : 解冻用户
     */
    public String unfreeze(HttpServletRequest request, HttpServletResponse response) {
        service.unfreeze(Integer.parseInt(request.getParameter("uid")));
        return "@" + request.getServletContext().getContextPath() + "/admin/user_list";
    }
}
