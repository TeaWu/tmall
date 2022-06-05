package servlet;

import bean.User;
import service.UserService;
import util.Pagination;
import util.PaginationUtil;
import util.ParseUploadUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /**
     * littlestar : 删除用户
     */
    public String delete(HttpServletRequest request, HttpServletResponse response) {
        service.delete(Integer.parseInt(request.getParameter("uid")));
        return "@" + request.getServletContext().getContextPath() + "/admin/user_list";
    }

    /**
     * littlestar : 修改用户
     * todo : 实现修改用户
     */
    public String edit(HttpServletRequest request, HttpServletResponse response) {
        int uid = Integer.parseInt(request.getParameter("uid"));
        User user = service.get(uid);
        request.setAttribute("user", user);
        return "jsp/admin/ListUser.jsp";
    }

    /**
     * littlestar : 获取用户信息
     * todo : 实现信息显示
     */
    public String List(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        user = service.get(user.getId());
        request.setAttribute("user", user);
        return "template/web/me.jsp";
    }

    /**
     * littlestar : 获取用户信息并选择修改
     * todo : 实现信息修改
     */
    public String editUser(HttpServletRequest request, HttpServletResponse response) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        User u = service.get(cid);
        request.setAttribute("u", u);
        return "template/web/editUser.jsp";
    }

    /**
     * littlestar : 修改用户
     * todo : 实现用户修改个人信息
     */
    public String Update(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> params = new HashMap<>();
        InputStream is = ParseUploadUtil.parseUpload(request, params);
        String id = params.get("id");
        String receiver = params.get("receiver");
        String name = params.get("name");
        String mobile = params.get("mobile");
        String address = params.get("address");
        User c = null;
        c=service.get(Integer.parseInt(id));
        c.setName(name);
        c.setMobile(mobile);
        c.setAddress(address);
        c.setReceiver(receiver);
        service.updateUser(c);

        return "@"+request.getServletContext().getContextPath()+"/user_List";
    }
}
