package com.project.controller.user.UserController;

import com.project.model.User;
import com.project.model.DAO.UserDAO;
import com.project.model.Admin;
import com.project.model.DAO.AdminDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;
    private AdminDAO adminDAO;

    @Override
    public void init() {
        userDAO = new UserDAO((Connection) getServletContext().getAttribute("DBConnection"));
        adminDAO = new AdminDAO((Connection) getServletContext().getAttribute("DBConnection"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emailOrUsername = request.getParameter("emailOrUsername");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        // Kiểm tra nếu người dùng là admin
        Admin admin = adminDAO.loginAdmin(emailOrUsername, password);
        if (admin != null) {
            session.setAttribute("admin", admin);
            response.sendRedirect(request.getContextPath() +"/admin/dashboard.jsp");  // Chuyển tới dashboard admin
            return;
        }

        // Nếu không, kiểm tra người dùng thường
        User user = userDAO.loginUser(emailOrUsername, password);
        if (user != null) {
            session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() +"/index.jsp");  // Chuyển tới trang chủ người dùng
        } else {
            response.sendRedirect(request.getContextPath() +"/user/LaR/dangnhap.jsp?error=true");  // Quay lại trang login nếu thất bại
        }
    }
}
