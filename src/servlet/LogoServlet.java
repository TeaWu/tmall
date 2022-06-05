package servlet;

import service.ConfigService;
import util.ParseUploadUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;


/**
 * @author Dream-Rain
 */
@WebServlet(name = "LogoServlet", value = "/logo.servlet")
public class LogoServlet extends BaseServlet {
    private final ConfigService service = new ConfigService();

    public String addUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Map<String, String> params = new HashMap<>();
        InputStream is = ParseUploadUtil.parseUpload(request, params);
        File imageFolder = new File(request.getSession().getServletContext().getRealPath("images/"));
        File file = new File(imageFolder, "logo.png");
        file.getParentFile().mkdirs();
        try {
            if (is.available() > 0) {
                try (FileOutputStream fos = new FileOutputStream(file)) {
                    byte b[] = new byte[1024 * 1024 * 10];
                    int length = 0;
                    while ((length = is.read(b)) != -1) {
                        fos.write(b, 0, length);
                    }
                    fos.flush();

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "@"+request.getServletContext().getContextPath()+"/admin/config_list";
    }

    public String edit(HttpServletRequest request, HttpServletResponse response) {
        return "jsp/admin/editLogo.jsp";
    }
}
