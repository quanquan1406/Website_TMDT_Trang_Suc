package com.project.controller.admin.ManageProduct;

import com.project.model.DAO.ProductDAO;
import com.project.model.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/listProduct")
public class ListProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Lấy tham số "sortOrder" từ request để xác định cách sắp xếp
        String sortOrder = request.getParameter("sortOrder");

        // Lấy danh sách sản phẩm đã sắp xếp từ ProductDAO
        ProductDAO dao = new ProductDAO();
        List<Product> products = dao.getAllProducts(sortOrder);  // Truyền sortOrder vào phương thức

        // Đặt danh sách sản phẩm vào request attribute để hiển thị trên JSP
        request.setAttribute("products", products);

        // Chuyển tiếp yêu cầu đến trang JSP để hiển thị sản phẩm
        request.getRequestDispatcher("/admin/products/list.jsp").forward(request, response);
    }
}
