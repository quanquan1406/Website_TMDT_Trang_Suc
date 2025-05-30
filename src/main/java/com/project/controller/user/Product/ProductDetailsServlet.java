package com.project.controller.user.Product;


import com.project.model.DAO.ProductDAO;
import com.project.model.Product;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/product-details")
public class ProductDetailsServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = productDAO.getProductById(productId);

        if (product == null) {
            response.sendRedirect("user/product/Products.jsp"); // Quay lại danh sách sản phẩm nếu không tìm thấy
            return;
        }

        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/product/ProductDetails.jsp");
        dispatcher.forward(request, response);
    }
}
