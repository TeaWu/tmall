package servlet;

import bean.*;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringEscapeUtils;
import service.*;
import util.Pagination;
import util.PaginationUtil;
import util.PasswordUtil;
import util.ProductSort;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author littlestar
 */
@SuppressWarnings("deprecation")
@WebServlet(name = "FrontServlet", value = "/front.servlet")
public class FrontServlet extends BaseServlet {
    public String home(HttpServletRequest request, HttpServletResponse response) {
        CategoryService categoryService = new CategoryService();
        List<Category> categories = categoryService.listInHome();
        request.setAttribute("categories", categories);
        List<Integer> countList = categoryService.getCategoryCount(categories);
        request.setAttribute("countList", countList);
        //获取商品列表
        List<Product> products = new ProductService().list();
        request.setAttribute("products", products);
        if (request.getSession().getAttribute("user") != null) {
            User user = (User) request.getSession().getAttribute("user");
            List<CartItem> cartItems = new CartItemService().listByUser(user.getId());
            request.getSession().setAttribute("cartListCount", cartItems.size());
        }
        //return "jsp/home.jsp";
        return "template/web/index.jsp";
    }

    /**
     * 商城
     */
    public String shop(HttpServletRequest request, HttpServletResponse response) {
        CategoryService categoryService = new CategoryService();
        //获取商品列表
        List<Category> categories = categoryService.listInHome();
        request.setAttribute("categories", categories);
        List<Product> products = new ProductService().list();
        request.setAttribute("products", products);
        request.setAttribute("productTotalNum", products.size());
        List<Integer> countList = categoryService.getCategoryCount(categories);
        request.setAttribute("countList", countList);
        //获取分页
        Pagination pagination = PaginationUtil.createPagination(request, products.size());
        request.setAttribute("pagination", pagination);

        return "template/web/shop.jsp";
    }

