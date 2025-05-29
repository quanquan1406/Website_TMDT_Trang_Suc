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

@WebServlet("/sort-product")
public class SortProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy tham số sortOrder từ request (nếu có)
        String sortOrder = request.getParameter("sortOrder");

        // Lấy danh sách sản phẩm đã sắp xếp
        List<Product> products = productDAO.getAllProducts(sortOrder);

        // Đưa danh sách sản phẩm vào request để hiển thị trong JSP
        request.setAttribute("products", products);
        request.getRequestDispatcher("admin/products/list.jsp").forward(request, response);
    }
}