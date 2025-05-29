package com.project.controller.user.Product;

import com.project.model.DAO.ProductDAO;
import com.project.model.Product;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/products-user")
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy tham số "sortOrder" từ request (giả sử người dùng đã chọn cách sắp xếp)
        String sortOrder = request.getParameter("sortOrder");

        // Lấy danh sách sản phẩm đã sắp xếp
        List<Product> products = productDAO.getAllProducts(sortOrder);

        // Đặt danh sách sản phẩm vào request attribute
        request.setAttribute("products", products);

        // Chuyển tiếp yêu cầu đến trang JSP để hiển thị sản phẩm
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/product/Product.jsp");
        dispatcher.forward(request, response);
    }
}
