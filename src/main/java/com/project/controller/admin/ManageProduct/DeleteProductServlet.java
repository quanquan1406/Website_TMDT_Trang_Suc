package com.project.controller.admin.ManageProduct;

import com.project.model.DAO.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
       // Lấy id sản phẩm từ query string
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                ProductDAO productDAO = new ProductDAO();
                boolean success = productDAO.deleteProduct(id);

                if (success) {
                    // Nếu xóa thành công, chuyển hướng về danh sách
                    response.sendRedirect(request.getContextPath() + "/listProduct");
                } else {
                    // Thêm logic nếu xóa thất bại
                    response.getWriter().println("Failed to delete product.");
                }
            } catch (NumberFormatException e) {
                response.getWriter().println("Invalid product ID.");
            }
        } else {
            response.getWriter().println("Product ID is missing.");
        }
    }
}