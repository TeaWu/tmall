package servlet;

import bean.Product;
import bean.ProductImage;
import service.ProductImageService;
import service.ProductService;
import util.ParseUploadUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author littlestar
 */
@WebServlet(name = "ProductImageServlet", value = "/productImage.servlet")
public class ProductImageServlet extends BaseServlet {
    private final ProductImageService service = new ProductImageService();

    public String list(HttpServletRequest request, HttpServletResponse response) {
        int pid = Integer.parseInt(request.getParameter("pid"));
        List<ProductImage> topImages = service.listTopImage(pid, 0, Short.MAX_VALUE);
        List<ProductImage> detailImages = service.listDetailImage(pid, 0, Short.MAX_VALUE);
        Product product = new ProductService().get(pid);
        request.setAttribute("topImages", topImages);
        request.setAttribute("detailImages", detailImages);
        request.setAttribute("product", product);
        return "jsp/admin/listProductImage.jsp";
    }

    public String addUpdate(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> params = new HashMap<>();
        InputStream is = ParseUploadUtil.parseUpload(request, params);
        int pid = Integer.parseInt(params.get("pid"));
        String type = params.get("type");
        ProductImage productImage = new ProductImage();
        productImage.setProduct(new ProductService().get(pid));
        productImage.setType(type);
        service.add(productImage);
        byte[] imgData = new byte[1024 * 1024 * 10];
        String imgPath = request.getServletContext().getRealPath("pictures/product");
        File file = new File(imgPath, productImage.getId() + ".jpg");
        file.getParentFile().mkdirs();
        int length = 0;
        try (FileOutputStream fos = new FileOutputStream(file)) {
            while ((length = is.read(imgData)) != -1) {
                fos.write(imgData, 0, length);
            }
            fos.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "@" + request.getServletContext().getContextPath() + "/admin/productImage_list?pid=" + pid;
    }

    public String delete(HttpServletRequest request, HttpServletResponse response) {
        int piid = Integer.parseInt(request.getParameter("piid"));
        int pid = Integer.parseInt(request.getParameter("pid"));
        service.delete(piid);
        return "@" + request.getServletContext().getContextPath() + "/admin/productImage_list?pid=" + pid;
    }
}
