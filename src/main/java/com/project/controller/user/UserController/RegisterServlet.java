package com.project.controller.user.UserController;

import com.project.model.User;
import com.project.model.DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO((Connection) getServletContext().getAttribute("DBConnection"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phone_number");
        String fullname = request.getParameter("fullname");
        int gender = Integer.parseInt(request.getParameter("gender"));

        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone_number(phoneNumber);
        user.setFullname(fullname);
        user.setGender(gender);

        if (userDAO.registerUser(user)) {
            response.sendRedirect(request.getContextPath() +"/user/LaR/dangnhap.jsp");  // Chuyển hướng đến trang login nếu đăng ký thành công
        } else {
            response.sendRedirect(request.getContextPath() +"/user/LaR/dangki.jsp?error=true");  // Quay lại trang đăng ký nếu có lỗi
        }
    }
}
