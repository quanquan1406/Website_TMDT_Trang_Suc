package com.project.controller.admin.ManageCategory;

import com.project.model.DAO.CategoryDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteCategory")
public class DeleteCategoryServlet extends HttpServlet {
    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {
        categoryDAO = new CategoryDAO(); // Khởi tạo DAO
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id")); // Lấy id từ request
            boolean isDeleted = categoryDAO.deleteCategory(id);

            if (isDeleted) {
                response.sendRedirect(request.getContextPath() + "/listCategory?success=1"); // Thành công
            } else {
                response.sendRedirect(request.getContextPath() + "/listCategory?error=1"); // Thất bại
            }
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/listCategory?error=1");
        }
    }
}