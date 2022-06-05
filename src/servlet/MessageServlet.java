package servlet;

import bean.Message;
import bean.User;
import service.MessageService;
import util.Pagination;
import util.PaginationUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author littlestar
 */
@WebServlet(name = "MessageServlet", value = "/message.servlet")
public class MessageServlet extends BaseServlet {
    private final MessageService service = new MessageService();

    public String list(HttpServletRequest request, HttpServletResponse response) {
        Pagination pagination = PaginationUtil.createPagination(request, service.getTotal());
        List<Message> messages = service.list(pagination.getStart(), pagination.getCount());
        request.setAttribute("messages", messages);
        request.setAttribute("pagination", pagination);
        return "jsp/admin/listMessage.jsp";
    }

    /**
     * 回复留言
     */
    public String replyMessage(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        String mid = request.getParameter("mid");
        String reply = request.getParameter("reply");
        service.reply(mid, user.getId(), reply);
        return "@" + request.getServletContext().getContextPath() + "/admin/message_list";    }

    /**
     * 删除留言
     */
    public String deleteMessage(HttpServletRequest request, HttpServletResponse response) {
        String mid = request.getParameter("mid");
        service.delete(mid);
        return "@" + request.getServletContext().getContextPath() + "/admin/message_list";
    }
}
