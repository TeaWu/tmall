package servlet;

import bean.Config;
import service.ConfigService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


/**
 * @author Dream-Rain
 */
@WebServlet(name = "ConfigServlet", value = "/config.servlet")
public class ConfigServlet extends BaseServlet {
    private final ConfigService service = new ConfigService();

    public String list(HttpServletRequest request, HttpServletResponse response) {
        List<Config> configs = service.list();
        request.getSession().setAttribute("configs", configs);
        return "jsp/admin/listConfig.jsp";
    }

    public String addUpdate(HttpServletRequest request, HttpServletResponse response) {
        String[] value = request.getParameterValues("value");
        String[] id = request.getParameterValues("id");
        Config l = null;
        for (int i = 0; i < value.length; i++) {
            l = new Config();
            l.setId(Integer.parseInt(id[i]));
            l.setValue(value[i]);
            service.update(l);
        }
        return "@" + request.getServletContext().getContextPath() + "/admin/config_list";
    }

    public String link(HttpServletRequest request, HttpServletResponse response) {
        return "jsp/admin/editLogo.jsp";
    }
}
