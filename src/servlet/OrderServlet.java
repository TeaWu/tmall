package servlet;

import bean.Order;
import service.OrderService;
import util.Pagination;
import util.PaginationUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * @author Dream-Rain
 */
@WebServlet(name = "OrderServlet", value = "/order.servlet")
public class OrderServlet extends BaseServlet {
    private final OrderService service = new OrderService();

    public String list(HttpServletRequest request, HttpServletResponse response) {
        Pagination pagination = PaginationUtil.createPagination(request, service.getTotal());
        List<Order> orders = service.list(pagination.getStart(), pagination.getCount());
        for (Order order : orders) {
            switch (order.getStatus()) {
                case "waitDelivery":
                    order.setStatus("待发货");
                    break;
                case "waitPay":
                    order.setStatus("待付款");
                    break;
                case "waitReview":
                    order.setStatus("待评价");
                    break;
                case "waitConfirm":
                    order.setStatus("待确认");
                    break;
                case "finish":
                    order.setStatus("已完成");
                    break;
                case "cancel":
                    order.setStatus("已取消");
                    break;
                default:
                    throw new IllegalStateException("Unexpected value: " + order.getStatus());
            }
        }
        request.setAttribute("orders", orders);
        request.setAttribute("pagination", pagination);
        return "jsp/admin/listOrder.jsp";
    }


    /**
     *发货
     */
    public String delivery(HttpServletRequest request, HttpServletResponse response) {
        int oid = Integer.parseInt(request.getParameter("oid"));
        Order order = service.get(oid);
        order.setStatus(OrderService.OrderType.WAIT_CONFIRM);
        order.setDeliverDate(new Date());
        service.update(order);
        return "@" + request.getServletContext().getContextPath() + "/admin/order_list";
    }

    /**
     *取消
     */

    public String cancel(HttpServletRequest request, HttpServletResponse response) {
        int oid = Integer.parseInt(request.getParameter("oid"));
        Order order = service.get(oid);
        order.setStatus(OrderService.OrderType.CANCEL);
        service.update(order);
        return "@" + request.getServletContext().getContextPath() + "/admin/order_list";
    }

    /**
     * 删除订单
     */
    public String delete(HttpServletRequest request, HttpServletResponse response) {
        int oid = Integer.parseInt(request.getParameter("oid"));
        service.delete(oid);
        return "@" + request.getServletContext().getContextPath() + "/admin/order_list";
    }
}
