package com.project.controller.user.UserController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/user-controller/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy session hiện tại
        HttpSession session = request.getSession(false); // Tránh tạo session mới nếu không tồn tại

        if (session != null) {
            session.invalidate(); // Hủy session hiện tại
        }

        // Chuyển hướng về trang đăng nhập
        response.sendRedirect(request.getContextPath() + "/user/LaR/dangnhap.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý POST tương tự như GET
        doGet(request, response);
    }
}