    /**
     * 个人中心
     */
    public String me(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return "template/web/login.jsp";
        }
        request.setAttribute("user", user);
        return "template/web/me.jsp";
    }

    /**
     * 我的留言
     */
    public String message(HttpServletRequest request, HttpServletResponse response) {
        MessageService messageService = new MessageService();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return "template/web/login.jsp";
        }
        List<Message> messages = messageService.get(user.getId());
        request.setAttribute("messages", messages);
        request.setAttribute("user", user);
        return "template/web/message.jsp";
    }

    /**
     * 公告
     */
    public String notice(HttpServletRequest request, HttpServletResponse response) {
        NoticeService noticeService = new NoticeService();
        List<Notice> notices = noticeService.list();
        request.setAttribute("notices", notices);
        return "template/web/notice.jsp";
    }

    public String shopBy(HttpServletRequest request, HttpServletResponse response) {
        //获取商品列表
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Product> products = new ProductService().listByCategory(cid);
        request.setAttribute("products", products);
        request.setAttribute("productTotalNum", products.size());
        //获取分页
        Pagination pagination = PaginationUtil.createPagination(request, products.size());
        request.setAttribute("pagination", pagination);
        return "template/web/shop.jsp";
    }

    public String shopBySearch(HttpServletRequest request, HttpServletResponse response) {
        //获取商品列表
        String keyword = request.getParameter("keyword");
        String sort = request.getParameter("sort");
        List<Product> products = new ProductService().listBySearch(keyword, 0, 20);
        keyword = StringEscapeUtils.escapeHtml4(keyword);
        request.setAttribute("keyword", keyword);
        request.setAttribute("products", products);
        request.setAttribute("productTotalNum", products.size());
        //获取分页
        Pagination pagination = PaginationUtil.createPagination(request, products.size());
        request.setAttribute("pagination", pagination);
        return "template/web/shop.jsp";
    }

    /**
     * 个人中心
     */
    public String personal(HttpServletRequest request, HttpServletResponse response) {
        //获取商品列表

        return "template/web/personal.jsp";
    }

    public String register(HttpServletRequest request, HttpServletResponse response) {
        return "jsp/register.jsp";
    }

    public String registerAdd(HttpServletRequest request, HttpServletResponse response) {
        String refer = request.getParameter("refer");
        request.setAttribute("refer", refer);
        String failUrl = "jsp/register.jsp";
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        name = StringEscapeUtils.escapeHtml4(name);
        password = PasswordUtil.encryptPassword(password);
        boolean exist = new UserService().isExist(name);
        if (exist) {
            request.setAttribute("msg", "用户名已经被使用了，请换一个用户名吧");
            return "%nameFail";
        }
        if (name.isEmpty() || password.isEmpty()) {
            request.setAttribute("msg", "用户名或密码不能为空");
            return "%infoFail";
        }
        User user = new User();
        user.setName(name);
        user.setPassword(password);
        new UserService().add(user);
        return "%success";
    }

    /**
     * 忘记密码
     */
    public String forget(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        name = StringEscapeUtils.escapeHtml4(name);
        oldPassword = StringEscapeUtils.escapeHtml4(oldPassword);
        oldPassword = PasswordUtil.encryptPassword(oldPassword);
        newPassword = StringEscapeUtils.escapeHtml4(newPassword);
        newPassword = PasswordUtil.encryptPassword(newPassword);
        User user = new UserService().get(name, oldPassword);
        if (user == null) {
            return "%Fail";
        }
        user.setPassword(newPassword);
        new UserService().update(user);
        return "%success";
    }

    public String login(HttpServletRequest request, HttpServletResponse response) {
        return "template/web/login.jsp";
    }

    public String loginIn(HttpServletRequest request, HttpServletResponse response) {
        String refer = request.getParameter("refer");
        String name = request.getParameter("name");
        name = StringEscapeUtils.escapeHtml4(name);
        String password = request.getParameter("password");
        password = StringEscapeUtils.escapeHtml4(password);
        password = PasswordUtil.encryptPassword(password);
        User user = new UserService().get(name, password);
        if (user == null) {
            request.setAttribute("msg", "用户名或密码错误");
            request.setAttribute("refer", refer);
            return "%fail";
        }
        request.getSession().setAttribute("user", user);
        //获取购物车信息
        List<CartItem> cartItems = new CartItemService().listByUser(user.getId());
        request.getSession().setAttribute("cartListCount", cartItems.size());
        if (refer == null || "".equals(refer)) {
            refer = request.getServletContext().getContextPath();
        }
        return "%success";
    }

    public String checkLogin(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        return null == user ? "%fail" :"%success";
    }

    public String logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute("user");
        return "%success";
    }

    public String product(HttpServletRequest request, HttpServletResponse response) {
        int pid = Integer.parseInt(request.getParameter("pid"));
        Product product = new ProductService().get(pid);
        List<Comment> comments = new CommentService().list(pid);
        List<ProductImage> topImages = new ProductImageService().listTopImage(pid, 0, 5);
        List<ProductImage> detailImages = new ProductImageService().listDetailImage(pid, 0, Short.MAX_VALUE);
        Map<Property, PropertyValue> propertyValues = new PropertyService().list(product);
        List<Category> categories = new CategoryService().list(0, 4);
        request.setAttribute("product", product);
        request.setAttribute("comments", comments);
        request.setAttribute("pvs", propertyValues);
        request.setAttribute("topImages", topImages);
        request.setAttribute("detailImages", detailImages);
        request.setAttribute("categories", categories);
        //return "jsp/product.jsp";

        CategoryService categoryService = new CategoryService();
        //获取商品列表
        List<Category> categories1 = categoryService.listInHome();
        request.setAttribute("categories", categories1);
        List<Integer> countList = categoryService.getCategoryCount(categories1);
        request.setAttribute("countList", countList);
        return "template/web/shop-detail.jsp";
    }

    public String category(HttpServletRequest request, HttpServletResponse response) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        String sort = request.getParameter("sort");
        List<Product> products = new ProductService().listByCategory(cid);
        ProductSort.sort(products, sort);
        request.setAttribute("products", products);
        request.setAttribute("category", new CategoryService().get(cid));
        request.setAttribute("categories", new CategoryService().list(0, 7));
        return "jsp/category.jsp";
    }

    public String search(HttpServletRequest request, HttpServletResponse response) {
        String keyword = request.getParameter("keyword");
        String sort = request.getParameter("sort");
        List<Product> products = new ProductService().listBySearch(keyword, 0, 20);
        keyword = StringEscapeUtils.escapeHtml4(keyword);
        request.setAttribute("keyword", keyword);
        request.setAttribute("products", products);
        ProductSort.sort(products, sort);
        request.setAttribute("categories", new CategoryService().list(0, 7));
        return "jsp/search.jsp";
    }

    public String buyOne(HttpServletRequest request, HttpServletResponse response) {
        //客户下单，在session里面而不是在数据库里面注册一个cartItem项目，打上标示跳转到下单页面
        int pid = Integer.parseInt(request.getParameter("pid"));
        int num = Integer.parseInt(request.getParameter("num"));
        Product product = new ProductService().get(pid);
        User user = (User) request.getSession().getAttribute("user");
        CartItem cartItem = new CartItem();
        cartItem.setUser(user);
        cartItem.setProduct(product);
        cartItem.setNumber(num);
        cartItem.setSum(cartItem.getProduct().getNowPrice().multiply(new BigDecimal(cartItem.getNumber())));
        request.getSession().setAttribute("tempCartItem", cartItem);
        //-1的话提醒buy页面从session取cartItem而不是从数据里面拿
        return "@buy?cartItemId=-1";
    }

    public String buy(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        String[] cartItemIds = request.getParameterValues("cartItemId");
        String[] cartItemIdStrings = request.getParameterValues("cartItemId");
        List<CartItem> cartItems = new ArrayList<>();
        BigDecimal total = new BigDecimal(0);
        for (String cartItemIdString : cartItemIdStrings) {
            int cartItemId = Integer.parseInt(cartItemIdString);
            if (cartItemId == -1) {
                //点的是立即购买，从session里面拿cartItem
                CartItem cartItem = (CartItem) request.getSession().getAttribute("tempCartItem");
                total = total.add(cartItem.getSum());
                cartItem.setId(-1);
                cartItems.add(cartItem);
                break;
            } else {//从购物车中来的
                List<CartItem> userList = new CartItemService().listByUser(user.getId());
                for (CartItem userItem : userList) {
                    //判断是否是该用户的订单
                    if (userItem.getId() == cartItemId) {
                        CartItem cartItem = new CartItemService().get(cartItemId);
                        total = total.add(cartItem.getSum());
                        cartItems.add(cartItem);
                        break;
                    }
                }
            }
        }
        request.getSession().setAttribute("cartItems", cartItems);
        request.getSession().setAttribute("total", total);
        //return "jsp/buy.jsp";
        return "template/web/checkout.jsp";
    }

    public String addCart(HttpServletRequest request, HttpServletResponse response) {
        //ajax请求加购物车
        int pid = Integer.parseInt(request.getParameter("pid"));
        int num = Integer.parseInt(request.getParameter("num"));
        Product product = new ProductService().get(pid);
        User user = (User) request.getSession().getAttribute("user");
        List<CartItem> cartItems = new CartItemService().listByUser(user.getId());
        request.getSession().setAttribute("cartListCount", cartItems.size());
        boolean found = false;
        //如果购物车中已经有相关项目就拿出来加数量，更新
        for (CartItem item : cartItems) {
            if (product.getId() == item.getProduct().getId()) {
                int newNum = item.getNumber() + num;
                //判断库存是否足够
                if (product.getStock() < newNum) {
                    return "%OutOfStock";
                }
                item.setNumber(newNum);
                item.setSum(item.getProduct().getNowPrice().multiply(new BigDecimal(item.getNumber())));
                new CartItemService().update(item);
                found = true;
                break;
            }
        }
        //如果购物车里面没有相关项目新建一个
        if (!found) {
            CartItem cartItem = new CartItem();
            cartItem.setUser(user);
            cartItem.setProduct(product);
            if (product.getStock() < num) {
                return "%OutOfStock";
            }
            cartItem.setNumber(num);
            cartItem.setSum(cartItem.getProduct().getNowPrice().multiply(new BigDecimal(cartItem.getNumber())));
            new CartItemService().add(cartItem);
        }
        request.getSession().setAttribute("cartListCount", cartItems.size());
        return "%success";
    }

    public String cart(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        List<CartItem> cartItems = new CartItemService().listByUser(user.getId());
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("categories", new CategoryService().list(0, 4));
        request.setAttribute("contextPath", request.getContextPath());
//        return "jsp/cart.jsp";
        return "template/web/cart.jsp";
    }

    public String changeCartNum(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (null == user) {
            return "%fail";
        }
        int ciid = Integer.parseInt(request.getParameter("ciid"));
        int num = Integer.parseInt(request.getParameter("num"));
        //判断数量是否是正数
        if (num < 0) {
            return "%fail";
        }
        List<CartItem> cartItems = new CartItemService().listByUser(user.getId());
        for (CartItem item : cartItems) {
            if (item.getId() == ciid) {
                Product product = item.getProduct();
                if (product.getStock() >= num) {
                    item.setNumber(num);
                    item.setSum(item.getProduct().getNowPrice().multiply(new BigDecimal(item.getNumber())));
                    new CartItemService().update(item);
                    return "%success";
                }
                break;
            }
        }
        return "%fail";
    }

    public String deleteCartItem(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (null == user) {
            return "%fail";
        }
        int ciid = Integer.parseInt(request.getParameter("ciid"));
        List<CartItem> cartItems = new CartItemService().listByUser(user.getId());
        for (CartItem item : cartItems) {
            if (item.getId() == ciid) {
                new CartItemService().delete(ciid);
                cartItems = new CartItemService().listByUser(user.getId());
                request.setAttribute("cartItems", cartItems);

                return "%success";
            }
        }
        return "%fail";
    }

    public String updateReceiverInfo(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (null == user) {
            return "%fail";
        }
        String receiver = request.getParameter("receiver");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        new UserService().updateReceiverInfo(receiver, mobile, address, user.getId());
        User newInfoUser = new UserService().get(user.getId());
        request.getSession().setAttribute("user", newInfoUser);
        return "%success";
    }


    @SuppressWarnings("unchecked")
    public String createOrder(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        List<CartItem> cartItems = (List<CartItem>) request.getSession().getAttribute("cartItems");
        String address = request.getParameter("address");
        String receiver = request.getParameter("receiver");
        String mobile = request.getParameter("mobile");
        Order order = new Order();
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSS").format(new Date()) + RandomUtils.nextInt();
        order.setOrderCode(orderCode);
        order.setAddress(address);
        order.setReceiver(receiver);
        order.setMobile(mobile);
        order.setCreateDate(new Date());
        order.setUser(user);
        order.setStatus(OrderService.OrderType.WAIT_PAY);
        BigDecimal sum = new BigDecimal(0);
        for (CartItem item : cartItems) {
            sum = sum.add(item.getSum());
        }
        order.setSum(sum);
        new OrderService().add(order);
        for (CartItem item : cartItems) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setNumber(item.getNumber());
            orderItem.setProduct(item.getProduct());
            orderItem.setSum(item.getSum());
            new CartItemService().delete(item.getId());
            new OrderItemService().add(orderItem);
        }
        /* return "@pay?oid=" + order.getId(); */
        return "%pay?oid=" + order.getId();
    }

    public String pay(HttpServletRequest request, HttpServletResponse response) {
        int orderId = Integer.parseInt(request.getParameter("oid"));
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orders = new OrderService().list(user.getId());
        for (Order item : orders) {
            if (orderId == item.getId()) {
                request.setAttribute("order", item);
                return "template/web/pay.jsp";
            }
        }
        return "@/";
    }

    public String payed(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orders = new OrderService().list(user.getId());
        int orderId = Integer.parseInt(request.getParameter("oid"));
        for (Order item : orders) {
            if (orderId == item.getId()) {
                item.setPayDate(new Date());
                item.setStatus(OrderService.OrderType.WAIT_DELIVERY);
                new OrderService().update(item);
                request.setAttribute("order", item);
                return "template/web/payOk.jsp";
            }
        }
        return "@/";
    }

    /**
     * 个人中心
     */
    public String myOrder(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orders = new OrderService().list(user.getId());
        request.setAttribute("orders", orders);
        request.setAttribute("contextPath", request.getContextPath());
//        return "jsp/myOrder.jsp";
        return "template/web/meOrder.jsp";
    }

    public String confirmPay(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orders = new OrderService().list(user.getId());
        int oid = Integer.parseInt(request.getParameter("oid"));
        for (Order order : orders) {
            if (order.getId() == oid) {
                request.setAttribute("order", order);
                return "template/web/comfirePay.jsp";
            }
        }
        return "@/";
    }

    public String confirmed(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orders = new OrderService().list(user.getId());
        int oid = Integer.parseInt(request.getParameter("oid"));
        for (Order order : orders) {
            if (order.getId() == oid) {
                order.setConfirmDate(new Date());
                order.setStatus(OrderService.OrderType.WAIT_REVIEW);
                new OrderService().update(order);
                request.setAttribute("order", order);
                return "template/web/comfire.jsp";
            }
        }
        return "@/";
    }

    public String cancel(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orders = new OrderService().list(user.getId());
        int oid = Integer.parseInt(request.getParameter("oid"));
        for (Order order : orders) {
            if (order.getId() == oid) {
                order.setStatus(OrderService.OrderType.CANCEL);
                new OrderService().update(order);
                return "@myOrder";
            }
        }
        return "@/";
    }

    public String deleteOrder(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orders = new OrderService().list(user.getId());
        int oid = Integer.parseInt(request.getParameter("oid"));
        for (Order order : orders) {
            if (order.getId() == oid) {
                new OrderService().delete(oid);
                return "%success";
            }
        }
        return "%fail";
    }

    public String comment(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orders = new OrderService().list(user.getId());
        int oiid = Integer.parseInt(request.getParameter("oiid"));
        for (Order order : orders) {
            for (OrderItem item : order.getOrderItems()) {
                if (oiid == item.getId()) {
                    request.setAttribute("orderItem", item);
                    request.setAttribute("order", order);
                    return "template/web/comment.jsp";
                }
            }
        }
        return "@/";
    }

    public String addComment(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orders = new OrderService().list(user.getId());
        int oiid = Integer.parseInt(request.getParameter("oiid"));
        for (Order order : orders) {
            for (OrderItem item : order.getOrderItems()) {
                if (oiid == item.getId()) {
                    int allCount = 0;
                    int hasComment = 0;
                    for (OrderItem item2 : order.getOrderItems()) {
                        Comment comment = new CommentService().get(item2.getProduct().getId(), user.getId());
                        allCount++;
                        if (comment != null) {
                            hasComment++;
                        }
                    }
                    Comment comment = new Comment();
                    comment.setContent(request.getParameter("content"));
                    comment.setCreateDate(new Date());
                    comment.setProduct(item.getProduct());
                    comment.setUser(user);
                    new CommentService().add(comment);
                    if (allCount - hasComment == 1) {
                        order.setStatus(OrderService.OrderType.FINISH);
                        new OrderService().update(order);
                    }
                    return "@myOrder";
                }

            }
        }
        return "@/";
    }

    public String delivery(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orders = new OrderService().list(user.getId());
        int oid = Integer.parseInt(request.getParameter("oid"));
        for (Order order : orders) {
            if (order.getId() == oid) {
                order.setDeliverDate(new Date());
                order.setStatus(OrderService.OrderType.WAIT_CONFIRM);
                new OrderService().update(order);
                return "@myOrder";
            }
        }
        return "@/";
    }

    public String cartNumber(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        int number = new CartItemService().getTotal(user.getId());
        return "%" + number;
    }

    public String leaveMessage(HttpServletRequest request, HttpServletResponse response) {
        MessageService service = new MessageService();
        User user = (User) request.getSession().getAttribute("user");
        String content = request.getParameter("content");
        Message message = new Message();
        message.setUser(user);
        message.setContent(content);
        message.setCreateDate(new Date());
        service.leave(message);
        return "%success";
    }
}
